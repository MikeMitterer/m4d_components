@TestOn("chrome")
import 'package:test/test.dart';

import 'dart:html' as dom;

import 'package:m4d_core/m4d_core.dart';
import 'package:m4d_core/m4d_ioc.dart' as ioc;
import "package:m4d_components/m4d_components.dart";
import "package:m4d_components/m4d_formatter.dart";

// import 'package:logging/logging.dart';

main() async {
    // final Logger _logger = new Logger("test.Formatter.Button");

    ioc.Container.bindModules([ FormatterModule() ]);

    final renderer = new DomRenderer();
    final parent = new dom.DivElement();
    final html = '''
            <label class="mdl-radio mdl-ripple-effect" for="wifi1" mdl-formatter="uppercase(value)">
                <input type="radio" id="wifi1" class="mdl-radio__button" name="wifi[]" value="1" checked>
                <span class="mdl-radio__label">Always</span>
            </label>
    '''.trim().replaceAll(new RegExp(r"\s+")," ");

    final String htmlForLabelTest = '''
            <label class="mdl-radio mdl-ripple-effect" for="wifi1">
                <input type="radio" id="wifi1" class="mdl-radio__button" name="wifi[]" value="1" checked>
                <span class="mdl-radio__label" mdl-formatter="uppercase(value)">Always</span>
            </label>
    '''.trim().replaceAll(new RegExp(r"\s+")," ");

    group('Radio', () {
        setUp(() {
            registerMaterialRadio();
            registerMaterialFormatter();
        });
        
        test('> Uppercase', () async {
            final dom.HtmlElement element = await renderer.render(parent,html);

            await componentHandler().upgradeElement(element);
            final MaterialRadio widget = MaterialRadio.widget(element);
            expect(widget,isNotNull);

            widget.value = "Mike";
            expect(widget.value,"MIKE");

        }); // end of 'Uppercase' test

        test('> Label', () async {

            final dom.HtmlElement element = await renderer.render(parent,htmlForLabelTest);

            await componentHandler().upgradeElement(element);
            final MaterialRadio widget = MaterialRadio.widget(element);
            expect(widget,isNotNull);

            widget.label = "Name1";
            expect(widget.label,"NAME1");

            widget.value = "Mike";
            expect(widget.value,"Mike");
        }); // end of 'Label' test

    });
    // End of 'Checkbox' group
}

// - Helper --------------------------------------------------------------------------------------

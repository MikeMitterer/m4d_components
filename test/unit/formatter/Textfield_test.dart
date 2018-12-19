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
        <div class="mdl-textfield">
            <input class="mdl-textfield__input" type="text" id="sample1" >
            <label class="mdl-textfield__label" for="sample1" mdl-formatter="uppercase(value)">Type Something...</label>
        </div>
    '''.trim().replaceAll(new RegExp(r"\s+")," ");

    group('Textfield', () {
        setUp(() {
            registerMaterialTextfield();
            registerMaterialFormatter();
        });

        test('> Uppercase', () async {
            final dom.HtmlElement element = await renderer.render(parent,html);

            await componentHandler().upgradeElement(element);
            final MaterialTextfield widget = MaterialTextfield.widget(element);
            expect(widget,isNotNull);

            widget.value = "Mike";
            expect(widget.value,"Mike");

        }); // end of 'Uppercase' test

        test('> Label', () async {
            final dom.HtmlElement element = await renderer.render(parent,html);

            await componentHandler().upgradeElement(element);
            final MaterialTextfield widget = MaterialTextfield.widget(element);
            expect(widget,isNotNull);

            widget.label = "Name1";
            expect(widget.label,"NAME1");

            widget.value = "Mike";
            expect(widget.value,"Mike");
        }); // end of 'Label' test

    });
    // End of 'Textfield' group
}

// - Helper --------------------------------------------------------------------------------------

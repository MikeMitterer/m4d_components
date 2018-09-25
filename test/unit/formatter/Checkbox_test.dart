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

    ioc.IOCContainer.bindModules([ FormatterModule() ]);

    final renderer = new DomRenderer();
    final parent = new dom.DivElement();
    final html = '''
        <label class="mdl-checkbox mdl-ripple-effect"
            for="checkbox-1" mdl-formatter="uppercase(value)">
          <input type="checkbox" id="checkbox-1" class="mdl-checkbox__input" >
          <span class="mdl-checkbox__label">Check me out</span>
        </label>
    '''.trim().replaceAll(new RegExp(r"\s+")," ");

    group('Checkbox', () {
        setUp(() {
            registerMaterialCheckbox();
            registerMaterialFormatter();
        });

        test('> Uppercase', () async {
            final dom.HtmlElement element = await renderer.render(parent,html);

            await componentHandler().upgradeElement(element);
            final MaterialCheckbox widget = MaterialCheckbox.widget(element);
            expect(widget,isNotNull);

            widget.value = "Mike";
            expect(widget.value,"MIKE");

        }); // end of 'Uppercase' test

        test('> Label', () async {
            final dom.HtmlElement element = await renderer.render(parent,html);

            await componentHandler().upgradeElement(element);
            final MaterialCheckbox widget = MaterialCheckbox.widget(element);
            expect(widget,isNotNull);

            widget.label = "Name1";
            expect(widget.label,"NAME1");

            widget.value = "Mike";
            expect(widget.value,"MIKE");
        }); // end of 'Label' test

    });
    // End of 'Checkbox' group
}

// - Helper --------------------------------------------------------------------------------------


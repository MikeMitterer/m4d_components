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
        <button class="mdl-button mdl-ripple-effect" mdl-formatter="uppercase(value)">Flat</button>
    '''.trim().replaceAll(new RegExp(r"\s+")," ");

    group('Button', () {
        setUp(() {
            registerMaterialButton();
            registerMaterialFormatter();
        });

        test('> Uppercase', () async {
            final dom.HtmlElement element = await renderer.render(parent,html);

            await componentHandler().upgradeElement(element);
            final MaterialButton button = MaterialButton.widget(element);
            expect(button,isNotNull);

            button.value = "Mike";
            expect(button.value,"MIKE");

        }); // end of 'Uppercase' test

    });
    // End of 'Formatter' group
}

// - Helper --------------------------------------------------------------------------------------


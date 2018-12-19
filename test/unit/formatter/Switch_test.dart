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
        <label class="mdl-switch mdl-ripple-effect" for="switch-1" mdl-formatter="uppercase">
            <input type="checkbox" id="switch-1" class="mdl-switch__input" mdl-formatter="number(4)">
            <span class="mdl-switch__label">Switch me</span>
        </label>
    '''.trim().replaceAll(new RegExp(r"\s+")," ");

    group('Switch', () {
        setUp(() {
            registerMaterialSwitch();
            registerMaterialFormatter();
        });

        test('> Uppercase', () async {
            final dom.HtmlElement element = await renderer.render(parent,html);

            await componentHandler().upgradeElement(element);
            final MaterialSwitch widget = MaterialSwitch.widget(element);
            expect(widget,isNotNull);

            widget.value = "Mike";
            expect(widget.value,"Mike");

            expect(widget.label,"SWITCH ME");

        }); // end of 'Uppercase' test

        test('> Value', () async {
            final dom.HtmlElement element = await renderer.render(parent,html);

            await componentHandler().upgradeElement(element);
            final MaterialSwitch widget = MaterialSwitch.widget(element);
            expect(widget,isNotNull);

            widget.value = "13.1234567890";
            expect(widget.value,"13.1235");

            expect(widget.label,"SWITCH ME");
        }); // end of 'Value' test

    });
    // End of 'Switch' group
}

// - Helper --------------------------------------------------------------------------------------

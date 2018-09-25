@TestOn("chrome")
import 'package:test/test.dart';

import 'dart:html' as dom;

import 'package:m4d_core/m4d_core.dart';
import 'package:m4d_core/m4d_ioc.dart' as ioc;
import "package:m4d_components/m4d_components.dart";
import "package:m4d_components/m4d_formatter.dart";

import 'package:logging/logging.dart';
import 'package:console_log_handler/console_log_handler.dart';

main() async {
    final Logger _logger = new Logger("test.Formatter.Badge");
    
    configLogging(show: Level.INFO);

    ioc.IOCContainer.bindModules([ FormatterModule() ]);

    final renderer = new DomRenderer();
    final parent = new dom.DivElement();

    final html = '''
        <div class="mdl-badge" data-badge="1" mdl-formatter="uppercase(value)"></div>
    '''.trim().replaceAll(new RegExp(r"\s+")," ");

    group('Badge', () {
        setUp(() {
            registerMaterialFormatter();
            registerMaterialBadge();
        });

        test('> Uppercase', () async {
            final dom.HtmlElement element = await renderer.render(parent,html);

            await componentHandler().upgradeElement(element);
            
            final MaterialBadge badge = MaterialBadge.widget(element);
            expect(badge,isNotNull);

            _logger.info("Hallo vom Test");

            badge.value = "a";
            expect(badge.value,"A");

        }); // end of 'Uppercase' test

    });
    // End of 'Formatter' group
}

// - Helper --------------------------------------------------------------------------------------


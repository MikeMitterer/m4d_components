import "dart:html" as dom;
import "dart:async";

import 'package:console_log_handler/console_log_handler.dart';

import 'package:m4d_core/m4d_ioc.dart' as ioc;
import "package:m4d_components/m4d_components.dart";

main() async {
    final Logger _logger = new Logger('main.MaterialBadge');

    configLogging();

    ioc.IOCContainer.bindModules([ CoreComponentsModule() ]);
    await componentHandler().run();

    final MaterialBadge badge1 = MaterialBadge.widget(dom.querySelector("#el1"));
    int counter = 1;
    new Timer.periodic(new Duration(milliseconds: 100), (_) {
        if(counter > 999) {
            counter = 1;
        }
        badge1.value = counter.toString();
        _logger.info("Current Badge-Value: ${badge1.value}");

        counter++;
    });
}


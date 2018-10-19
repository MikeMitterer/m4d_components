import 'dart:html' as dom;
import 'dart:async';

import 'package:console_log_handler/console_log_handler.dart';

import 'package:m4d_core/m4d_ioc.dart' as ioc;
import 'package:m4d_core/services.dart' as service;
import "package:m4d_components/m4d_components.dart";

class Application extends MaterialApplication {
    final Logger _logger = new Logger('mdl_button.main');

    @override
    void run() {
        new Future(() {
            MaterialButton.widget(dom.querySelector("#with-event")).onClick.listen((_) {
                _logger.info("Clicked!");
            });
        });
    }
}

Future main() async {
    configLogging(show: Level.INFO);

    ioc.IOCContainer.bindModules([ CoreComponentsModule() ])
        .bind(service.Application).to(Application());
        
    final Application app = await componentHandler().run<Application>();
    app.run();
}


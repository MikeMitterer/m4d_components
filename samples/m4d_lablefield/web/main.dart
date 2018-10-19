import 'dart:html' as dom;
import 'dart:async';

import 'package:console_log_handler/console_log_handler.dart';

import 'package:m4d_core/m4d_ioc.dart' as ioc;
import 'package:m4d_core/services.dart' as service;
import "package:m4d_components/m4d_components.dart";

class Application extends MaterialApplication {

    @override
    void run() {
        new Future(() {
            final MaterialButton button = MaterialButton.widget(dom.querySelector(".mdl-button"));
            button.onClick.listen((final dom.Event event) {
                event.preventDefault();

                final MaterialLabelfield label = MaterialLabelfield.widget(
                    dom.querySelector("#search_engine"));
                label.label = "Another search engine";
                label.value = "Yahoo";

                final MaterialLabelfield label2 = MaterialLabelfield.widget(
                    dom.querySelector("#interruption"));
                label2.label = "Do not disturbe!";

                final MaterialLabelfield label3 = MaterialLabelfield.widget(
                    dom.querySelector("#ringtone"));
                label3.value = "I am <strong>escaped</strong>";
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




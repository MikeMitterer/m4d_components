import 'dart:html' as dom;
import 'dart:async';

import 'package:console_log_handler/console_log_handler.dart';

import 'package:m4d_core/m4d_ioc.dart' as ioc;
import 'package:m4d_core/services.dart' as service;
import "package:m4d_components/m4d_components.dart";

class Application extends MaterialApplication {

    @override
    void run() {
        new Future(() => _bindSignals());
    }

    //- private -----------------------------------------------------------------------------------

    /// Add your actions / events you want to listen to
    void _bindSignals() {

        // _actionbus.on(<Action>.NAME).listen((_) {
        //    _logger.info("User clicked on 'Add'!");
        // });

        final MaterialSpinner spinner = MaterialSpinner.widget(dom.querySelector("#first"));
        final MaterialButton button = MaterialButton.widget(dom.querySelector("#button"));

        button.onClick.listen((_) {
            spinner.active = !spinner.active;
        });

    }
}

Future main() async {
    configLogging(show: Level.INFO);

    ioc.Container.bindModules([ CoreComponentsModule() ])
        .bind(service.Application).to(Application());

    final Application app = await componentHandler().run<Application>();
    app.run();
}


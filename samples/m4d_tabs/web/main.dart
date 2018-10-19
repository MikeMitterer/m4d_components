import 'dart:html' as dom;

import 'package:console_log_handler/console_log_handler.dart';

import 'package:m4d_core/m4d_ioc.dart' as ioc;
import "package:m4d_components/m4d_components.dart";

main() async {
    final Logger _logger = new Logger('mdl_tabs_sample.main');

    ioc.IOCContainer.bindModules([ CoreComponentsModule() ]);
    await componentHandler().run();

    configLogging();

    void _log(final String message) {
        (dom.querySelector("#output") as dom.DivElement).text = message;
        _logger.info(message);
    }

    final MaterialTabs tabs = MaterialTabs.widget(dom.querySelector(".mdl-tabs"));

    _log("${tabs.activePanel} is active!");

    tabs.onChange.listen((final MaterialTabsChangedEvent event)
        => _log("${event.targetID} is active!"));
}


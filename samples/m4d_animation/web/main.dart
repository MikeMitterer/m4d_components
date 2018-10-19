import 'dart:async';
import 'package:console_log_handler/console_log_handler.dart';

import 'package:m4d_core/m4d_ioc.dart' as ioc;
import "package:m4d_components/m4d_components.dart";

import 'package:m4d_animation_sample/animation_demo.dart';

Future main() async {
    configLogging();

    ioc.IOCContainer.bindModules([ CoreComponentsModule(), AnimationDemoModule() ]);
    await componentHandler().run();
}

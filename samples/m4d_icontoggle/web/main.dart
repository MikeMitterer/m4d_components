import 'dart:html' as dom;
import 'dart:async';

import 'package:m4d_core/m4d_ioc.dart' as ioc;
import "package:m4d_components/m4d_components.dart";

main() async {
    ioc.Container.bindModules([ CoreComponentsModule() ]);
    await componentHandler().upgrade();

    final MaterialIconToggle toggle = MaterialIconToggle.widget(dom.querySelector("#public-checkbox-1"));
    new Timer.periodic(new Duration(milliseconds: 500), (final Timer timer) {
        toggle.checked = !toggle.checked;
    });

}

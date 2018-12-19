import 'dart:html' as dom;

import 'package:m4d_core/m4d_ioc.dart' as ioc;
import "package:m4d_components/m4d_components.dart";

main() async {
    ioc.Container.bindModules([ CoreComponentsModule() ]);
    await componentHandler().run();

    final switch1 = MaterialSwitch.widget(dom.querySelector("#switch-1"));
    switch1.onClick.listen((_) {
        dom.querySelector("#output").text = "Switch 1 is ${switch1.checked ? 'checked' : 'not checked'}";
    });
}

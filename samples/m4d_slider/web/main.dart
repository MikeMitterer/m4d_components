import 'dart:html' as dom;

import 'package:m4d_core/m4d_ioc.dart' as ioc;
import "package:m4d_components/m4d_components.dart";

main() async {
    ioc.Container.bindModules([ CoreComponentsModule() ]);
    await componentHandler().run();

    final MaterialSlider slider2 = MaterialSlider.widget(dom.querySelector("#slider2"));
    final MaterialSlider slider4 = MaterialSlider.widget(dom.querySelector("#slider4"));

    slider2.hub.onChange.listen((_) {
        slider4.value = slider2.value;
    });

}


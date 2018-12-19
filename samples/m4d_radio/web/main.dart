import "dart:html" as dom;

import 'package:m4d_core/m4d_ioc.dart' as ioc;
import "package:m4d_components/m4d_components.dart";

main() async {
    ioc.Container.bindModules([ CoreComponentsModule() ]);
    await componentHandler().run();

    MaterialRadio.widget(dom.querySelector("#wifi2")).disable();

    MaterialButton.widget(dom.querySelector("#show-wifi-value")).onClick.listen((_) {

        final MaterialRadioGroup group = MaterialRadioGroup.widget(dom.querySelector("#wifi"));
        final out = dom.querySelector("#output") as dom.UListElement;

        final element = dom.LIElement()
            ..text = "Value is: ${group.value}";
        ;
        out.append(element);
    });
}


import "dart:html" as dom;
import "dart:async";

import 'package:m4d_core/m4d_ioc.dart' as ioc;
import "package:m4d_components/m4d_components.dart";

main() async {
    const int TIMEOUT_IN_SECS = 5;

    ioc.Container.bindModules([ CoreComponentsModule() ]);
    await componentHandler().run();

    final dom.HtmlElement element = dom.querySelector(".mdl-menu");
    final MaterialMenu menu1 = MaterialMenu.widget(element);

    void _showMessage(final int secsToClose) {
        final dom.DivElement message = dom.querySelector("#message");
        message.text = "Menu closes in ${secsToClose} seconds...";
        if(secsToClose <= 0) {
            message.text = "Closed!";
        }
    }

    menu1.show();
    _showMessage(TIMEOUT_IN_SECS);
    int tick = 0;
    new Timer.periodic(new Duration(milliseconds: 1000) , (final Timer timer) {

        _showMessage(TIMEOUT_IN_SECS - tick - 1);
        if(tick >= TIMEOUT_IN_SECS - 1) {
            timer.cancel();
            menu1.hide();
        }
        tick++;
    });
}

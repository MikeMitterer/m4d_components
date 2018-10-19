import 'dart:html' as dom;

import 'package:m4d_core/m4d_ioc.dart' as ioc;
import "package:m4d_components/m4d_components.dart";

main() async {
    ioc.IOCContainer.bindModules([ CoreComponentsModule() ]);
    await componentHandler().run();

    
    final MaterialDivDataTable table = MaterialDivDataTable.widget(dom.querySelector(".mdl-data-tableex"));
    final MaterialLabelfield label = MaterialLabelfield.widget(dom.querySelector("#selection"));

    table.onRowClick.listen((final DataTableRowClickedEvent event) {
        final dom.DivElement div = event.row.element;
        final dom.HtmlElement child = div.querySelector(".material");

        label.value = child.text.replaceAll(new RegExp(r"\s{2,}"),"");
    });
}

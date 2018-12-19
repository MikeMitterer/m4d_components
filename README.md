# Material4Dart - Basic Components
> Basic components like MaterialButton, MaterialCheckbox and so on

## Examples
> [GitHub](https://github.com/MikeMitterer/m4d_components) 

   - [m4d_accordion.example.mikemitterer.at](http://m4d_accordion.example.mikemitterer.at)
   - [m4d_animation.example.mikemitterer.at](http://m4d_animation.example.mikemitterer.at)
   - [m4d_badge.example.mikemitterer.at](http://m4d_badge.example.mikemitterer.at)
   - [m4d_button.example.mikemitterer.at](http://m4d_button.example.mikemitterer.at)
   - [m4d_checkbox.example.mikemitterer.at](http://m4d_checkbox.example.mikemitterer.at)
   - [m4d_datatable.example.mikemitterer.at](http://m4d_datatable.example.mikemitterer.at)
   - [m4d_footer.example.mikemitterer.at](http://m4d_footer.example.mikemitterer.at)
   - [m4d_grid.example.mikemitterer.at](http://m4d_grid.example.mikemitterer.at)
   - [m4d_icontoggle.example.mikemitterer.at](http://m4d_icontoggle.example.mikemitterer.at)
   - [m4d_lablefield.example.mikemitterer.at](http://m4d_lablefield.example.mikemitterer.at)
   - [m4d_layout.example.mikemitterer.at](http://m4d_layout.example.mikemitterer.at)
   - [m4d_list.example.mikemitterer.at](http://m4d_list.example.mikemitterer.at)
   - [m4d_menu.example.mikemitterer.at](http://m4d_menu.example.mikemitterer.at)
   - [m4d_navpills.example.mikemitterer.at](http://m4d_navpills.example.mikemitterer.at)
   - [m4d_palette.example.mikemitterer.at](http://m4d_palette.example.mikemitterer.at)
   - [m4d_progress.example.mikemitterer.at](http://m4d_progress.example.mikemitterer.at)
   - [m4d_radio.example.mikemitterer.at](http://m4d_radio.example.mikemitterer.at)
   - [m4d_shadow.example.mikemitterer.at](http://m4d_shadow.example.mikemitterer.at)
   - [m4d_slider.example.mikemitterer.at](http://m4d_slider.example.mikemitterer.at)
   - [m4d_spinner.example.mikemitterer.at](http://m4d_spinner.example.mikemitterer.at)
   - [m4d_switch.example.mikemitterer.at](http://m4d_switch.example.mikemitterer.at)
   - [m4d_tabs.example.mikemitterer.at](http://m4d_tabs.example.mikemitterer.at)
   - [m4d_textfield.example.mikemitterer.at](http://m4d_textfield.example.mikemitterer.at)
   - [m4d_tooltip.example.mikemitterer.at](http://m4d_tooltip.example.mikemitterer.at)
   - [m4d_typography.example.mikemitterer.at](http://m4d_typography.example.mikemitterer.at)
   

## Usage
There is more documentation on the way but here is an example how
`main.dart` looks for the [Accordion-Example](http://m4d_accordion.example.mikemitterer.at)

```dart
import 'package:m4d_core/m4d_ioc.dart' as ioc;
import "package:m4d_components/m4d_components.dart";

main() async {

    ioc.IOCContainer.bindModules([ CoreComponentsModule() ]);
    await componentHandler().run();
}
```                                                    

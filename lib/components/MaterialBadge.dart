/*
 * Copyright (c) 2015, Michael Mitterer (office@mikemitterer.at),
 * IT-Consulting and Development Limited.
 *
 * All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

part of m4d_components;

/// Controller-View for
///     <div class="mdl-badge" data-badge="1"></div>
///
@Component
class MaterialBadge extends MdlComponent {
    final Logger _logger = new Logger('mdlcomponents.MaterialBadge');

    static const _MaterialBadgeConstant _constant = const _MaterialBadgeConstant();
    static const _MaterialBadgeCssClasses _cssClasses = const _MaterialBadgeCssClasses();

    MaterialBadge.fromElement(final dom.HtmlElement element,final ioc.Container iocContainer)
        : super(element,iocContainer) {
        _init();
    }

    static MaterialBadge widget(final dom.HtmlElement element) => mdlComponent(element,MaterialBadge) as MaterialBadge;

    void set value(final String val) {
        if(val == null || val.isEmpty) {
            element.dataset.remove("badge");
            return;
        }
        element.dataset["badge"] = MaterialFormatter.widget(element).format(val);
    }

    String get value => element.dataset.containsKey("badge") ? element.dataset["badge"] : "";

    //- private -----------------------------------------------------------------------------------

    void _init() {
        _logger.fine("MaterialBadge - init");

        // Reformat according to [MaterialFormatter] definition
        // void _kickInFormatter() {
        //    // setter = getter
        //    value = value;
        // }

        //_kickInFormatter();
        element.classes.add(_cssClasses.IS_UPGRADED);
    }
}



/// Registers the MaterialBadge-Component
///
///     main() {
///         registerMaterialBadge();
///         ...
///     }
///
void registerMaterialBadge() {
    /// creates MdlConfig for MaterialBadge
    final MdlConfig config = new MdlWidgetConfig<MaterialBadge>(
        _MaterialBadgeCssClasses.MAIN_CLASS,
            (final dom.HtmlElement element,final ioc.Container iocContainer)
                => new MaterialBadge.fromElement(element,iocContainer));

    // If you want <mdl-badge></mdl-badge> set selectorType to SelectorType.TAG.
    // If you want <div mdl-badge=""></div> set selectorType to SelectorType.ATTRIBUTE.
    // By default it's used as a class name. (<div class="mdl-badge"></div>)
    config.selectorType = SelectorType.CLASS;

    componentHandler().register(config);
}


/// Store strings for class names defined by this component that are used in
/// Dart. This allows us to simply change it in one place should we
/// decide to modify at a later date.
class _MaterialBadgeCssClasses {
    static const String MAIN_CLASS  = "mdl-badge";

    final String IS_UPGRADED        = 'is-upgraded';

    const _MaterialBadgeCssClasses();
}

/// Store constants in one place so they can be updated easily.
class _MaterialBadgeConstant {
    const _MaterialBadgeConstant();
}

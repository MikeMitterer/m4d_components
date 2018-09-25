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

library m4d_components;

import 'dart:html' as dom;
import 'dart:math' as Math;
import 'dart:async';
import 'dart:collection';
import 'package:logging/logging.dart';
import 'package:validate/validate.dart';
import 'package:platform_detect/platform_detect.dart';

import "package:m4d_core/m4d_core.dart";
import "package:m4d_core/m4d_ioc.dart" as ioc;

import "m4d_formatter.dart";
export "m4d_formatter.dart";

import 'services.dart' as service;

part 'components/MaterialFormatter.dart';

part 'components/utils/FallbackFormatter.dart';

part "components/MaterialAccordion.dart";

part "components/MaterialBadge.dart";
part "components/MaterialButton.dart";
part "components/MaterialCheckbox.dart";
part "components/MaterialDataTable.dart";
part "components/MaterialDivDataTable.dart";
part "components/MaterialIconToggle.dart";
part "components/MaterialLabelfield.dart";
part "components/MaterialLayout.dart";
part "components/MaterialMenu.dart";
part "components/MaterialProgress.dart";
part "components/MaterialProgressVertical.dart";
part "components/MaterialRadio.dart";
part "components/MaterialRipple.dart";
part "components/MaterialSlider.dart";
part "components/MaterialSpinner.dart";
part "components/MaterialSwitch.dart";
part "components/MaterialTabs.dart";
part "components/MaterialTextfield.dart";
part "components/MaterialTooltip.dart";

//final MdlComponentHandler _componenthandler = new MdlComponentHandler();
//
//MdlComponentHandler componentHandler() {
//    return _componenthandler;
//}

void registerMdlComponents() {

    // Needed by some other components
    registerMaterialFormatter();

    registerMaterialAccordion();
    registerMaterialBadge();
    registerMaterialButton();
    registerMaterialCheckbox();
    registerMaterialDataTable();
    registerMaterialDivDataTable();
    registerMaterialIconToggle();
    registerMaterialLabelfield();
    registerMaterialLayout();
    registerMaterialMenu();
    registerMaterialProgress();
    registerMaterialProgressVertical();
    registerMaterialRadio();
    registerMaterialRadioGroup();
    registerMaterialSlider();
    registerMaterialSpinner();
    registerMaterialSwitch();
    registerMaterialTabs();
    registerMaterialTextfield();
    registerMaterialTooltip();

    // should be the last registration
    registerMaterialRipple();
}

class CoreComponentsModule extends ioc.IOCModule {
  @override
  configure() {
    registerMdlComponents();
    componentHandler().run();
  }

  @override
  List<ioc.IOCModule> get dependsOn => [ FormatterModule() ];
}


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

library m4d_formatter;

import 'package:intl/intl.dart';
import 'package:logging/logging.dart';
import 'package:validate/validate.dart';

import 'package:m4d_core/core/annotations.dart';
import 'package:m4d_core/core/interfaces.dart';
import 'package:m4d_core/m4d_ioc.dart' as ioc;
import 'package:m4d_core/m4d_utils.dart';

import 'services.dart' as service;

part 'formatter/utils/FormatterPipeline.dart';

part 'formatter/ChooseFormatter.dart';
part 'formatter/DecoratorFormatter.dart';
part 'formatter/LowerCaseFormatter.dart';
part 'formatter/NumberFormatter.dart';
part 'formatter/UpperCaseFormatter.dart';

/// Base-Class for all Formatters
abstract class Formatter {
    String format(final dynamicValue, [ final List params ]);
}

/// Formatter ist a collection of formatters.
///
/// By convention the instance name must be the name of the formatter string.
/// E.g. if the string ist 'uppercase' then the instance in 'Formatter' must be named 'uppercase'
/// 
/// To add your own formatter follow the sample below
///      @Directive
///      class MyFormatter extends Formatter {
///
///          // Your super cool formatter
///          final TestFormatter test = new TestFormatter();
///      }
///
///      class MyFormatterModule extends Module {
///          MyFormatterModule() {
///              bind(Formatter, ,toImplementation: MyFormatter);
///          }
///      }
///
///      main() {
///          ...
///            componentFactory().rootContext(Application).
///               addModule(new StyleguideModule()).run()
///                  .then((final MaterialApplication application) {
///
///                application.run();
///          });
///
///          ...
///      }
///
/// HTML:
///      <span mdl-observe="pi | test(value)"></span>
///      or
///      <div class="mdl-labelfield" mdl-formatter="uppercase">...</div>
class Formatters implements M4DService {
    final NumberFormatter    _number = new NumberFormatter();
    final DecoratorFormatter _decorate = new DecoratorFormatter();
    final UpperCaseFormatter _uppercase = new UpperCaseFormatter();
    final LowerCaseFormatter _lowercase = new LowerCaseFormatter();
    final ChooseFormatter    _choose = new ChooseFormatter();

    final _availableFormatter = Map<String,Formatter>();

    Formatters() {
        _availableFormatter["number"] = _number;
        _availableFormatter["decorator"] = _decorate;
        _availableFormatter["uppercase"] = _uppercase;
        _availableFormatter["lowercase"] = _lowercase;
        _availableFormatter["choose"] = _choose;
    }

    bool contains(final String name) => _availableFormatter.containsKey(name);
    Formatter formatter(final String name) => _availableFormatter[name];
}

/// Registers the necessary Objects
///
/// final injector = ioc.IOCContainer.bindModules([ FormatterModule() ]);
/// final formatters = injector.resolve<Formatters>(service.Formatters);
/// final pipeline = FormatterPipeline.fromList(formatters, [ "number(2)" ]);
class FormatterModule extends ioc.IOCModule {
  @override
  configure() {
    bind(service.Formatters).to(Formatters());
  }
}


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

/// Core-Annotations got it's own library so that it's not DOM-Related.
///
/// Makes it better testable.
///
///     @Component
///     class Person {
///         final String id;
///         String name;
///
///         Person(this.nae) : id = new Uuid().v1();
///
///         Person.from(final Person person) : name = person.name, id = person.id;
///     }
///
library m4d_core.services;

import 'package:m4d_core/m4d_ioc.dart';

final Formatters = Service("m4d_formatter.Formatters",ServiceType.Instance);

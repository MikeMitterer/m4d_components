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

// @TestOn("dartium")
@TestOn("chrome")
import 'package:test/test.dart';

import 'dart:html' as dom;

import 'package:m4d_core/m4d_ioc.dart' as ioc;
import "package:m4d_components/m4d_components.dart";

// import 'package:logging/logging.dart';

main() async {
    // final Logger _logger = new Logger("test.Radio");
    // configLogging();

    ioc.IOCContainer.bindModules([ CoreComponentsModule() ]);

    group('Radio', () {
        setUp(() { });

        test('> check if upgraded', () {
            final dom.HtmlElement element = dom.document.querySelector(".ui-test--radio").querySelector(".mdl-radio");

            expect(element,isNotNull);
            expect(element.dataset.containsKey("upgraded"),isTrue);
            expect(element.dataset["upgraded"],"MaterialRadio,MaterialRipple");
        }); // end of 'check if upgraded' test

        test('> widget', () {
            final dom.HtmlElement element = dom.document.querySelector(".ui-test--radio").querySelector("#wifi2");
            expect(element,isNotNull);

            final MaterialRadio widget = MaterialRadio.widget(element);
            expect(widget,isNotNull);

            widget.disable();

        }); // end of 'widget' test

        test('> check only one', () {
            final dom.HtmlElement element = dom.document.querySelector(".ui-test--radio").querySelector("#wifi2");
            expect(element,isNotNull);

            final MaterialRadio widget = MaterialRadio.widget(element);
            expect(widget,isNotNull);

            widget.check();
        }); // end of 'check only one' test


    });
    // end 'Radio' group
}

// - Helper --------------------------------------------------------------------------------------

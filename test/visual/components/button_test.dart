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

@TestOn("chrome")
import 'package:test/test.dart';

import 'dart:html' as dom;

import 'package:m4d_core/m4d_ioc.dart' as ioc;
import "package:m4d_components/m4d_components.dart";

// import 'package:logging/logging.dart';

main() async {
    // final Logger _logger = new Logger("test.Button");
    // configLogging();

    ioc.Container.bindModules([ CoreComponentsModule() ]);
    await componentHandler().upgrade();

    group("Button",() {

        test('> check if upgraded', () {
            final dom.ButtonElement element = dom.document.querySelector("#button1");

            expect(element,isNotNull);
            expect(element.dataset.containsKey("upgraded"),isTrue);
            expect(element.dataset["upgraded"],"MaterialButton");
        });

        test('> widget', () {
            final dom.ButtonElement element = dom.document.querySelector("#button1");

            final MaterialButton widget = MaterialButton.widget(element);
            expect(widget,isNotNull);

        }); // end of 'widget' test

    });
    // end 'Button' group
}

// - Helper --------------------------------------------------------------------------------------

@TestOn("chrome")
import 'package:test/test.dart';

import 'dart:html' as dom;

import 'package:m4d_core/m4d_core.dart';
import 'package:m4d_core/m4d_ioc.dart' as ioc;
import "package:m4d_components/m4d_components.dart";
import "package:m4d_components/m4d_formatter.dart";

// import 'package:logging/logging.dart';

main() async {
    // final Logger _logger = new Logger("test.Formatter.Button");

    ioc.Container.bindModules([ FormatterModule() ]);

    final renderer = new DomRenderer();
    final parent = new dom.DivElement();
    final html = '''
        <div class="mdl-labelfield" mdl-formatter="uppercase">
            <label class="mdl-labelfield__label"></label>
            <div class="mdl-labelfield__text"></div>
        </div>
    '''.trim().replaceAll(new RegExp(r"\s+")," ");

    final String html2 = '''
        <div class="mdl-labelfield">
            <label class="mdl-labelfield__label" mdl-formatter="uppercase"></label>
            <div class="mdl-labelfield__text"></div>
        </div>
    '''.trim().replaceAll(new RegExp(r"\s+")," ");

    final String htmlForNumberFormat = '''
        <div class="mdl-labelfield" mdl-formatter="number(3)">
            <label class="mdl-labelfield__label"></label>
            <div class="mdl-labelfield__text"></div>
        </div>
    '''.trim().replaceAll(new RegExp(r"\s+")," ");

    final String htmlForNumberFormatNoFraction = '''
        <div class="mdl-labelfield" mdl-formatter="number">
            <label class="mdl-labelfield__label"></label>
            <div class="mdl-labelfield__text"></div>
        </div>
    '''.trim().replaceAll(new RegExp(r"\s+")," ");

    group('LabelField', () {

        setUp(() {
            registerMaterialLabelfield();
            registerMaterialFormatter();
        });

        test('> Uppercase', () async {
            final dom.HtmlElement element = await renderer.render(parent,html);

            await componentHandler().upgradeElement(element);
            final MaterialLabelfield labelfield = MaterialLabelfield.widget(element);
            expect(labelfield,isNotNull);

            labelfield.value = "Mike";
            expect(labelfield.value,"MIKE");

        }); // end of 'Uppercase' test

        test('> Label formatter', () async {
            final dom.HtmlElement element = await renderer.render(parent,html2);

            await componentHandler().upgradeElement(element);
            final MaterialLabelfield labelfield = MaterialLabelfield.widget(element);
            expect(labelfield,isNotNull);

            labelfield.label = "Name";
            expect(labelfield.label,"NAME");

            labelfield.value = "Mike";
            expect(labelfield.value,"Mike");
        }); // end of 'Label formatter' test

        test('> Number format I', () async {
            final dom.HtmlElement element = await renderer.render(parent,htmlForNumberFormat);

            await componentHandler().upgradeElement(element);
            final MaterialLabelfield labelfield = MaterialLabelfield.widget(element);
            expect(labelfield,isNotNull);

            labelfield.label = "Name";
            expect(labelfield.label,"Name");

            labelfield.value = "Mike";
            expect(labelfield.value,"Mike");
        }); // end of 'Number format I' test

        test('> Number format II', () async {
            final dom.HtmlElement element = await renderer.render(parent,htmlForNumberFormat);

            await componentHandler().upgradeElement(element);
            final MaterialLabelfield labelfield = MaterialLabelfield.widget(element);
            expect(labelfield,isNotNull);

            //labelfield.label = "Name";
            //expect(labelfield.label,"Name");

            labelfield.value = "10";
            expect(labelfield.value,"10.000");
        }); // end of 'Number format II' test

        test('> Number format III - no decimals specified', () async {
            final dom.HtmlElement element = await renderer.render(parent,htmlForNumberFormatNoFraction);

            await componentHandler().upgradeElement(element);
            final MaterialLabelfield labelfield = MaterialLabelfield.widget(element);
            expect(labelfield,isNotNull);

            labelfield.label = "Name";
            expect(labelfield.label,"Name");

            labelfield.value = "10";
            expect(labelfield.value,"10.00");
        }); // end of 'Number format III - no decimals specified' test

    });
    // End of 'Formatter' group
}

// - Helper --------------------------------------------------------------------------------------

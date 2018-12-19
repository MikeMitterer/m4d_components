// @TestOn("browser")
// unit
library test.unit.formatter;

import 'package:test/test.dart';
import 'package:m4d_components/m4d_formatter.dart';
import 'package:m4d_core/m4d_ioc.dart' as ioc;
import 'package:m4d_components/services.dart' as service;

// import 'package:logging/logging.dart';


main() async {
    // final Logger _logger = new Logger("test.unit.formatter");

    final injector = ioc.Container.bindModules([ FormatterModule() ]);
    final formatters = injector.resolve(service.Formatters).as<Formatters>(); // equivalent to 'new Formatters();'

    group('Formatter', () {
        setUp(() {});

        test('> Number Formatter', () {
            final pipeline = FormatterPipeline.fromList(formatters, [ "number(2)" ]);

            expect(pipeline.format("1"),"1.00");
            expect(pipeline.format(1),"1.00");
            expect(pipeline.format(1.000),"1.00");
        }); // end of 'Number Formatter' test

        test('> Number-Formatter without brackets', () {
            final pipeline = FormatterPipeline.fromList(formatters, [ "number" ]);

            expect(pipeline.format("1"),"1.00");
            expect(pipeline.format(1),"1.00");
            expect(pipeline.format(1.000),"1.00");
        }); // end of 'Number-Formatter without brackets' test

        test('> Uppercase', () {
            final pipeline = FormatterPipeline.fromList(formatters, [ "uppercase" ]);
            expect(pipeline.format("Mike"),"MIKE");
        }); // end of 'Uppercase' test

        test('> Lowercase', () {
            final pipeline = FormatterPipeline.fromList(formatters, [ "lowercase()" ]);
            expect(pipeline.format("Mike"),"mike");
        }); // end of 'Lowercase' test

    });
    // End of 'Formatter' group
}

// - Helper --------------------------------------------------------------------------------------

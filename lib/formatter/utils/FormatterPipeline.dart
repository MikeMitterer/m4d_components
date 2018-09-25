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

part of m4d_formatter;

typedef dynamic PipeCommand(dynamic val);

/**
 * Takes the return value of the first command as input for the next command - works like "unix pipes"
 * Basis is a HTML-Statement like this:
 *
 *      <span mdl-observe="pi | number(value,2) | decorate(value)"></span>
 *
 * pi returns a value this value is passed over to number. The return value of number is passed over to 'decorate'
 * 'decorate' is the last command in the chain so its output will be displayed.
 */
class FormatterPipeline {
    final Logger _logger = new Logger('mdlformatter.FormatterPipeline');

    final _commands = new List<PipeCommand>();
    final Formatters _formatters;

    /// [_formatter] should be obtained from injector
    ///     new FormatterPipeline(injector.getInstance(Formatter))
    FormatterPipeline(this._formatters) {
        Validate.notNull(_formatters,"Formatters must not be null! (CTOR)");
    }

    /**
     * [_formatter] should be obtained from injector
     *     new FormatterPipeline(injector.getInstance(Formatter))
     *
     * [parts] is a list of formatter-names
     *
     *      HTML: <span mdl-observe="pi | number(value,2) | decorate(value)"></span>
     *      DART: final List<String> parts = element.attributes[_MaterialObserveConstant.WIDGET_SELECTOR].trim().split("|");
    */
    FormatterPipeline.fromList(this._formatters,final Iterable<String> parts) {
        Validate.notNull(_formatters,"Formatters must not be null! (fromList)");
        Validate.notNull(parts,"Parts must not be null!");

        _addCommands(parts);
    }


    /// Iterates over all the commands. Every command takes the result of the previous command as input.
    /// The result of the last command will be returned
    String format(dynamic value) {
        _commands.forEach((final PipeCommand command) {
            value = command(value);
        });
        return value;
    }

    //- private -----------------------------------------------------------------------------------

    /// Generates PipeCommands from [parts]
    void _addCommands(final Iterable<String> parts) {
        //_logger.info("P ${parts.length}");

        parts.forEach((final String part) {

            _commands.add( (dynamic val) {

                final String formatter = part.trim(); // e.g. uppercase(value)

                String functionName = formatter;
                List params = [];

                if(formatter.contains(RegExp(r"\(.*\)"))) {
                    final stf = new StringToFunction(formatter); // e.g. uppercase
                    functionName = stf.functionAsString;
                    params = stf.params;
                }

                if(!_formatters.contains(functionName)) {
                    _logger.warning("Formatter '${functionName} is not available for $val!");
                } else {
                    try {
                        val = _formatters.formatter(functionName).format(val,params);
                        return val;

                    } catch(e) {
                        _logger.warning("Could not format '$val' with ${functionName}. ($e)");
                        return val;
                    }
                }
            });

        });
    }
}

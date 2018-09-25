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

/**
 * Formats a number with a certain number of digits
 *
 *      <span mdl-observe="pi | number(value,2)"></span>
 */
class NumberFormatter implements Formatter {
    final Logger _logger = new Logger('mdlformatter.NumberFormatter');

    /// Important! this function is called by the framework
    ///
    ///     <span mdl-observe="pi | number(value,2)"></span>
    ///
    /// REMARK: default-Params are not support by mirrors but
    /// optional param works
    @override
    String format(final value, [ final List params ]) {
        final double valueAsDouble = ConvertValue.toDouble(value);
        final int fraction = ConvertValue.toInt(
            params != null && params.isNotEmpty ? params.first : 2);

        return _number(valueAsDouble,fraction);
    }

    /// 'number' is the formatter name. [fractionSize] defines the number of digits
    /// after the decimal point
    String _number(final dynamicValue,final int fractionSize ) {
        final double value = ConvertValue.toDouble(dynamicValue);
        final String verifiedLocale = Intl.verifiedLocale(Intl.getCurrentLocale(), NumberFormat.localeExists);

        final pattern = fractionSize > 0 ? "${'#.'.padRight(fractionSize + 2,"0")}" : "#";
        final nf = new NumberFormat(pattern,verifiedLocale);

        return nf.format(value);
    }
}

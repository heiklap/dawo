// is governed by a BSD-style license that can be found in the LICENSE file.
///  dawo clay helsinki_guide
///  presenting data for dawo-chore system
//

library learnDartlang;

///
class LearnDartlang {
  ///  Dartlang learning subjects to Chore
  Map<String, String> dartlangSubjectsM = {
    'Basics': 'Dart is object-oriented, structured web programming language',
    'Boolean true':
        'Only two objects have type bool: the boolean literals true and false,',
    'Object':
        'Everything you can place in a variable is an object, and every object is an instance of a class.',
    'Functions':
        'Functions can be assigned to variables or passed as arguments to other functions. ',
    'Classes':
        'Every object is an instance of a class, and all classes descend from Object',
    'Libraries':
        ' Libraries can be distributed using packages, provide APIs, and are a unit of privacy.',
    'Scope':
        'Dart is a lexically scoped language, which means that the scope of variables is determined statically, simply by the layout of the code.',
    'Packages':
        'The package: scheme specifies libraries provided by a package manager such as the pub tool.',
    'Dart:core':
        'Built-in types, collections, and other core functionality for every Dart program. This library is automatically imported.',
    'Keywords':
        'The following table lists the words that the Dart language treats specially.    https://www.dartlang.org/guides/language/language-tour#keywords',
    'Built-in Types':
        'special support for the following types: numbers, strings, booleans, lists (also known as arrays), maps, runes, symbols',
    'Operators':
        'Dart defines the operators shown in the following table. You can override many of these operators:  https://www.dartlang.org/guides/language/language-tour#operators',
    'Control flow':
        'You can control the flow of your Dart code using any of the following: if and else, for loops, while and do-while loops, break and continue, switch and case, assert',
    'Generics':
        'The <…> notation marks List as a generic (or parameterized) type. Types (generic or not) let you document and annotate your code, making your intent clearer.',
    'Asynchrony':
        'asynchronous: return after setting up a possibly time-consuming operation (such as I/O), without waiting for that operation to complete.',
    'Typedefs':
        'A typedef, or function-type alias, gives a function type a name that you can use when declaring fields and return types.',
    'Comments':
        'A single-line comment begins with //  A multi-line comment begins with /* and ends with */. Documentation comments begin with /// ',
  };

  ///  dartlang API libraries
  Map<String, String> dartlangApi = {
    'dart:async': '',
    'dart:collection': '',
    'dart:convert': '',
    'dart:core': '',
    'dart:developer': '',
    'dart:html': '',
    'dart:indexed_db': '',
    'dart:io': '',
    'dart:isolate': '',
    'dart:js': '',
    'dart:js_util': '',
    'dart:math': '',
    'dart:mirrors': '',
    'dart:svg': '',
    'dart:typed_data': '',
    'dart:web_audio': '',
    'dart:web_gl': '',
    'dart:web_sql': ''
  };
}

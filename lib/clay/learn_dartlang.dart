// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  # dawo clay dartlang_guide.
///  * presenting data for dawo-chore system, mostly Maps.
//  dawo version:   0.0.6  27.11.2017

library learnDartlang;

///
class LearnDartlang {
  String name = 'Learn Dartlang class';

  ///  forming new kind of map, to keep more information
  Map<String, Map<String, String>> dartlangClayM = {};

  ///  Dartlang learning subjects to Chore
  Map<String, String> dartlangSubjectsM = {
    'Async-new': '',
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
  Map<String, String> dartlangApiM = {
    'dart:async':
        'https://api.dartlang.org/stable/1.24.2/dart-async/dart-async-library.html',
    'dart:collection':
        'https://api.dartlang.org/stable/1.24.2/dart-collection/dart-collection-library.html',
    'dart:convert':
        'https://api.dartlang.org/stable/1.24.2/dart-convert/dart-convert-library.html',
    'dart:core':
        'https://api.dartlang.org/stable/1.24.2/dart-core/dart-core-library.html',
    'dart:developer':
        'https://api.dartlang.org/stable/1.24.2/dart-developer/dart-developer-library.html',
    'dart:html':
        'https://api.dartlang.org/stable/1.24.2/dart-html/dart-html-library.html',
    'dart:indexed_db':
        'https://api.dartlang.org/stable/1.24.2/dart-indexed_db/dart-indexed_db-library.html',
    'dart:io':
        'https://api.dartlang.org/stable/1.24.2/dart-io/dart-io-library.html',
    'dart:isolate':
        'https://api.dartlang.org/stable/1.24.2/dart-isolate/dart-isolate-library.html',
    'dart:js':
        'https://api.dartlang.org/stable/1.24.2/dart-js/dart-js-library.html',
    'dart:js_util':
        'https://api.dartlang.org/stable/1.24.2/dart-js_util/dart-js_util-library.html',
    'dart:math':
        'https://api.dartlang.org/stable/1.24.2/dart-math/dart-math-library.html',
    'dart:mirrors':
        'https://api.dartlang.org/stable/1.24.2/dart-mirrors/dart-mirrors-library.html',
    'dart:svg':
        'https://api.dartlang.org/stable/1.24.2/dart-svg/dart-svg-library.html',
    'dart:typed_data':
        'https://api.dartlang.org/stable/1.24.2/dart-typed_data/dart-typed_data-library.html',
    'dart:web_audio':
        'https://api.dartlang.org/stable/1.24.2/dart-web_audio/dart-web_audio-library.html',
    'dart:web_gl':
        'https://api.dartlang.org/stable/1.24.2/dart-web_gl/dart-web_gl-library.html',
    'dart:web_sql':
        'https://api.dartlang.org/stable/1.24.2/dart-web_sql/dart-web_sql-library.html'
  };

  ///  dartlang tools map
  Map<String, String> dartToolM = {
    'DartPad':
        'great way to learn Dart syntax and to experiment with Dart language features and core libraries (except for dart:io and libraries that depend on dart:io).',
    'Pub':
        'Manages Dart packages, making it easy for you to install, use, and share Dart libraries, command-line tools, and other assets.',
    'DartDoc':
        'Use dartdoc to generate HTML documentaton for your Dart package. https://github.com/dart-lang/dartdoc',
    'DartDevCompiler':
        'The Dart development compiler (dartdevc, also known as DDC) lets you run and debug your Dart web app in Chrome.',
    'DartFormat':
        'Formats your code, following the recommendations of the Dart Style Guide. IDEs that support Dart generally allow you to format the code within the IDE.',
    'VM':
        'The Standalone VM. You can use the dart tool (bin/dart) to run Dart command-line apps such as server-side scripts, programs, and servers.',
    'Observatory':
        'Observatory is a tool for profiling and debugging your apps. You can use .. flags to enable Observatory and to instruct the VM to delay the start up, or the exit, of an isolate',
    'IDE s':
        'Dart plugins exist for many commonly used IDEs. If you’re writing web apps and don’t already have a favorite IDE, try WebStorm, which comes with Dart support.',
    'Static Analyzer':
        'Evaluates and reports any errors or warnings in your code. The Dart plugin for your IDE should make use of Dart’s analysis engine ..',
    'Web':
        'Google builds many critical web apps using the Dart programming language, often with AngularDart.',
    'Flutter':
        '.. lowers the bar to entry for building mobile apps. It speeds up development of mobile apps and reduces the cost and complexity of app production across iOS and Android.',
    'AngularDart':
        'AngularDart is a web app framework that focuses on productivity, performance, and stability. Hundreds of Google engineers use AngularDart..',
    'Polymer':
        'Polymer.dart is a new type of library for the web, built on top of Web Components, and designed to leverage the evolving web platform on modern browsers.  ..Polymer is just one of several web libraries available for Dart.',
    'b': ' '
  };

  ///  separate phrases and said, picked from net and dartlang.org
  Map<String, String> phrasesM = {
    'ABS': ' ',
    'Angular Dart':
        'AngularDart has a reputation as a framework that produces streamlined and blazing-fast code.',
    'a': ' ',
    'b': ' ',
    'Call method':
        'Given all the complications the call method, the language team intends to eventually remove this feature from the language.',
    'c': ' ',
    'Class': ' ',
    'd': ' ',
    'e': ' ',
    'Function': ' ',
    'Fail': ' ',
    'Type Generic': 'Because Darts generic types are covariant... ',
    'Type Subtyping':
        'Usually, subtyping is written using the "<:" operator: Apple <: Fruit.',
    'http': 'With http you always have to import http/browser_client.dart.',
    'i': ' ',
    'Instance': ' ',
    'int': ' ',
    'j': ' ',
    'k': ' ',
    'l': ' ',
    'Match': ' ',
    'Method Overloading':
        'method overloading. I think this is also considered for the future. Wasn not possible in Dart 1.x because of optional types',
    'Mirror':
        'Mirror is good if you are 1% of Dart users and do not mind of AOT.',
    'num': ' ',
    'Object': ' ',
    'Obsevatory': 'When you launch your app in debug mode, it should print an URL that allows you to access Observatoryt',
    'Publish': ' ',
    'Queue': ' ',
    'R': ' ',
    'Strong mode':
        '..optional in the first version of the language. Integrated part of the second.',
    'T': ' ',
    'This':
        'The only time you need to use this. is when a local variable with the same name shadows the member you want to access.',
    'Type': 'Typesystems help you scale. The type system gives us guarantees.',
    'U': ' ',
    'Void': 'void is not a user-accessible Type (yet) .. isnt that 2.0',
    'Work':
        '..write more explicit code and eliminating the potential for a runtime error is the right tradeoff every day of the week.',
  };

  ///  data from:  https://www.dartlang.org/faq
  Map<String, String> faqDartM = {
    'Isn’t Dart a lot like Java?': 'Dart has some similarities with Java.',
    'How does Dart relate to Go?':
        '.. they are independent and have different goals. As a result, they make different choices, and the languages have very different natures ..',
    'Why isn’t Dart more like x y z?':
        'Various reasons, depending on the language being asked about.',
    'Why isn’t Dart syntax more exciting?':
        'We did throw in some nice syntactic features such as this. constructor args and => for one-line functions, but Dart chooses familiarity over excitement.',
    'Does Dart have reflection capabilities?':
        'For servers and command-line scripts, we have reflection support from the mirrors API.',
    'Can Dart add tuples, pattern matching, non-nullable types, partial evaluation, optional semicolons?':
        'The Dart language is now at 1.x, and Dart 2.0 is in development. Future releases might be able to include your feature',
    'Is Dart a statically typed language?':
        'With both types of checks, Dart has a sound type system. Types won’t be optional in Dart 2.0.',
    'What is strong mode?':
        'Strong mode contributes to Dart’s implementation of a sound type system.',
    'Why are generics covariant?':
        '.. fit a common intuition that programmers have..  such as in the common “read-only” use of a generic.',
    //  TODO  and more.. tools:
    //  '' : ' ',
  };

  ///  What is to correct in dawo by:
  ///  https://www.dartlang.org/guides/language/effective-dart#documentation
  Map<String, String> effectiveDartM = {
    ' ': ' ',
    'a': ' ',
    'b': ' ',
    'collections': 'DO use collection literals when possible. No constructor.',
    'c': ' ',
    'd': ' ',
    'e': ' ',
    'f': ' ',
    'g': ' ',
    'h': ' ',
    'i': ' ',
    'j': ' ',
    'k': ' ',
    'libraryPrivate': 'PREFER making declarations private. ',
    'l': ' ',
  };

  ///
  Map<String, String> whyDartM = {
    ' ': ' ',
    'a': ' ',
    'b': ' ',
    'c': ' ',
    'd': ' ',
    'e': ' ',
    'f': ' ',
    'g': ' ',
    'h': ' ',
    'i': ' ',
    'j': ' ',
    'k': ' ',
    'l': ' ',
  };

  ///  some links to no-comprendo stuff in Dart. lol
  Map<String, String> hardSpotsDartM = {
    ' ': ' ',
    'a': ' ',
    'b': ' ',
    'c': ' ',
    'd': ' ',
    'e': ' ',
    'f': ' ',
    'g': ' ',
    'h': ' ',
    'i': ' ',
    'j': ' ',
    'k': ' ',
    'l': ' ',
  };

  void buildMaps() {
    dartlangClayM.addAll({
      'dartlangSubjects': dartlangSubjectsM,
      'dartlangApi': dartlangApiM,
      'dartTool': dartToolM,
      'phrases': phrasesM,
      'fagDart': faqDartM,
      'whyDart': whyDartM,
      'hardSpots': hardSpotsDartM
    });
  }
} //  -----  class LearnDartlang

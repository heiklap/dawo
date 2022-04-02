/// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
/// is governed by a BSD-style license that can be found in the LICENSE file.
///
///  ##  Dawo, 0.9.6.  learning Dartlang project.
/// Beginner Dart programmers kickoff to develop a glorious pub package; dawo.
/// Make it big, complicated; then organize, and make internal systematics.
/// dwv: version:   0.9.6  1.4.2022
/// V:  0.3.0  Modify comments, style and clarity
///
//  devMemo: Dawo, started dev,  nothing special.
//  My other package:  dawolang:    //  pub 0.0.1 or path dependency.
//      path: C:\..\Public\..\dawolang
//  pub run build_runner build --output build

library dawo;

//  If you are using dawo right here:
//  import 'dawo_app';Plan something instead

//  TODO  #coma  Content-marketing, cheatSheet to present functionality
//  TODO  Build: import build_runner
//  import 'package:build_runner/build_runner.dart';

///  now, 14.4.20188 dawo_src exports all / many files
export 'package:dawo/dawo_src.dart';

///  Buffer also outside class, for testing and adding visibility.
StringBuffer dawoBuf = StringBuffer();

// TODO: Export any libraries intended for clients of this package.

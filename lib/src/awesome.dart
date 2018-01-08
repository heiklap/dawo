/// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
/// is governed by a BSD-style license that can be found in the LICENSE file.
///  dawo version  :  0.0.7.  18.12.2017

/*  NOTE: Pub
By convention, implementation code is placed under lib/src. Code under lib/src
is considered private; other packages should never need to import src/....
To make APIs under lib/src public, you can export lib/src files from a file
that’s directly under lib.
 */
part of dawo_src;

// TODO: Put public facing types in this file.

///  buffer also outside class, for testing and adding visibility
var awesomeBuf = new StringBuffer();

/// This file is originally created by Dart tools
/// Checks if you are awesome. Spoiler: you are.
class Awesome {
  String motto = 'Presenting model class to connect html and Dart';

  bool get isAwesome => true;
}

//

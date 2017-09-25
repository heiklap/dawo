// Copyright (c) 2017, Heikki L. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  dawo version:  0.0.3  25.9.2017

import 'dart:html';

import 'package:dawo/dawo.dart';

void main() {
  print('-------------------  main running  ---------------------------------------');
  /// just calling some dawo methods;
  String s = renderDawo().toString();
  print(s);

  String sText = 'Your Dart app (dawo) is running $s.';


 // querySelector('#output').text = 'Your Dart app is running $s.';
  querySelector('#output').text = sText;

  print('-------------------  main done  ---------------------------------------');

}

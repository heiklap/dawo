// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:dawo/dawo.dart';

/*
IntelliJ IDEA 2016.2.2
Build #IC-162.1628.40, built on August 16, 2016
JRE: 1.8.0_76-release-b216 x86
JVM: OpenJDK Server VM by JetBrains s.r.o

Dart Plugin 15.3.2017.    162.1469    Uninstall. !!
     15.3.2017            162.2924  installed

     !!!!  Windows file-properties: pub.dart.snapshot is originated from
     other computer, and it's use is prevented. Want to allow it? ??
      OK.  allowed.  Done:  No effect
      New Dart installation:  no Effect.
      System is 64 bit

 */

var dawoOperation;


void main() {
  print('------  de_test  dawo  ------------');

  dawoInit;

  renderDawo();

  var bl = new BLib();
  bl.blOpInit(4, dawoOperation);
  bl.showInfo();


  var ap = new DawoApp();
  print(ap.version);
  print(ap.motto);





  print('------  de_test  dawo  done --------');
}


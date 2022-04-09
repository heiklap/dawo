// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved.
// Use of this source code is governed by a BSD-style license that
// can be found in the LICENSE file.
//
///  ##  dg_box  -  presentation in boxes.
///
///  * dwv: version:   0.9.9.  8.4.2022.  devState: 5%
///  *      GitHub:
//

part of dawo_dev;

///
class DevGlbBox {
  String name = 'class DevGlbBox in :dawo:dev:';
  String dexS = ':dev:dgBox:';

  ///  copied to dawo-dev_box.dart
  void glbAndDevBox() {
    glb.dawoLogo.forEach(print);
    //
    devBox(':d:ex:main:', ['* keyWords *', '* keywords *'],
        [glb.keyWords, glb.keyWordsSmall], 28);
    devBox(
        'By:dev:versions:',
        ['*  -  later  -  version   - *', '*  -  later  -  version   -*'],
        [
          tl.mapToFineList(dev.later, 75, 20),
          tl.mapToFineList(dev.version008, 75, 20)
        ],
        24);
    devBox(
        'By:dev:versions:',
        ['*   plugins   dev-version   *', '**   plugins   dev-version   **'],
        [
          tl.mapToFineList(dev.plugins, 75, 20),
          tl.mapToFineList(dev.version0075, 75, 20)
        ],
        24);
    print(':glb:print:states:  set to false. only :buf: used');
    print(glb.prSt);
    print('-- Change print status: glb.setGlbPrint(true or false) ------');
    glb.box(dexS);
  } //     -----     glbAndDevBox

} //     -----     DevGlbBox

DevGlbBox devGlbBox = DevGlbBox();

//

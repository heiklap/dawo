//  Copyright (c) 2017, Heikki K Lappalainen. All rights reserved.
//  Use of this source code is governed by a BSD-style license
//  that can be found in the LICENSE file.
//
///  ##  mixin_box   Constructing mixin_box elements
///              for 64 classes in dawo
/// * dwv: version:   1.1.0.  23.11.23.  -  devState:  5%
///
//



part of venue;


//  String _mxChainS = ':97531 mx135 79:JoinMxx';
///  String :  "mx135 " marks box-method for mixin system
//  Out:paste from glb:   void mxxBox (String _caller) { //  :code:box:   }
///  Calling boxServe-class for info.
///  Name: TODO   can not be simple box  =>  mxBossBox
///  Error:  box can not be used in alpha-library
void mxBossBox(String caller) {
  //  is:  mxBossMixin  available ?
  mxC.mxBossBuf.writeln(':mxxBoss:box:start:  ');
  //  buf.writeln(':mxxBoss:box:start:  ');
  //  use: boxServe  OR  create own class here
  //  unused::  final int _sw = 140; //  screen width, changed later =>
  // unused::  final int _rc = 15; //  row count
  //  ???  Keep matrix here on callers side all the time
  //  unused::  List<String> _mxxBossMatrix = new List(_rc);
  String boxHeader = ':mxxBoss:box:';

  print('-->>-->>  $boxHeader boxServe  start  -->>-->>--  ');
  boxServe.init(18, 150, '_'); //  rows, width or: 0 = use default 47, 195
  boxServe.construct(':mxxBoss:box:', ':mxxBoss:box: C: $caller');

  boxServe.aHeader(1, 5, '* *  Print-State * * ');
  boxServe.aBox(2, 4, 12, 20, tl.mapToListB(glb.prSt));
  String mxACS = mxC.mxCallCount.toString();
  boxServe.aHeader(16, 5, ' mxSctC: $mxACS ');

  boxServe.aHeader(0, 60, ' *  MIXIN LOG SIG &  STATES  *');

  boxServe.aHeader(2, 20, '* * mxxC   Log List * * ');
  boxServe.aHeader(2, 80, ' < ');  //  mark right-up-corner
  boxServe.aBox(3, 20, 12, 60, mxC.mxLogL);


  boxServe.aHeader(2, 90, '* * xxC  m Sig List * * ');
  boxServe.aBox(3, 90, 12, 55, mxC.mxSigL);


  // **   boxServe.aHeader(2, 42, 'Info:');
  // **   boxServe.aBox(2, 50, 2, 70, glb.infoL);
  // **   boxServe.aHeader(6, 30, 'Phases:');
  // **   boxServe.aBox(7, 30, 5, 5, ['Play', 'Test', 'Code', 'Again']);
  // **   boxServe.vertLine(6, 29, 7); //  phases
  // **   boxServe.aHeader(6, 50, '* Plans: *');
  // **   boxServe.aBox(7, 50, 4, 20, ['Plans: ', 'More plans', 'xxxx', 'yyyyy']);
  // **   boxServe.vertLine(6, 49, 7); //   plans
  // **   boxServe.aHeader(6, 80, '* reserved *');
  // **   boxServe.aBox(7, 80, 5, 15, [
  // **     'A',
  // **     'B',
  // **     'C',
  // **     'C',
  // **   ]);
  // **   boxServe.aHeader(6, 100, '* Mixin:s  *');
  // **   boxServe.aBox(7, 100, 5, 15, [
  // **     'State',
  // **     'Set',
  // **     'Puf',
  // **     'Print',
  // **   ]);
  // **  boxServe.vertLine(1, 117, 13); //  Up-right edge
  // **  boxServe.vertLine(1, 139, 13); //  Up-right edge
  // **  boxServe.aHeader(1, 120, '* Actions *');

  boxServe.show(boxHeader, 'print', 28);
  boxServe.done(boxHeader);
  print('--<<--<<  boxHeader boxServe  done  --<<--<<--  ');
}     //     -----     box


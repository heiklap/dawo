// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
/// *
/// *  interface-Base class for mis classes
/// *  dawo version:   0.7.0    created:  27.3.2022
/// *
/// *  devState: 8%  PLAN: yes   SCHEDULE:  NO.
//

//  library mis_interf; serving as Base / master class for mis classes
part of mis;

///
///  interface-Base class for mis classes, serves more like a model to
///                       further develop more complicated classes.
///       users:    affair, bind, mis_interf, misorate, store
class MisInterfaceBasis {
  ///
  String name = '* misorate-united *';

  ///
  String motto = '* MisMotto *';

  ///
  String clause = '*MisClause*';

  ///  changed ab from: * BN * to :hb:
  String ab = '*CIB*';

  ///
  StringBuffer buf = StringBuffer();

  ///  Recording simple events, to track activity / flow.
  List<String> logL = [];

  ///  Meaningful, demanding action events, to track activity / flow.
  List<String> sigL = [];

  //  LangLL #language
  List<List<String>> langLL = [
    [' * * *        :mis:lang:basis:                * * *'],
    ['    ', '   ', '3    ', '    ', '5    ', '   ', '7   '],
    ['    ', '   ', '3    ', '    ', '5    ', '   ', '7   '],
    ['    ', '   ', '3    ', '    ', '5    ', '   ', '7   '],
    [' * * *                                          * * *']
  ]; //     langLL

  ///  NOTE  First record:  'FirstActor'
  Map<String, Map<String, String>> placardMM = {
    'FirstActor': {
      'actor': 'first',
      'sender': 'fS',
      'receiver': 'fR',
      'command': 'fC',
      'msg': 'fMsg'
    }
  };

  ///
  Map<String, String> sayM = {};

  ///  for print
  bool _pB = false;

  ///  Give variables their start values.
  void init() {} //     -----     init
  ///  TODO  coming
  void build() {
    _pB;
  } //     -----     init

  ///  Give variables their start values.
  void buildMissions(String caller) {} //     -----     build

  ///  Give variables their start values.
  void act() {} //     -----     act

  ///  Shaping everybody-to-use functionality for series of commands.
  void actAsync() {
    //  code here
  } //     -----     actAsync

  ///  Shaping everybody-to-use functionality for series of commands.
  void roll() {
    //  code here
  } //     -----     roll

  ///  Shaping everybody-to-use functionality for series of commands.
  void rollExtra() {
    //  code here
  } //     -----     rollExtra

  ///  Shaping joint functionality for presentation.
  void show() {
    //  code here
  } //     -----     show

  ///  Box-shaped list, String or buffer output.
  void boxDw(String _caller) {}

  ///  Nice one-row report.
  String rowReport() {
    //  String cS = bindC.toString();
    //  String mS = bindingM.toString();
    //  String _s = ':bind:rr- C:$cS  $mS';
    //  return _s;
    return ('ret str');
  }

  ///
  void done() {}

  ///
  void sleep() {}

  ///  constructor: superclass must have a zeroarguments constructor
  ///  MisInterfaceBasis(this.name, this.motto, this.clause);
  MisInterfaceBasis();
} //     -----     MisInterface

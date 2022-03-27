// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
/// *
/// *  interface-Base class for corp classes
/// *  dawo version:   0.6.0    created:  26.3.2022
/// *
/// *  devState: 8%  PLAN: yes   SCHEDULE:  NO.
//

//  library corp_interf; serving as Base / master class for corp classes
part of corp;

///
///  interface-Base class for corp classes, serves more like a model to
///                       further develop more complicated classes.
///       users:    affair, bind, corp_interf, corporate, store
class CorpInterfaceBasis {
  ///
  String name = '* corporate-united *';

  ///
  String motto = '* CorpMotto *';

  ///
  String clause = '*CorpClause*';

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
    [' * * *        :corp:lang:basis:                * * *'],
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

  ///  Give variables their start values.
  void init() {} //     -----     init

  ///  Give variables their start values.
  void build() {} //     -----     build

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
  ///  CorpInterfaceBasis(this.name, this.motto, this.clause);
  CorpInterfaceBasis();
} //     -----     CorpInterface

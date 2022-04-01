// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
/// *
/// *  Customer model class
/// *  dwv: version:   0.6.0    created:  26.3.2022
/// *
/// *  devState: 5%  PLAN: yes   SCHEDULE:  NO.
//

//
part of corp;

///
///
///  Sample for Customer cass
class CustomerBasis {
  ///
  String name = '* Sample Customer *';

  ///
  String motto = '* uy Cheap, consume wisely *';

  ///
  String clause = '* Customer Clause *';

  ///  changed ab from: * BN * to :hb:
  String ab = '*CUST*';

  ///
  StringBuffer buf = StringBuffer();

  ///  Recording simple events, to track activity / flow.
  List<String> logL = [];

  ///  Meaningful, demanding action events, to track activity / flow.
  List<String> sigL = [];

  //  LangLL #language
  List<List<String>> langLL = [
    [' * * *      :customer:lang:basis:              * * *'],
    ['    ', '   ', '3    ', '    ', '5    ', '   ', '7   '],
    ['    ', '   ', '3    ', '    ', '5    ', '   ', '7   '],
    ['    ', '   ', '3    ', '    ', '5    ', '   ', '7   '],
    [' * * *                                          * * *']
  ]; //     langLL

  ///  NOTE  First record:  'FirstActor'
  Map<String, Map<String, String>> placardMM = {
    'FirstActor': {
      'actor': 'customer',
      'sender': 'C1',
      'receiver': 'R-C1',
      'command': 'C-act',
      'msg': 'C-Msg'
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
  CustomerBasis(this.name, this.motto, this.clause);
} //     -----     CustomerBasis

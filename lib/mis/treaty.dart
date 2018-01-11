// Copyright (c) 2018, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
/// ##  Treaty:  action-field for two missions; to say and bargain
/// *
/// * dawo version:  0.0.7+. - 18.12.2017  -   devState: 40 %
/// * GitHub:
/// * Connect:  #effort  #Schedule  #Week  #Month  from:  #equ
// * Hist:hkl  27.12.2017
//  NEXT:
//

//
//

/*
Name:   auction ??  accord,  bargain,  harmony,  contract?
agreement  :  sopimus, yksimielisyys, sopu, yhtäpitävyys
understanding  :  ymmärtäminen, käsitys, ymmärrys, tuntemus, ymmärtämys, sopimus
contract - 1  :  sopimus, urakka, välikirja
treaty  :  sopimus
pact - 0  : sopimus, liitto
accord - 0  : sopimus, harmonia, yhtäpitävyys, sopusointu, suostumus
deal  :  sopimus, kauppa, jako, kohtelu, reilu peli, työt
bargain  :  kaupat, kauppa, sopimus, tarjous, hyvä kauppa
convention  :  sopimus, kokous, yleinen tapa, sopivuussäännöt
arrangement  :  järjestely, sovitelma, sovitus, sopimus, järjestys, toimenpide
settlement  :  ratkaisu, asutus, tilitys, sopimus, maksu, siirtokunta
covenant


 */

library treaty;

import 'dart:math';

/*
import 'package:dawo/alpha.dart';
import 'package:dawo/beta.dart';
import 'package:dawo/dawo_app.dart';
import 'package:dawo/shower.dart';
import 'package:dawo/rumba.dart';
import 'package:dawo/dev/dawo_dev.dart';
import 'package:dawo/mis/camp.dart';
*/

import 'package:dawo/mis/equipment.dart';
import 'package:dawo/mis/missions.dart';
import 'package:dawo/mis/chore.dart';
import 'package:dawo/src/box_serve.dart';

//  import 'package:dawo/corp/bind.dart';
//  import 'package:dawo/corp/connector.dart';
//  import 'package:dawo/tools.dart';

StringBuffer treatyBuf = new StringBuffer();
var treatyRandom = new Random(27);
Map<String, Treaty> treatyM = {};

///
List<String> bilateralL = [];

//  Fill this later.
Map<String, String> bilateralM = {
  'purpose': '',
  'lang': '',
  'area': '',
  'product': '',
  'sell': '',
  'buy': '',
  'ask': '',
  'always': '',
  'newer': '',
};

//  Fill this later.
Map<String, String> bilateralWeekM = {
  'purpose': '',
  'lang': '',
  'area': '',
  'product': '',
  'sell': '',
  'buy': '',
  'ask': '',
  'always': '',
  'newer': '',
};

List<String> bilateralWeekL = [''];

///  QUEST:  HowTo efficiently use this DailyTreaty class to run dawo-roll?
///  TODO  Tie equ.week and month to get #TimeSchedule
///  - effect, impact,   doing!!   deed  !!
///  Meant to give frames / road-map to daily-objects.
///  2 Mission objects inside; insider , used:  11 / 16
///  and outsider   used:  2 / 3
class Treaty {
  String name = 'DailyTreaty';
  String msg = 'DailyTreatyMsg';
  String day = '';

  /// Object that has placardM, say, and clause.
  //  Two Missions act here:
  //  1. Mission that is set in constructor, and is "master" here.
  Mission insider;
  //  Mission misInsideClass;
  /// 2. Mission, that is set in "week-day-bundle" functions, and acts like a guest.
  Mission outsider;

  //  Usage:  no.   Missions default chores, that they are using here (PLAN).
  BlanketChore inChore;
  BlanketChore outChore;

  ///  Present objects info, used in function parameter calls.
  Map<String, String> placardM = {
    'actor': 'DailyAct',
    'sender': '_dailyTreaty:dayX:',
    'receiver': '',
    'command': ':dAct:com:',
    'msg': 'dAct-msg:',
  };

  ///  Logging events of this day.
  Map<String, String> logM = {
    'logM:for': ':daily:Treaty:',
  };

  ///  Constructor, that builds instances of this class.
  Treaty(this.name, this.msg, this.insider);

  ///  IDEA:  Used as playBack.  Message / info carrier.
  ///  Simulating kind-of remote process.
  void dailyCourier() {
    print('::daily:courier::  from :daily:Treaty:');
    //  return...x
  }

  ///  Init method to set box shapes and one field value.
  void _init(int rows, sw, String pM) {
    day = msg.substring(0, msg.indexOf(' ')); //  First word.
    logM.putIfAbsent('Init: $name', () => '$msg in :daily:work:');
    // boxServe.init(16, 125, '_');
    print('    ---- $name    :dailyTreaty:method:init:');
  }

  ///  Build method to further construct class. (parameter String _job)
  void _build() {
    logM.putIfAbsent('Build: $name', () => '$msg in :daily:work:');
    //  more code
    print('    ---- $name    :dailyTreaty:method:build:');
  }

  ///  To avoid using: r o l l   revel: Finnish lang:   hummailla, hurvitella
  ///  Method that takes care of big part of this classes functionality.
  ///  Parameters, to be sent forward: rows, screenWidth, padMark
  void revel(String _job, int rows, sw, String pM) {
    _init(rows, sw, pM);
    _build();
    logM.putIfAbsent('revel: $name', () => '$msg in :daily:work:');
    print('    ----     :dailyTreaty:method:revel:');
    //  If using missions for something:
    //  try it:   insider.
    //  try it:  outsider.

    //  weekSayL.addAll(tl.mapToFineList(insider.say, 15, 45));
    print('    ---- $name    :dailyTreaty:method:revel:ownStuff:');

    ///  To find words used by both in insider / outsider say maps.
    bilateralL.addAll(bilateral());
    boxDay(':daily:Treaty:revel:', rows, sw);
    //  PLAN:  use boxBargain, maybe with: 16, 140 size.
    //  boxBargain(':daily:Treaty:revel:', '* header *');
    ///  maybe:  call to insider's roll method
    ///  maybe:  call to something like "days job-table".
    _show();
    _done();
  }

  //  Premature to PLAN: #auction.  This is where member-days #say and #bid.
  List<String> shout() {
    //  Code for; say, bid, bing, buy, sell, ask..
    return ['Shout', 'Auction', 'String', 'List'];
  }

  ///  say-deal between insider and outsider Missions.
  ///  "We are gathered here to make some deals.."
  ///  PLAN:  Operation, where are 2 bidders.  Not ready.
  List<String> bilateral() {
    //  code
    int _count = 0;
    List<String> retL = [];
    String _word = '';
    //  Find if objects have same interests in say-map
    for (var x in insider.say.keys) {
      List<String> wordL = outsider.say[x].split(' ');
      print(':outsider:wordL:  $wordL    ');
      //  leave first word out.  like: packDawo, Dartlang, aso
      for (var _wC = 1; _wC < wordL.length; _wC++) {
        if (x.indexOf(_word) > -1) {
          _word = wordL[_wC];
          String _ni = insider.name.substring(0, 3);
          String _no = outsider.name.substring(0, 3);
          String _nb = ('$_ni:$_no');

          String _sb = bilateralM[x];

          ///  Update map value with new word
          bilateralM[x] = ('$_sb$_nb  ');
          print(':bilateral:success: :name: $_nb::   $_word');
          _count++;
          retL.add('$_nb w:$_word');

          ///  t.mapUpdate  if not exists.

        }
      } //  --  wordL
    } //  --insider.say
    bilateralL.addAll(retL); //  empty this list in some phase
    bilateralWeekL.addAll(retL);
    print(':bilateral:success:    $retL  :count:  $_count');
    return retL;
  }

  //  This code is just copied from: equipment.
  //  Using random generator for sample data.
  ///  "We are all gathered here in holy ceremony of auction, to make some deals.."
  ///  usage:  in example daily_action.dart weekBox
  ///  simulation: Produce nice-looking allocation-list of resources.
  List<String> auction(int _r, int _c) {
    //  TODO  use _c variable to control width
    //  init();  must be done somewhere.
    List<String> _l = [];
    StringBuffer _sB = new StringBuffer();
    _l.add('Say Purp:   Lang:    area:    Prod:Sell:  Buy: Ask: ');
    for (var x = 0; x < _r; x++) {
      String _dS = x.toString();
      //TODO  padRight(5, ' ')
      String _sbW = 'D:$_dS ';
      _sB.write(_sbW.padRight(5, ' '));

      ///  Write one of 8 resources in right place
      ///  int nextInt(int max);
      int _rand = treatyRandom.nextInt(8); //  get one of first 8 resources.
      for (var x = 0; x < 8; x++) {
        if (x == _rand) {
          //  padRight(8, ' ')
          String _sP = equ.resL[x].padRight(8, ' ');
          _sB.write(_sP);
        } else {
          _sB.write('_______ ');
        }
      }
      _l.add(_sB.toString());
      //  _sB.write();
      _sB.clear();
    }
    return _l;
  }

  ///  Using boxServe(),  (boxDay ?)  or devBox for output.
  ///  Has not now much job since revel runs (routine) boxDay.
  ///  This might eventually run boxBargain, when it gets ready.
  void _show() {
    logM.putIfAbsent('Show: $name', () => '$msg in :daily:work:');
    // boxServe.show(':dailyTreaty:monday:', 'print');
    print('    ---- $name    :dailyTreaty:method:show:');
    //  Run _objects show / .box method
    //  insider.box();
  }

  ///  Model layout for basic fields.
  void _dayLayout() {
    ///  Place String-header in wanted place.
    boxServe.aHeader(1, 32, ':daily:Treaty:box:');
    String _s = insider.name;
    boxServe.aHeader(1, 62, ':mis:name:   $_s');

    boxServe.aHeader(1, 4, 'name: $name');
    boxServe.aHeader(2, 4, 'msg:  $msg');
    boxServe.aHeader(3, 4, '- market-place');

    print('----    :treaty:day:layout:    ----');
    print(insider);
    print(insider.name);
    print(insider.say['lang']);
    print(insider.motto);
    print(insider.clause);

    //  hklTry:

    String _s2 = insider.say['lang'];
    boxServe.aBox(2, 32, 1, 68, [':mis:lang:   $_s2']);
    String _s3 = insider.say['buy'];
    boxServe.aBox(3, 32, 1, 68, [':mis.buy:   $_s3']);
    String _s4 = insider.clause;
    boxServe.aBox(4, 32, 1, 68, [':clause:   $_s4']);

    boxServe.aHeader(6, 78, ' :out: / :in: common names ');

    String _o5 = outsider.name;
    boxServe.aHeader(6, 4, ' :out:name:   $_o5');
    String _o6 = outsider.say['lang'];
    boxServe.aBox(7, 4, 1, 68, [':lang:   $_o6']);
    String _o7 = outsider.say['sell'];
    boxServe.aBox(8, 4, 1, 68, [':sell:   $_o7']);
    String _o8 = outsider.say['buy'];
    boxServe.aBox(9, 4, 1, 68, [':buy:   $_o8']);

    String _o9 = outsider.say['area'];
    boxServe.aBox(10, 4, 1, 68, [':area:   $_o9']);
    String _o10 = outsider.say['product'];
    boxServe.aBox(11, 4, 1, 68, [':prod:   $_o10']);
    String _o11 = outsider.say['purpose'];
    boxServe.aBox(12, 4, 1, 68, [':purp:   $_o11']);

    boxServe.aBox(7, 70, 8, 32, bilateralL);
  }

  ///  Model layout for basic fields.
  void _weekLayout() {}

  ///  For day events,  weekBox collects all days.
  ///  PLAN:  Very small day-info-box, for.. routine day info / events.
  ///  called by::  revel
  void boxDay(String caller, int _r, _w) {
    treatyBuf.writeln('::buf:  box called for :daily:Treaty:  $name ');
    int bufLength = treatyBuf.length;

    ///  Give shapes for screen matrix.
    boxServe.init(_r, _w, '_'); //  rows, width or: 0 = use default 47, 195
    boxServe.construct(':day:$name ', ':daily:Treaty:box:');
    //  Get basic bunch of day data.
    _dayLayout();

    boxServe.show(':daily:Treaty:  $name ', 'print', 8);
    boxServe.done(':daily:Treaty:  $name ');

    //  TODO  Bids to week - #auction.
  }

  ///  PLAN:  ready-shape 16-140 box  just for bargain
  ///  called by::  Nobody
  void boxBargain(String caller, _header) {
    treatyBuf.writeln('::buf:  box called for :bargain:daily:Treaty:  $name ');
    int bufLength = treatyBuf.length;

    ///  Give shapes for screen matrix.
    boxServe.init(16, 140, '_'); //  rows, width or: 0 = use default 47, 195
    boxServe.construct(':bargain:$name ', ':daily:Treaty:box:');
    //  Get basic bunch of data.
    _dayLayout();
    //  _bargainLayout();  //  when it is ready
    boxServe.show(' :bargain:daily:Treaty:  $name ', 'print', 22);
    boxServe.done(' :bargain:daily:Treaty:  $name ');
    //  TODO  Bids to add to week - #auction.
  }

  ///  Usual this-job-is-ready -method. Not setting #st Map yet.
  void _done() {
    logM.putIfAbsent('Done: $name', () => '$msg in :daily:work:');
    // boxServe.done(':dailyTreaty:monday:test:');
    print('    ---- $name     :dailyTreaty:method:done:');
  }
} //  -----  Treaty class.

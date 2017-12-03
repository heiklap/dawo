// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  ##  box_serve presenting objects in cl in box-shaped form .
/// * Structuring-logic, elements order, is in callers side
/// * PLAN:  Automatic ordering of elements, if client do not give it.
/// * dawo version:  0.0.6.  27.11.2017.   devState:  60%
/// * GitHub: yes
//

library box_serve;

import 'dart:math'; //  for min
import '../tools.dart';
//  import '../shower.dart';
import '../alpha.dart';
import '../src/glb.dart';

///  Schedule connect, opJoin corporate, bind, binding
class BoxServe {
  int boxCount = 0;
  int sw = 195; //  default:  screen width
  int rc = 47; //  default:  row count
  String pm = '-'; //  default
  List<String> _matrix =
      new List(); //  (rc);  lets not decide here lists length
  int _fakeRow = 100; //  Get nice  100 - 147 numbers
  List<String> _resAllocL = []; //  Some extra resource
  ///  Forming vertical line for screen.
  List<String> verticalLineL = []; //  max: rc - 2)

  //  Methods to be called from outside class: init, construct, build
  //  construct('$_caller :roll:');
  //  build('$_caller :roll:');

  ///  Initialize measure values by parameters
  ///  //  TODO  set min-max-maxWidthString values
  void init(int h, w, String _pm) {
    pm = _pm;

    ///  Use default, unless parameters are > 0
    if ((h > 0) && (w > 0)) {
      rc = h;
      sw = w;
    }
    verticalLineL.addAll(tl.strToList('|', rc - 2));
    String rowS = ' '.padRight(sw);
    for (var x = 0; x < rc; x++) {
      //  add to matrix rc items.
      _matrix.add(rowS);
    }
  } //  -----  init

  ///  Build matrix with top, left, bot
  void construct(String _caller) {
    boxCount++;
    for (var z = 1; z < _matrix.length - 1; z++) {
      //  do not handle first row.
      _fakeRow++;
      //  TODO  take only 2 last numbers to _fakeRowS like 123 = 23
      //  TODO  choose nice background mark for matrix.
      //  pad with low-density mark.   NO: '-'
      _matrix[z] = '$_fakeRow '.padRight(sw, pm);
    }
    ; //  <=  ;  dartFormatter is sometimes funny
    //  TODO  should  get #name in the middle of first line,
    String boxCountS = boxCount.toString();
    String m0ro = ':boxServe:nr: $boxCountS -:C: $_caller-------';
    int m0roI = m0ro.length;
    String m0row = m0ro.padRight(sw, pm);
    _matrix[0] = m0row;
    //  TODO  StampLeft ' '  // there is pm ! = ' '
    ///  Last row of matrix for range-10 marks; NOTE: rc - 1
    String bRowLong =
        '---------10---------20---------30---------40---------50---------60---------70---------80---------90---------00---------10---------20---------30---------40---------50---------60---------70-----';
    //  :BUG: Solved?  TODO  Make sure that this row is ==  sw !!!
    //.substring(0, sw);
    String bRow = bRowLong.substring(0, sw);
    _matrix[rc - 1] = bRow;
    //   '---------10---------20---------30---------40---------50---------60---------70---------80---------90---------00---------10---------20---------30---------40---------50---------60---------70';
  } //  -----  construct

  ///  Marks left of console screen to put table in convenient place for to see.
  void eyeMark14() {
    int pegC = _matrix.length;
    aHeader(min(pegC, 14), 0, 'peg'); //  Lay "screen-watch-anchor"
  }

  //  Fill list-data in matrix in r, _c coordinates.
  //  parameters now::  int _r, int _c, List<String> boxL, List<String> _mL)
  //  new parameters 3 and 4: _items, _w
  //  TODO :BUG: No error check for over-sized lists.
  //  anchorBox///  Add all list element to matrix
  void aBox(int _r, _c, _items, _w, List __l) {
    //  If not know list length / wanted items and width, try 100. lol
    tl.boxInList(_r, _c, _items, _w, __l, _matrix);
  }

  ///   Lay String in a certain place in matrix.
  ///   :QUEST:  This is too complicated, lol.
  void aHeader(int _r, _c, String s) {
    String _s1 = _matrix[_r].substring(0, _c);
    int _pos = _s1.length;
    int _length = _matrix[_r].length;
    String _s3 = _matrix[_r].substring(_pos + s.length, _length);
    _matrix[_r] = '$_s1$s$_s3';
  }

  //  Set vertical line to screen matrix
  void vertLine(int _x, _y, count) {
    String _newS;
    int toX = _x + count;
    for (var x = _x; x < toX; x++) {
      _newS = tl.changeLetter(_matrix[x], _y, '|');
      //  print(_newS);
      _matrix[x] = _newS;
    }
  }

  ///  New show method extracted from done
  void show(String _caller, String action) {
    eyeMark14(); //  put table to fit screen.
    print(_matrix.length);

    ///  if.. is awkward
    if (action == 'print') _matrix.forEach(print); //  only way!!
    //  return _matrix;  //  if type is: List<String>
  }

  ///  Lets see, if this will eventually be List<String>
  ///  TODO  #deprecated  split in:  show and #done
  void done(String _caller) {
    _matrix.clear();
    //  message somewhere??
    //  :BUG: ?? so clear all, to be sure.
    _resAllocL.clear();
    verticalLineL.clear();
    _fakeRow = 100;
  }

  ///  TODO : Constructor, to give shapes and measures

} //  -----  class BoxServe

BoxServe boxServe = new BoxServe();

///  TODO  Scope?  Can this reach called fields.
///  Using BaseStruct (dawoApp) fields to set usual fields in boxServe
///  _model is reference to BASE-class BaseStruct in alpha.dart.
///  Fields placement is copied from DawoApp.dart.
///  This template for BaseStruct fields is used in example/daily_work
void boxLayoutDap(BaseStruct _model, String _rubric) {
  int r9 = 9;
  //  TODO  BaseStruct class usage in boxServeModel
  _model.buf.writeln('buf: :boxServe: is ready to present data in box.');

  boxServe.aHeader(1, 4, '* *  States * * ');
  boxServe.aBox(2, 7, 6, 16, tl.mapToListB(_model.st));

  ///  rubric like: DAWO HIST INFO
  boxServe.aHeader(0, 60, ' :layout:dawoApp: ');
  boxServe.aHeader(1, 60, ' *  $_rubric  *  by :layout:baseStruct:dawoApp:');

  boxServe.aHeader(2, 22, 'Info:');
  String mottoS = _model.motto;
  String infoS = _model.info;
  boxServe.aBox(2, 30, 2, 48, ['$infoS', '$mottoS']);

  boxServe.aBox(2, 80, 4, 20, ['Agenda', 'Develop', 'Msg:', 'Versions']);
  boxServe.aBox(
      2, 92, 5, 20, ['1          ', '2         ', '3         ', '4          ']);

  //  TODO  also buffer must catch to inner buf.
  List<String> _bufList = [];
  _bufList.addAll(_model.buf.toString().split('\n'));
  boxServe.aHeader(r9 - 2, 7, 'Buffer:');
  boxServe.aBox(r9 - 1, 6, 28, 38, _bufList);
  boxServe.vertLine(r9 - 1, 5, 28); //  phases

  boxServe.aHeader(r9, 50, '* Plans: *');
  boxServe.aBox(r9 + 1, 50, 4, 20, ['Plans: ', 'More plans', 'xxxx', 'yyyyy']);
  boxServe.vertLine(r9, 49, 7); //   plans

  boxServe.aHeader(r9, 80, '* reserved *');
  boxServe.aBox(r9 + 1, 80, 5, 15, [
    'A',
    'B',
    'C',
    'C',
  ]);

  boxServe.aBox(3, 110, 5, 62, glb.dawoLogo);
  //  Lay "screen-watch-peg"
  //  howTo access rowCount for min(boxServe.rc,15) ??
  boxServe.aHeader(min(boxServe.rc, 14), 0, 'peg');
} //  -----  boxLayoutDab

///  UsingBaseStruct (connector) fields to set usual fields in boxServe
void boxLayoutlConnector() {}

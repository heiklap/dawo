// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  ##  box_serve presenting objects in cl in box-shaped form .
/// * Structuring-logic, elements order, is in callers side
/// * PLAN:  Automatic ordering of elements, if client do not give it.
/// * dawo version:  0.0.8.  -  13.3.2019.   devState:  60%
/// * GitHub: yes
//

library box_serve;

import 'dart:math'; //  for min

import '../dawo_app.dart';
import '../tools.dart';
//  import '../shower.dart';
import '../alpha.dart';
import '../src/glb.dart';

///  Schedule connect, opJoin corporate, bind, binding
///  Present callers List, Map, text data in row,col in boxes inside a matrix.
class BoxServe {
  int boxNum = 0;
  String boxNumS = '';
  int sw = 195; //  default:  screen width
  int rc = 47; //  default:  row count
  String pm = '-'; //  default
  //  (rc);  lets not decide here lists length
  //  title,   rubric
  //  should be upper level TODO
  String title = ' **  boxServe Title  **';
  //  should be upper level TODO
  String footer = ' **  boxServe Footer  **';
  String caller; //  should be upper level TODO
  ///  Will be combination of '$caller $boxNum.toString()'
  ///
  String name = '';
  Map<String, List<String>> logM = {};
  List<String> _matrix = new List();
  //  To save matrix AND mediate it to glb.
  StringBuffer _buf = new StringBuffer();
  String _bufName = ''; //  Form nice name for glb.buffers.X
  ///  #QUEST:  can this be made with #generator function?
  int _fakeRow = 100; //  Get nice  100 - 147 numbers
  List<String> _resAllocL = []; //  Some extra resource, like: equ/Equipment.
  ///  Forming vertical separator/note line in screen.
  List<String> verticalLineL = []; //  max: rc - 2)

  //  Methods to be called from outside class: init, construct, build
  //  construct('$_caller :roll:');
  //  build('$_caller :roll:');

  ///  Initialize measure values by parameters
  ///  TODO  set min-max-maxWidthString values
  /// Min rows is 4 !!   Min width is NOW:  55= NO!!   65 = YES!!
  void init(int h, int w, String _pm) {
    boxNum++;
    boxNumS = boxNum.toString();
    //  if boxes forgot to run DONE !!
    if (_matrix.length > 0) {
      print('* * * *  :DEBUG:BUG  _matrix length > 0  * * * * * * * * * * *  ');
    }

    pm = _pm; //  padMark
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
    logM.putIfAbsent(boxNumS, () => ['$boxNumS INIT']);
  }

  ///  Build matrix with top, left, bot
  ///  Too bad that users have to call both init and construct and...
  void construct(String _caller, _GlbBufName) {
    caller = _caller; //  save it to upper level variable.
    name = _caller; //  and to name.
    _bufName = _GlbBufName;

    for (var z = 1; z < _matrix.length - 1; z++) {
      //  do not handle first row.
      _fakeRow++;
      String _fakeRowS = _fakeRow.toString().substring(1, 3);
      //  TODO  choose nice background mark for matrix.
      //  pad with low-density mark.   NO: '-'
      _matrix[z] = '$_fakeRowS '.padRight(sw, pm);
    }
    ; //  <=  ;  dartFormatter is sometimes funny
    //  TODO  should  get #name in the middle of first line,
    boxNumS = boxNum.toString();
    String m0ro = ':boxServe:nr: $boxNumS  :cib: $_caller   ';
    //  no used  int m0roI = m0ro.length;
    String m0row = m0ro.padRight(sw, pm);
    //  TODO  should produce String:  'DAWO 0.0.7'
    //  String logoS = '$dawoApp.name $dawoApp.version';
    _matrix[0] = m0row;
    String _timeNow = tl.stampDateTimePlain();
    aHeader(0, sw - 57, 'time: $_timeNow');
    String _version = dawoApp.version; //  0.0.7+
    aHeader(0, sw - 27, 'Dartlang app  DAWO $_version ');
    //  TODO  StampLeft ' '  // there is pm ! = ' '
    ///  Last row of matrix for range-10 marks; NOTE: rc - 1
    ///  Made bRowLon a little longer.
    String bRowLong =
        '---------10--------20--------30--------40--------50--------60--------70--------80--------90--------00--------10--------20--------30--------40--------50--------60--------70--------80--------90--------00--------10--------20----';
    String bRow = bRowLong.substring(0, sw);
    _matrix[rc - 1] = bRow;
    //   '---------10--------20--------30---------40---------50---------60---------70---------80---------90---------00---------10---------20---------30---------40---------50---------60---------70';
    logM[boxNumS].addAll([name, 'CTRCT']);
  } //  -----  construct

  ///  Marks left of console screen to put table in convenient place for to see.
  void eyeMark14() {
    int pegC = _matrix.length;
    //  boxServe.aHeader(min((boxServe.rc - 2), 14), 0, 'peg');
    aHeader(min((pegC - 2), 14), 0, 'peg'); //  Lay "screen-watch-anchor"
  }

  ///  Lay row-12 length marker, like:  ___197 on right edge.
  ///  Mark row-11 with real sw value.
  ///  :BUG:DEBUG: Over-lines-marking makes some rows 2-3 marks longer.
  void rowMark12() {
    //  To act for small boxes!!
    int level = min(12, rc - 2);
    int row12Length = _matrix[level].length;
    String _s = row12Length.toString();
    String row12 = _matrix[level] + _s;
    _matrix[level] = row12;
    _matrix[level - 1] = _matrix[level - 1] + sw.toString();
  }

  /// Small lined box using optional parameter in function.
  /// First: shaping map in tools, tl, library for k, v, widths.
  List infoBox(Map<String, String> inM, int _k, _v, [int margin]) {
    List<String> infoL = tl.mapToFineList(inM, _k, _v);
    String _sideMark = '|';

    String indent = '';

    int width = tl.longestItemInList(infoL);
    //  QUEST: It can not be this hard :)
    String _ruler = '|'.padRight(width + 1, '=');
    String _sr = ('$_ruler$_sideMark');
    String _ruler2 = _sr;

    String _rulerHeader = '|==:infoBox:='.padRight(width + 1, '=');
    String _srHeader = ('$_rulerHeader$_sideMark');
    String _rulerHeader2 = _srHeader;

    //  No margin, if optional parameter not set.
    if (margin != null) {
      indent = ''.padRight(margin, ' ');
    }
    List<String> infoL2 = [];
    int _length = infoL.length;
    infoL2.add('$indent$_rulerHeader2');
    for (var x = 0; x < _length; x++) {
      String _s;
      if (infoL[x].length > width) _s = infoL[x].substring(0, width);
      if (infoL[x].length < width) _s = infoL[x].padRight(width, ' ');
      if (infoL[x].length == width) _s = infoL[x];
      String _sideMark = '|';
      String _s2 = '$_sideMark$_s$_sideMark';
      infoL2.add('$indent$_s2');
      infoL2.add('$indent$_ruler2');
    }

    /// Returned list includes possible margin.
    return infoL2;
  }

  //  Fill list-data in matrix in r, _c coordinates.
  //  parameters now::  int _r, int _c, List<String> boxL, List<String> _mL)
  //  TODO :BUG: :QUEST: Error check for over-sized lists: do not work always.
  ///  Add all list element to matrix in _r, _c WITH _items in _w-width.
  ///  fix2.0.0  List<String>
  void aBox(int _r, _c, _items, _w, List<String> _l) {
    //  If not know list length / wanted items and width, try 100. lol
    //  TODO  Truncate items and length, if List outOfMatrix borders
    int _overWidth = 0;
    int _overLength = 0;
    bool error = false;
    String _overWidthS = '';
    String _overLengthS = '';
    if ((_c + _w > sw) || (_r + _items > rc)) {
      error = true;
      _overWidth = (_c + _w) - sw;
      print(_overWidth);
      _overLength = (_r + _items) - rc;
      print(_overLength);
      print('W: $_w  Items:  $_items  ');

      if (_overWidth > 0) _w = (_w - _overWidth);
      if (_overLength > 0) _items = (_items - _overLength);
      print('W: $_w  Items:  $_items  ');
      print('sw: $sw   ');
      print('Overlength::  $_overLength     OwerWidth::  $_overWidth');
      _overWidthS = _overWidth.toString(); //assume like: '7'
      _overLengthS = _overLength.toString(); //  like: '3'
    }
    ;

    //  ??  If error-position, parameters should now have changed ??
    tl.boxInList(_r, _c, _items, _w, _l, _matrix);
    if (error) {
      //  lay vertical #VARNING line !!!
      List<String> verticalWarningL = new List(_items);
      verticalWarningL.fillRange(0, _items, _overWidthS);
      //  call: void vertWarning(int _x, _y, count, String _s)
      print('vert warning::  ');
      vertWarning(_r, _c + _w + 2, _items, _overWidthS); //  try +1 .. 2
      print('_overLengthS::  $_overLengthS ');
      print('horizWarnig::  ');
      horizWarning(_r + _items - 1, _c, _w, _overLengthS);
      print('error done::');
      //  lay horizontal #VARNING line
    } //  -----  error
  } //  -----  aBox

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
      _matrix[x] = _newS;
    }
  }

  //  aBox calls warnings in case of over-length-width box in matrix.
  //  Set vertical Warning-line for over-sized-box to screen matrix
  void vertWarning(int _x, _y, count, String _s) {
    String _newS;
    int toX = _x + count;
    for (var x = _x; x < toX; x++) {
      _newS = tl.changeLetter(_matrix[x], _y, _s);
      _matrix[x] = _newS;
    }
  }

  //  Set horizontal Warning-line to screen matrix
  void horizWarning(int _x, _y, _width, String _extraS) {
    StringBuffer _b = new StringBuffer();

    ///  form String like:  ´7777777777777777'
    for (var x = 0; x < _width; x++) {
      _b.write(_extraS);
    }

    ///  Fill it to the matrix
    aHeader(_x, _y, _b.toString());
  }

  ///  Called by:   User!!  Not from this class.
  ///  To show matrix AND mediate it to glb.buf
  void show(String _caller, String action, int margin) {
    //  put 'peg' in row_14, col_0, for table to fill screen.
    //  Is this enough?  handles  0 - 8 - 27?
    String _margin = ''.padRight(margin, ' ');
    eyeMark14();
    rowMark12(); //  put 175 at the end of row 12
    print(_matrix.length);

    ///  if.. is awkward
    ///  TODO  Parameter int _indent, for to set column / left margin in print.
    if (action == 'print') {
      for (var x in _matrix) {
        print('$_margin$x');
        //  only way!!
      }
    }
    //  return _matrix;  //  if type is: List<String>
    ///  Save box-buffer to:   glb.boxServeBuffers Map
    saveToGLB();
    logM[boxNumS].addAll([_caller, 'SHOW']);
  }

  ///  Called by:  next method, saveToGLB
  ///  title + _matrix + footer saved to buf.
  StringBuffer toBuffer() {
    StringBuffer boo = new StringBuffer();
    boo.writeln(title);
    for (var x in _matrix) {
      boo.writeln(x);
    }
    boo.writeln(footer);
    return boo;
  }

  ///  Called by:  show()
  ///  toGLB-Buffer.  Save boxServe matrix to glb-buffers
  void saveToGLB() {
    String boxNumS = boxNum.toString();
    _bufName = '$_bufName$boxNumS';
    StringBuffer saveBuffer = toBuffer();
    String sbl = saveBuffer.length.toString();
    //  spamming,  away:  Name:::  $name
    print(
        '  bufName::  $_bufName      boxNumS:::  $boxNumS     BufLength::: $sbl');

    ///  _bufName is combination of '$caller $boxNum.toString()'
    glb.boxServeBuffers.putIfAbsent(_bufName, () => saveBuffer);
    //  TODO  result:  N_added,  length_now
    print('-<<---saveToGLB  done    ----<<-----  ');
    logM[boxNumS].add('svGLB');
  }

  ///  Lets see, if this will eventually be List<String>
  ///  TODO  #deprecated  split in:  show and #done
  void done(String _caller) {
    _matrix.clear();
    _buf.clear();
    name = '';
    _bufName = '';
    _resAllocL.clear();
    verticalLineL.clear();
    _fakeRow = 100;
    logM[boxNumS].add('DONE');
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
  //  Lay "screen-watch-peg"to set box to fill the screen.
  //  To allow use of < 14 boxes: (boxServe.rc - 2)
  boxServe.aHeader(min((boxServe.rc - 2), 14), 0, 'peg');
} //  -----  boxLayoutDab

///  UsingBaseStruct (connector) fields to set usual fields in boxServe
void boxLayOutConnector() {}

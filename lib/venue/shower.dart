// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved.
// Use of this source code is governed by a BSD-style license that
// can be found in the LICENSE file.
//
///  ##  Shower  -  presentation info and data screens.
///  New box_serve makes this better: makes only frames and keep clients data
///  in client side.  This file might eventually fade out.
///  * dwv: version:   0.9.9.  6.4.2022.  devState: 90%
///  *      GitHub: yes.
///  * DONE  #deprecated deleted_ rows 300 - 350
///  * SCHEDULE might deserve it's own class.
///  * SCHEDULE: No hurry, 0.1.X
//

part of venue;

///  Made this to be not a function, but a class 16.11.2017
///  Data-table of outside resources grouped in time.  Equipment-class. equ
///  Can be developed more handy, when getting left and right area data
///  in parameters. #Plan  Resource, Equipment, Time
///  Big amount of data relative to the code : multipurpose is unprofitable.
class ScheduleBox {

  ///  screen width
  int _sw = 195;

  ///  row count
  static int _rc = 40;

  ///  Create empty-String list with counted items
  List<String> _matrix = List.filled(_rc, '');
  int _colPos = 100;
  List<String> _resAllocL = [];

  ///
  void init() {
    ///  Call equ class and it's allocate method to get resource List
    equ.init(':M:scheduleBox');
    _resAllocL.addAll(equ.allocate(36, 40)); //  width var not used yet.
  }

  ///
  void build(String _caller) {
    for (var z = 1; z < _matrix.length; z++) {
      //  do not handle first row.
      _colPos++;
      //  pad with low-density mark.
      _matrix[z] = '$_colPos '.padRight(_sw, '-');
    }
    _matrix[0] =
        '--m-schedule--$_caller-----------------------------------------------------------------------------------------------------------------------------------------------------dartlang app  Dawo 0.9.9 -';

    ///  Last row of matrix for range-10 marks; row = : _rc - 1
    _matrix[_rc - 1] =
        '---------10---------20---------30---------40---------50---------60---------70---------80---------90---------00---------10---------20---------30---------40---------50---------60---------70';
    //NO   _matrix.forEach(print);
    //  Fill list-data in matrix in r, _c coordinates.
    //  parameters now::  int _r, int _c, List<String> boxL, List<String> _mL)
    //  new parameters:  _items, _w
    ///  fix2.0.0
    void anchorBox(int _r, int _c, _items, _w, List<String> __l) {
      tl.boxInList(_r, _c, _items, _w, __l, _matrix);
      //NO #print:  print(_matrix);
    } //     -----      anchorBox

    ///  Marks left of console screen to put table in convenient place for to see.
    void eyeMark14() {
      int pegC = min(_matrix.length, 14);
      anchorBox(pegC, 0, 1, 6, ['pegXLZ']); //  Lay "screen-watch-anchor"
    }

    anchorBox(3, 5, 100, 100, [
      '**  Mission-op development experience; highly usable stuff',
      '**  Presenting available objects in scope.  **'
    ]);
    anchorBox(6, 5, 100, 100, ['IDEA:', 'IDEA:', 'NOTE:', 'NOTE:']);
    anchorBox(3, 80, 100, 100, tl.mapToFineList(equ.officeCities, 10, 10));
    anchorBox(12, 10, 100, 100, tl.mapToFineList(equ.areas, 8, 10));
    anchorBox(10, 82, 100, 100, tl.mapToFineList(equ.cars, 10, 10));
    anchorBox(26, 8, 100, 100, tl.mapToFineList(equ.weekDays, 4, 14));
    anchorBox(22, 60, 100, 100, tl.mapToFineList(equ.months, 10, 22));
    anchorBox(33, 44, 100, 100, tl.mapToFineList(equ.programAreas, 8, 10));
    anchorBox(1, 123, 100, 100, _resAllocL);
    //  Usable resources: toolsActiveM, toolsSpeedM,status
    eyeMark14(); //  mark 'peg' to put screen table to screen.
  } //  -----  build

  ///
  void roll(String _caller) {
    init();
    build(_caller);
    _matrix.forEach(print);
  } //     -----     roll

} //     -----     class ScheduleBox

///  Create instance with constructor
ScheduleBox scheduleBox = ScheduleBox();

///  QUEST:  there is surely better algorithm for this
///  Gets some small data from effortLM based on parameters.
List<String> highValue(List<Map<String, String>> _inlM, int _c, int _w) {
  print('-->>-->>getRecommendation in effort  -->>-->>-- ');
  //  _w parameter is for KEY field width.
  //  TODO  add width check / repair for too long _w value
  List<String> _retL = [];

  for (var x = 0; x < _inlM.length; x++) {
    for (var y in _inlM[x].keys) {
      //  howTo NULL int
      //  NO   int iVPos! = _inlM[x][y].indexOf('V:');
      int iVPos = 0;
      iVPos = _inlM[x][y]!.indexOf('V:');

      int iEPos = _inlM[x][y]!.indexOf('E:');

      int iVal = -1;
      int iEff = -1;
      //  check if we got 2 numbers.
      //  howTo NULL int
      String checkS = _inlM[x][y]!.substring(iVPos + 2, iVPos + 3);
      if (tl.isNumber(checkS)) {
        iVal = int.parse(_inlM[x][y]!.substring(iVPos + 2, iVPos + 3));
        String checkS = _inlM[x][y]!.substring(iEPos + 2, iEPos + 3);
        if (tl.isNumber(checkS)) {
          iEff = int.parse(_inlM[x][y]!.substring(iEPos + 2, iEPos + 3));

          //  check for high value-effort coefficient.
          //  copy positive-value-efforts to new map
          if ((iVal - iEff) > 0) {
            //  3 ?
            //  print('------------ iVal - iEff > 0 -----------------------');
            String _s1 = y.substring(0, _w); // Map key of _w width.
            ///  Copy  :  V:3 E:9  like string.
            String _s2 = _inlM[x][y]!.substring(iVPos, iVPos + 3);
            String _s3 = _inlM[x][y]!.substring(iEPos, iEPos + 3);
            String _sAdd = ('$_s1 $_s2 $_s3');
            _retL.add(_sAdd); //  like:  PhaseDone V:9 E:8
          }
        }
      } //  --  tl.isNumber(checkS)
    } //  --  for (var y in _inlM[x].keys)
  }
  //  _retL.forEach(print);
  List<String> _retLTake = [];
  //  take _c items as asked in parameter.
  //  TODO  Count check _c > _retL.length
  _retLTake.addAll(_retL.take(_c));
  //  might use:  _retL.takeWhile(  bool  );
  print('-->>-->>getRecommendation callled highValue in shower  -->>-->>-- ');
  print('returning list:: n-values:  $_c ');
  _retLTake.forEach(print);
  return _retLTake;
} //     -----     highValue

///  Gets some small data from effortLM based on parameters.
List<String> effortTable(
    List<Map<String, String>> _ilM, String _sf, int _w, _itemC) {
  //  _sf  String, that swe are looking for, like: E:5  or  M:7
  //  _w  how wide String of map-key we want?
  //  _itemC  how many values we want?
  //  _ilM  is effortLM
  //  print('parameters:: _sf::  $_sf  _w:: $_w   _itemC::  $_itemC ');

  String _foundS = '';
  List<String> _l = [];

  //  Handle whole list.
  for (var x = 0; x < _ilM.length; x++) {
    // 'Seek every map for search-criteria'
    for (var y in _ilM[x].keys) {
      //  Zero / short length check. Is it needed?
      //  howTo NULL
      if (_ilM[x][y]!.length < 2) {
        print('ALERT::    _ilM[x][y].length < 2   ********************');
      }
      ;

      //  Found String?
      //  analysis, rep 2 hints:  l-188 c-12: Use contains instead of indexOf
      //  Old way:  if ((_ilM[x][y].indexOf(_sf) > -1)) {
      //  New way using #contains:
      //  howTo NULL ok
      if ((_ilM[x][y]!).contains(_sf)) {
        ///  separating index finding.
        int iSub = _ilM[x][y]!.indexOf(_sf);
        //  Are we over right edge of list.item?
        if ((iSub + 3) >= _ilM[x][y]!.length) {
          print('ALERT:: iSub +3  >  _ilM[x][y].length   **************');
        }
        ;

        //  TODO range    check for: not to be out of range.
        //  print(_ilM[x][y].substring(iSub ,iSub+3));
        _foundS = _ilM[x][y]!.substring(iSub, iSub + 3);

        ///  Drive String manipulation in order, for to be sure.
        ///  Surely shorter way might exist.
        String tempS1 = y; //  key
        String tempS2 = tempS1; //

        //  force Strings to width:  _w
        if (tempS1.length < _w + 2) {
          tempS2 = tempS1.padRight(_w, ' ');
          //  force all to same length
        } else {
          tempS2 = tempS1.substring(0, _w);
        }
        String tempS3 = tempS2 + ' ' + _foundS;
        //  Or temp2S is as it was.
        _l.add(tempS3);
      }
    }
  }
  List<String> sL = [];
  //  TODO  check for int 1-9
  //  Add to sL in numeric-high order

  for (var x = 9; x > -1; x--) {
    String sx = x.toString();
    for (var y in _l) {
      //  analysis, rep 2 hints:  l-228 c-11: Use contains instead of indexOf
      //  Old way:  if (y.indexOf(sx) > -1) {
      //  New way using #contains:
      if (y.contains(sx)) {
        sL.add(y);
      }
    }
  }
  List<String> _retL = [];
  _retL.addAll(sL.take(_itemC));
  print(_retL);
  print('------------------------ effortTable done-----------------------');
  return _retL;
} //     -----     effortTable

///  Screen-sized matrix pierced with staggered list elements.
///  Usage: Who is calling this:  Effort-ShowUserDiagonal
List<String> iterableDiagonal(List<List<String>> _il, int sw, String caller) {
  int _sw = sw; //  screen width.
  int _ilC = tl.countInnerList(_il); //  serves also as row-count.
  int cStep = ((sw - 50) ~/ _ilC); //  spread info to screen.
  //  TODO  More complicated than 1 by 1 system.
  int cInd = 0; //  colon index.

  //  If needed:  int rInd = 0; //  row-index if needed.
  String _s = '';
  String infoS1 = '  INFO: V:Value E:Effort D:Done :  C:$caller';
  String infoS2 = ' ** Diagonal list describing Chore-Effort user-data  **';
  String infoS3 =
      ' - Finally this data is best when get by server to client. -';
  List<String> _ol = [':sh-it-diagL-  First Item    $infoS1 $infoS2 $infoS3'];
  for (var x = 0; x < _il.length; x++) {
    for (var y = 0; y < _il[x].length; y++) {
      _s = '';
      String ts = ''; //  temporary String for padding
      cInd = cInd + cStep;
      ts = _s.padLeft(cInd, '_');
      _s = (ts + _il[x][y]);

      ///  is this really needed??
      //  if needed:  int _wl = _il[x][y].length; //  current item length
      ts = _s.padRight((_sw), '_'); //  to be visible: _
      _ol.add(ts);
      //  empty String
    } //  ---------------    Items in one list.
    cInd + 6; //  extra tick to move column-pos 6 right.
    _ol.add(
        '.--------------------------------'); //TODO  Make something more visible and useful.
  } //  -----------------    All incoming lists.3
  return _ol;
} //     -----     iterableDiagonal

///  List and Map versions of this method
///  Version, that uses Map in incoming data.  ******************** map ***
///  Screen-sized matrix pierced with staggered list elements.
///  #Users:       Caller:  effort  getDiagonalList
List<String> iterableDiagonalM(List<Map<String, String>> _ilM, int sw) {
  int _sw = sw; //  screen width.
  ///  Using different,  count Map method.
  int _ilMC = tl.countInnerMap(_ilM); //  serves also as row-count.
  int cStep = ((sw - 50) ~/ _ilMC); //  spread info to screen.
  //  TODO  More complicated than 1 by 1 system.
  int cInd = 0; //  colon index.
  //  int rInd = 0; //  row-index if needed.
  String _s = '';
  String infoS1 = ' it-diag-Map  INFO: V:= Value E: = Effort D: = Done :  ';
  String infoS2 = ' ** Diagonal list describing Chore-Effort user-data  **  ';
  String infoS3 =
      '  - Finally this data is best when get by server to client. -';
  List<String> _ol = [':sh-it-diagM-   First Item  $infoS1 $infoS2 $infoS3'];
  String topLine = tl.strMark('>', _sw);
  String emptyLine = tl.strMark('_', _sw);
  String botLine = tl.strMark('<', _sw);
  _ol.add(topLine);
  _ol.add(emptyLine);
  for (var x = 0; x < _ilM.length; x++) {
    ///  Loop to handle all map values
    for (var y in _ilM[x].keys) {
      _s = '';
      String ts = ''; //  temporary String for padding
      cInd = cInd + cStep;
      ts = _s.padLeft(cInd, '_');
      //  Must get key AND value to String : hklTry  glorious: y
      //  howTo NULL
      _s = (ts + y + ' ' + _ilM[x][y]!);
      //Not needed: current item length   int _wl = _ilM[x][y].length;
      ts = _s.padRight((_sw), '_'); //  to be visible: _
      _ol.add(ts);
      //  empty String
    } //  ---------------    Items in one list.
    cInd + 6; //  extra tick to get TAB in screen.
    //  pad String to _sw, screen width.
    String _nlS = '.'.padRight(sw - 2, ' ');
    String _nlS2 = _nlS + '.';
    //  TODO  Make something more visible and useful.
    _ol.add(_nlS2);
  } //  -----------------    All incoming lists.3
  _ol.add(emptyLine);
  _ol.add(botLine);
  return _ol; //  ---------- return type:   List<String>
} //     -----     iterableDiagonalM

//

// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  ##  Shower  -  presentation info and data screens.
///
///  dawo version: 0.0.5  6.11.2017.   READY-STATE  for version 0.0.6  0%
/// *      GitHub:
/// * Hist:hkl  3.11.2017  0.0.4  presentation tools for dawo
//

library shower.dart;

import 'equipment.dart';
import 'tools.dart';

///  Show Lists, like devNotes in nice column-box in console.
///  Can now handle 2, 3 and 4 column cases, and is common-usage function.
///  TODO  Add better row / height decision.
///  #QUEST : Maybe these 2-3-4 devBox functions can be combined to one, and
///  handle 2-3-4 with parameters. Did it once, but was ugly.
///  TODO  Make return type: StringBuffer
StringBuffer devBox(String caller, List<List<String>> inList, int forceHeight) {
  StringBuffer _retBuf = new StringBuffer();
  final int sW = 210; //  Screen width.
  String borderS = ' | '; //  In 4 columns is smaller.

  List<String> twoBoxL = []; //  For two columns in console screen.
  List<String> threeBoxL = []; //  For three columns in console screen.
  List<String> fourBoxL = []; //  For four columns in console screen.

  //  ***********  GLORIOUS CODING  byMe :)  ****************
  //  Make sure that list is certain length.
  void addEmpty(List _list, int _height, String _note) {
    while (_list.length < _height) {
      _list.add(_note);
    }
    ; //  -- while
  } //  -- addEmpty

  ///  TODO  Build one function for all these 2 X 2 functions.
  ///  PadRight both Colon-Lists items to certain length.
  ///  aColonList and bColonList, int columnTwoWidth. #Name ?
  void tuneColumnList(List<String> cL, int width) {
    for (var x = 0; x < cL.length; x++) {
      if (cL[x].length < width) {
        String s = cL[x].padRight(width, '_');
        cL[x] = s;
      }
      if (cL[x].length > width) {
        String s = cL[x].substring(0, width);
        //  TODO  add " >>" for last marks.
        cL[x] = s;
      }
    }
  } //  ---------  tuneColumnList

  ///  Carry the actual List building.
  void devBoxBuild() {
    int columnTwoWidth = ((sW ~/ 2) - 10); //  when 2 notes in a row
    ///  To get nice little header String in top-left corner.
    //  Widen this later to screen-width.
    String topRim = '_devbox_C: $caller __';
    String botRim = '____'; //  Widen this later to screen-width.
    String padTopRim = topRim.padRight(sW, '_');
    String padBotRim = botRim.padRight(sW, '_');
    topRim = padTopRim;
    botRim = padBotRim;

    ///  howTo String:  these two lines has no effect:
    topRim.padRight(sW, '_'); //  (sW, '_');
    botRim.padRight(sW, '_'); //  (sW, '_');

    ///  build two / three-List in parameter -case box;
    ///  Use forceHeight parameter:
    int twoBoxHeight = 15; //  TODO  Should be decided by Lists length.
    // Should force length of in-list.
    if (forceHeight > 0) twoBoxHeight = forceHeight;

    int threeBoxHeight = 17;
    if (forceHeight > 0) threeBoxHeight = forceHeight;

    int fourBoxHeight = 17;
    if (forceHeight > 0) fourBoxHeight = forceHeight;

    ///  Build two-column-area List.  -----------   2 columns.
    if (inList.length == 2) {
      //  Create 2 temp List to be able to modify data.
      List<String> aColonList = [];
      aColonList.addAll(inList[0]);

      List<String> bColonList = [];
      bColonList.addAll(inList[1]);

      addEmpty(aColonList, twoBoxHeight, '_');
      addEmpty(bColonList, twoBoxHeight, '_');

      tuneColumnList(aColonList, columnTwoWidth);
      tuneColumnList(bColonList, columnTwoWidth);

      /// Combine short List-rows to #Long-String and add borderMarks.
      twoBoxL.add(topRim);
      for (var c = 0; c < twoBoxHeight; c++) {
        String firstData = aColonList[c];
        String secondData = bColonList[c];
        String longS = '$borderS $firstData  $borderS $secondData $borderS ';
        twoBoxL.add(longS);
      }
      twoBoxL.add(botRim);
      twoBoxL.forEach(print);
      //  Write it all to StringBuffer;
      _retBuf.writeAll(twoBoxL);
      _retBuf.write(' ');
      print(' ');
    } //  --  inList length == 2

    ///  Build three-column-area List.  -----------   3 columns.
    if (inList.length == 3) {
      int columnThreeWidth = ((sW ~/ 3) - 10); //  when 3 notes in a row

      ///  3-case; Create 3 new List to modify data:
      List<String> cColonList = [];
      cColonList.addAll(inList[0]);

      List<String> dColonList = [];
      dColonList.addAll(inList[1]);

      List<String> eColonList = [];
      eColonList.addAll(inList[2]);

      ///  Add three-List-case -area Lists to certain length if needed.
      addEmpty(cColonList, threeBoxHeight, '_');
      addEmpty(dColonList, threeBoxHeight, '_');
      addEmpty(eColonList, threeBoxHeight, '_');

      ///  Tune Three-columns-area Lists items to certain length.
      tuneColumnList(cColonList, columnThreeWidth);
      tuneColumnList(dColonList, columnThreeWidth);
      tuneColumnList(eColonList, columnThreeWidth);

      ///  Form the actual matrix for printing.
      threeBoxL.add(topRim);
      for (var c = 0; c < threeBoxHeight; c++) {
        String fData = cColonList[c];
        String sData = dColonList[c];
        String tData = eColonList[c];
        String longS =
            '$borderS $fData $borderS $sData $borderS $tData $borderS';
        threeBoxL.add(longS);
      }
      threeBoxL.add(botRim);
      threeBoxL.forEach(print);
      //  Write it all to StringBuffer;
      _retBuf.writeAll(threeBoxL);
      _retBuf.write(' ');
    } // ----------  length inList = 3

    ///  Build four-column-area List.  -----------   4 columns.
    if (inList.length == 4) {
      int columnFourWidth = ((sW ~/ 4) - 4); //  when 4 notes in a row
      String borderS = '|';

      ///  in three List parameter -case:
      List<String> fColonList = [];
      fColonList.addAll(inList[0]);

      List<String> gColonList = [];
      gColonList.addAll(inList[1]);

      List<String> hColonList = [];
      hColonList.addAll(inList[2]);

      List<String> iColonList = [];
      iColonList.addAll(inList[3]);

      ///  Add four-List-case -area Lists to certain length if needed.
      addEmpty(fColonList, threeBoxHeight, '_');
      addEmpty(gColonList, threeBoxHeight, '_');
      addEmpty(hColonList, threeBoxHeight, '_');
      addEmpty(iColonList, threeBoxHeight, '_');

      ///  Tune Four-columns-area Lists Items to certain length.
      tuneColumnList(fColonList, columnFourWidth);
      tuneColumnList(gColonList, columnFourWidth);
      tuneColumnList(hColonList, columnFourWidth);
      tuneColumnList(iColonList, columnFourWidth);

      ///  Start forming this overly-tight mess of funny data.
      fourBoxL.add(topRim);
      for (var c = 0; c < fourBoxHeight; c++) {
        String fData = fColonList[c];
        String gData = gColonList[c];
        String hData = hColonList[c];
        String iData = iColonList[c];
        String longS = '$fData  $gData  $hData  $iData $borderS';
        //  '| $fData $borderS $gData $borderS $hData $borderS $iData $borderS';
        fourBoxL.add(longS);
      }
      fourBoxL.add(botRim);
      fourBoxL.forEach(print);
      //  Write it all to StringBuffer;
      _retBuf.writeAll(fourBoxL);
      _retBuf.write(' ');
    } // --  length inList = 4
  } //  -------------  devBoxBuild

  devBoxBuild(); //  Call build-function.
  return _retBuf;
} //  ----------  devBox

///  Data-table of outside resources grouped in time.  Equipment-class. equ
///  Can be developed to common-usage, when getting left and right area data
///  in parameters. #Plan  Resource, Equipment, Time
void scheduleBox(String _caller) {
  /*
  //  TODO  should create and use _pB and flowC class here?
  flowC('--<----<-  :M:op:  scheduleBox --<----<-', _pB);
  flowC(':M:op: scheduleBox-info: Report for to check data lists. >>', _pB);
  flowC('>> :M:op: scheduleBox: **Not needed when scheduleBox is on.**.', _pB);
  */

  ///  Call equ class and it's allocate method to get resource List
  List<String> _resAllocL = [];
  equ.init(':M:cheduleBox');
  _resAllocL.addAll(equ.allocate(36, 40)); //  width var not used yet.
  int _sw = 195; //  screen width
  int _rc = 40; //  row count
  List<String> _matrix = new List(_rc);
  int _count = 100;
  for (var z = 1; z < _matrix.length; z++) {
    //  do not handle first row.
    _count++;
    //  TODO  choose nice background mark for matrix.
    _matrix[z] = '$_count '.padRight(_sw, '-'); //  pad with low-density mark.
  }
  _matrix[0] =
      '--m-schedule--$_caller--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------';

  ///  Last row of matrix for range-10 marks; NOTE: _rc - 1
  _matrix[_rc - 1] =
      '---------10---------20---------30---------40---------50---------60---------70---------80---------90---------00---------10---------20---------30---------40---------50---------60---------70';
  //NO   _matrix.forEach(print);
  //  Fill list-data in matrix in r, _c coordinates.
  //  parameters now::  int _r, int _c, List<String> boxL, List<String> _mL)
  void anchorBox(int _r, int _c, List __l) {
    tl.boxInList(_r, _c, __l, _matrix);
    //NO #print:  print(_matrix);
  }

  anchorBox(3, 5, [
    '**  Mission-op development experience; common usable stuff',
    '**  Presenting available objects in scope.  **'
  ]);
  anchorBox(6, 5, ['IDEA:', 'IDEA:', 'NOTE:', 'NOTE:']);
  anchorBox(3, 80, equ.officeCities);
  anchorBox(12, 10, equ.areas);
  anchorBox(10, 82, equ.cars);
  anchorBox(26, 8, equ.weekDays);
  anchorBox(22, 60, equ.months);
  anchorBox(33, 44, equ.programAreas);
  anchorBox(1, 123, _resAllocL);
  //  Usable resources: toolsActiveM, toolsSpeedM,status
  _matrix.forEach(print);
} //  -----  scheduleBox

///  Gets some small data from effortLM based on parameters.
List<String> highValue(List<Map<String, String>> _inlM, int _c, int _w) {
  print('-->>-->>getRecommendation in effort  -->>-->>-- ');
  //  _w parameter is for KEY field width.
  //  TODO  add width check / repair for too long _w value
  //  #QUEST:  There surely is better way to do this.
  List<String> _retL = [];

  for (var x = 0; x < _inlM.length; x++) {
    for (var y in _inlM[x].keys) {
      int iVpos = _inlM[x][y].indexOf('V:');
      int iEpos = _inlM[x][y].indexOf('E:');

      int iVal = -1;
      int iEff = -1;
      //  check if we got 2 numbers.
      String checkS = _inlM[x][y].substring(iVpos + 2, iVpos + 3);
      if (tl.isNumber(checkS)) {
        iVal = int.parse(_inlM[x][y].substring(iVpos + 2, iVpos + 3));
        String checkS = _inlM[x][y].substring(iEpos + 2, iEpos + 3);
        if (tl.isNumber(checkS)) {
          iEff = int.parse(_inlM[x][y].substring(iEpos + 2, iEpos + 3));

          //  check for high value-effort coefficient.
          //  copy positive-value-efforts to new map
          if ((iVal - iEff) > 0) {
            //  3 ?
            //  print('------------ iVal - iEff > 0 -----------------------');
            String _s1 = y.substring(0, _w); // Map key of _w width.
            ///  Copy  :  V:3 E:9  like string.
            String _s2 = _inlM[x][y].substring(iVpos, iVpos + 3);
            String _s3 = _inlM[x][y].substring(iEpos, iEpos + 3);
            String _sAdd = ('$_s1 $_s2 $_s3');
            _retL.add(_sAdd);
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
}

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
      if (_ilM[x][y].length < 2) {
        print('ALERT::    _ilM[x][y].length < 2   ********************');
      }
      ;

      //  Found String?
      if ((_ilM[x][y].indexOf(_sf) > -1)) {
        ///  separating index finding.
        int iSub = _ilM[x][y].indexOf(_sf);
        //  Are we over right edge of list.item?
        if ((iSub + 3) >= _ilM[x][y].length) {
          print('ALERT:: iSub +3  >  _ilM[x][y].length   **************');
        }
        ;

        //  TODO  check for: not to be out of range.
        //  print(_ilM[x][y].substring(iSub ,iSub+3));
        _foundS = _ilM[x][y].substring(iSub, iSub + 3);

        ///  Drive String manipulation in order, for to be sure.
        ///  Surely shorter way might exist.
        String tempS1 = y; //  key
        String tempS2 = tempS1; //

        //  TODO  force all items to tl.longestItemInList, or...
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
      if (y.indexOf(sx) > -1) {
        sL.add(y);
      }
    }
  }
  List<String> _retL = [];
  _retL.addAll(sL.take(_itemC));
  print(_retL);
  print('------------------------ effortTable done-----------------------');
  return _retL;
} //  -----  effortTable

///  Screen-sized matrix pierced with staggered list elements.
///  TODO  change all box-methods to use Map<String,String>
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
    cInd + 6; //  extra tick.
    _ol.add(
        '.--------------------------------'); //TODO  Make something more visible and useful.
  } //  -----------------    All incoming lists.3
  return _ol;
} //  -----  iterableDiagonal

///  List and Map versions of this method
///  Version, that uses Map in incoming data.  ******************** map ***
///  Screen-sized matrix pierced with staggered list elements.
///  TODO  change all box-methods to use Map<String,String>
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
  String botLine = tl.strMark('<', _sw);
  _ol.add(topLine);
  for (var x = 0; x < _ilM.length; x++) {
    ///  Loop to handle all map values
    for (var y in _ilM[x].keys) {
      _s = '';
      String ts = ''; //  temporary String for padding
      cInd = cInd + cStep;
      ts = _s.padLeft(cInd, '_');
      //  Must get key AND value to String : hklTry  glorious: y
      _s = (ts + y + ' ' + _ilM[x][y]);
      //Not needed: current item length   int _wl = _ilM[x][y].length;
      ts = _s.padRight((_sw), '_'); //  to be visible: _
      _ol.add(ts);
      //  empty String
    } //  ---------------    Items in one list.
    cInd + 6; //  extra tick to get TAB in screen.
    //  pad String to _sw, screen width.
    String _nlS = '.'.padRight(sw - 2, ' ');
    String _nlS2 = _nlS + '.';
    _ol.add(_nlS2); //TODO  Make something more visible and useful.
  } //  -----------------    All incoming lists.3
  _ol.add(botLine);
  return _ol; //  ---------- return type:   List<String>
}

//

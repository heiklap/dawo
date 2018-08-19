// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  ##  dev_box  -  presentation in 2-3-4 column boxes.
///
///  * dawo version: 0.0.75+.  -  13.1.2018.  devState: 90%
///  *      GitHub: yes.
//



part of shower.dart;



//  TODO :  21 matches,  add one more to make it even count.

///  devBox is an example of a funny way to solve a problem, It works, but:
///  it is NotElegant.  It is not best way to solve matrix - addBox problem.
///  This should be deprecated; boxServe is much more elegant.
///  Show Lists, like devNotes in nice column-box in console.
///  Can now handle 2, 3 and 4 column cases, and is very useful function.
///  TODO  Add better row / height decision.
///  #QUEST : Maybe these 2-3-4 devBox functions can be combined to one, and
///  handle 2-3-4 with parameters. Did it once, but was ugly.
///  TODO  Make this a class.  Add: Dartlang app  DAWO 0.0.7 to row[o]end
///  190 rows.  Add header and footer in List<String> _hfL
StringBuffer devBox(String caller, List<String> _hfL, List<List<String>> inList,
    int forceHeight) {
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
    String tr1 = '_devBox_C: $caller __';
    ///  for to trim rows items nicely
    //  notUsed:   int tr1Length = tr1.length;

    ///  To get: time:  2017-12-23  09:02:16     _Dartlang app  DAWO 0.0.7
    String _timeNow = tl.stampDateTimePlain();
    String _version = dawoApp.version; //  0.0.7+
    String dawoLogoS = 'time: $_timeNow    _Dartlang app  DAWO $_version ';
    int dawoLogoLength = dawoLogoS.length;
    //  :BUG: makes about 6 wide column error in box
    String padTopRim = tr1.padRight(sW - (dawoLogoLength + 6), '_');
    String topRim = padTopRim + dawoLogoS;

    String botRim = '____'; //  Widen this later to screen-width.
    String padBotRim = botRim.padRight(sW, '_');
    botRim = padBotRim;
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
      /// Add header and footer Strings
      twoBoxL.add(_hfL[0]);
      twoBoxL.add(topRim);
      for (var c = 0; c < twoBoxHeight; c++) {
        String firstData = aColonList[c];
        String secondData = bColonList[c];
        String longS = '$borderS $firstData  $borderS $secondData $borderS ';
        twoBoxL.add(longS);
      }
      twoBoxL.add(botRim);
      twoBoxL.add(_hfL[1]);
      twoBoxL.forEach(print);
      //  Write it all to StringBuffer;
      //  _retBuf.writeAll(twoBoxL);
      _retBuf.write(_hfL[0]);
      _retBuf.writeAll(twoBoxL);
      _retBuf.write(_hfL[1]);
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
      //  add header and footer
      twoBoxL.add(_hfL[0]);
      threeBoxL.add(topRim);
      for (var c = 0; c < threeBoxHeight; c++) {
        String fData = cColonList[c];
        String sData = dColonList[c];
        String tData = eColonList[c];
        String longS =
            '$borderS $fData $borderS $sData $borderS $tData $borderS';
        threeBoxL.add(longS);
      }
      twoBoxL.add(_hfL[1]);
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
// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved.
// Use of this source code is governed by a BSD-style license that
// can be found in the LICENSE file.
//
///  ##  box_serve presenting objects in cl in box-shaped form .
/// * Structuring-logic, elements order, is in callers side
/// * PLAN:  Automatic ordering of elements, if client do not give it.
/// * dwv: version:   1.0.0.  10.4.2022.   devState:  60%
/// * GitHub: yes
///  NOTE:  box_serve has been invisible in doc, it is only imported
///  TODO:  check:  box_serve
//


part of venue;


///  First: shaping map in tools, tl, library for k, v, widths.
///  If the parameter can’t be null, then either provide a default value:
///  howTo NULL       void f([int x = 1]) {}
List<String> infoBox(Map<String, String> inM, int _k, _v, [int margin = 0]) {
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
  //  The operand can't be NULL so the condition is always true

  indent = ''.padRight(margin, ' ');

  List<String> infoL2 = [];
  int _length = infoL.length;
  infoL2.add('$indent$_rulerHeader2');
  for (var x = 0; x < _length; x++) {
    String _s = '';
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
}      //     -----     infoBox




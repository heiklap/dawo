// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  ## packDawo
///  * Presenting data for dawo-chore system.
///  dawo version:   0.0.5  6.11.2017
///  * Tracking and helping development of dawo package.

library packDawo;

import 'dart:convert';

///  Three classes that are used in JSON play.
class PackDawoHook {
  String name = 'This is class PackDawoHook';
}

var packDawoHook = new PackDawoHook();

String dawoHook() {
  return 'This is dawo-hook';
}

String dawoPole() {
  return 'This is a dawo pole';
}

String dawoFlag() {
  return 'This is a dawo flag';
}

///
class PackDawoPole {
  String name = 'This is class PackDawoPole';
}

var packDawoPole = new PackDawoPole();

///
class PackDawoFlag {
  String name = 'This is class PackDawoFlag';
}

var packDawoFlag = new PackDawoFlag();

///
class PackDawo {
  String name = 'Develop dawo package';

  ///  forming new kind of map, to keep more information
  Map<String, Map<String, String>> packDawoClayM = {};

  ///  Map tracking dawo 0.0.4 version changes.
  Map<String, String> vers004 = {
    //   D:0 V:3 E:3  for Done, value, effort
    //  TODO  This kind of data might better be List<List<String>>
    '0 D:0 V:3 E:3': '0.0.4  A. Publish version 0.0.4 to Pub  16.10.2017.',
    '1 D:0 V:3 E:3': '0.0.4  * Fill #Word data to buff.',
    '2 D:0 V:3 E:3': '0.0.4  * Seek StringBuffer, for to find certain data.',
    '3 D:7 V:3 E:3': '0.0.4  DON  Clean rest 7 of files for TODO and Notes.',
    '4 D:9 V:3 E:3': '0.0.4  DONE Four box sided in devBox outPut.',
    '4b D:0 V:3 E:3': '? ?   *  Resolve row-count / height.',
    '5 D:8 V:3 E:3':
        '0.0.4  DONE    Empty all screen outPutfor to get control on it-',
    '6 D:0 V:3 E:3': '0.0.4 *  Get flow-output, 20-30 items of app roll.',
    '7 D:7 V:3 E:3': '0.0.4  DON     Mission report, boxed 2x2.',
    '8 D:0 V:3 E:3': '0.0.4  * Fine-Print-Map.',
    '9 D:5 V:3 E:3': '0.0.4  DO   Dev-Notes, add 30.',
    '10 D:0 V:3 E:3': '? ?    Classes: add field: outBuf. Use in flow.',
    '11 D:0 V:3 E:3':
        '0.0.5   Word/ Lang. Create Lang class and methods.To collect words.',
    '12 D:0 V:3 E:3': '0.0.6   Use set, queue, enum, typedef aso.',
    '13 D:0 V:3 E:3': '0.0.5  * Stamp time, duration.',
    '14 D:0 V:3 E:3': '0.0.5  JSON, indexedDB.',
    '15 D:0 V:3 E:3': '0.0.6     Async, Stream.',
    '16 D:0 V:3 E:3': ' ? ?    Render, make all them presentations.',
    '17 D:0 V:3 E:3':
        '0.0.6  Opera - placard. To carry data inside operations.',
    '18 D:0 V:3 E:3':
        '0.0.7    Change all pB (print) val to int: 0-2-4-6 for: NO, FLOW, MSG, BUF.',
    '19 D:0 V:3 E:3': '0.0.5 *Chore report. And in boxed form. And roll',
    '20 D:0 V:3 E:3': '0.0.5  Give pB -print variables in test-fileparameters.',
    '21 D:0 V:3 E:3': '0.0.5   Create #Issues list for dev.',
    '22 D:0 V:3 E:3': '0.0.4  *  Present this map in sort-value (area) order.',
    '23 D:0 V:3 E:3': '0.0.5   6.11.2017  Version 0.0.5 Publish to Pub.',
  };

  ///  Map tracking dawo 0.0.5 version changes.
  Map<String, String> vers005 = {
    // D: = DONE 0-9, V: = value 0-9, E: = effort 0-9
    '1 D:0 V:4 E:4':
        'Matrix160x220 like String-List box update with subString(x,y)',
    '2': ' ? Common subString search / replace',
    '3': '',
    '4': '',
    '5': '',
    '6': '',
    '7': '',
    '8': '',
    '9': '',
    '10': '',
    '11': '',
    '12': '',
    '13': '',
    '14': '',
    '15': '',
  };

  Map<String, String> vers006 = {
    '1': '',
    '2': '',
    '3': '',
    '4': '',
    '5': '',
    '6': '',
    '7': '',
    '8': '',
    '9': '',
    '10': '',
    '11': '',
    '12': '',
    '13': '',
    '14': '',
    '15': '',
  };

  void buildMaps() {
    packDawoClayM.addAll({
      'Version 0.0.4': vers004,
      'Version 0.0.5': vers005,
    });
  }
}

///  sample data from: http://json-schema.org/example/card.json
var packDawoJSON = {'name': '', 'skill': 'dart', 'level': 'good'};

///  sample data from: http://json-schema.org/example/card.json
var tempoJSON = {'name': '', 'skill': 'dart', 'level': 'good'};

///  sample data from: http://json-schema.org/example/card.json
var moodJSON = {'name': '', 'mood': 'dart', 'level': 'good'};

///  sample data from: http://json-schema.org/example/card.json
var profitJSON = {'name': '', 'skill': 'dart', 'level': 'good'};

var learnToLoveJSON = {
  'use': 'Use it regularly',
  'learn': 'Basics',
  'dogfood': 'Eat it'
};

var responseJSON = {
  "status": 1,
  "content": {"sessionid": "4c86cf1acac07811db6ec670e0b9cdd2"}
};

///  model from #Wikipedia
/*
//TODO  quest: howTo do JSON.decode when String is in many rows?
var dawoMenu = JSON.decode('[
  "menu" : {
    "id": "file",
    "value": "File",
    "dragdown": {
      "menuitem": [
        {"value": "New", "onclick": "CreateNewDoc()"},
        {"value": "Open", "onclick": "OpenDoc()"},
        {"value": "Close", "onclick": "CloseDoc()"}
      ]
    },
    "popup": {
      "menuitem": [
        {"value": "New", "onclick": "CreateNewDoc()"},
        {"value": "dawoHook()", "onclick": "dawoFlag()"},
        {"value": "Open", "onclick": "OpenDoc()"},
        {"value": "Close", "onclick": "CloseDoc()"}
      ]
    }
  }
]');
*/

void renderDawoMenu() {
  //  dawoMenu.menu.popup.menuitem[1].value;
}

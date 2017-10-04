// is governed by a BSD-style license that can be found in the LICENSE file.
///  packDawo
///  presenting data for dawo-chore system
///  dawo version:  ready for 0.0.4 : 20%    3.10.2017
///  Tracking and helping development of dawo package.

library packDawo;

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
    '1 D:0 V:3 E:3': '0.0.4   Fill #Word data to buff.',
    '2 D:0 V:3 E:3': '0.0.4   Seek StringBuffer, for to find certain data.',
    '3 D:0 V:3 E:3': '0.0.4  Clean rest 7 of files for TODO and Notes.',
    '4 D:0 V:3 E:3': '0.0.4  Four box sided in devBox outPut.',
    '4b D:0 V:3 E:3': '? ?     - Resolve row-count / height.',
    '5 D:8 V:3 E:3': '0.0.4      Empty all screen outPutfor to get control on it-',
    '6 D:0 V:3 E:3': '0.0.4 *Get flow-output, 20-30 items of app roll.',
    '7 D:7 V:3 E:3': '0.0.4      Mission report, boxed 2x2.',
    '8 D:0 V:3 E:3': '0.0.4  Fine-Print-Map.',
    '9 D:5 V:3 E:3': '0.0.4    Dev-Notes, add 30.',
    '10 D:0 V:3 E:3': '? ?    Classes: add field: outBuf. Use in flow.',
    '11 D:0 V:3 E:3': '0.0.5   Word/ Lang. Create Lang class and methods.To collect words.',
    '12 D:0 V:3 E:3': '0.0.6   Use set, queue, enum aso.',
    '13 D:0 V:3 E:3': '0.0.5 Stamp time, duration.',
    '14 D:0 V:3 E:3': '0.0.5  JSON, indexedDB.',
    '15 D:0 V:3 E:3': '0.0.6     Async, Stream.',
    '16 D:0 V:3 E:3': ' ? ?    Render, make all them presentations.',
    '17 D:0 V:3 E:3': '0.0.6  Opera - placard. To carry data inside operations.',
    '18 D:0 V:3 E:3': '0.0.7    Change all pB (print) val to int: 0-2-4-6 for: NO, FLOW, MSG, BUF.',
    '19 D:0 V:3 E:3': '0.0.5 *Chore report. And in boxed form. And roll',
    '20 D:0 V:3 E:3': '0.0.5  Give pB -print variables in test-fileparameters.',
    '21 D:0 V:3 E:3': '0.0.5   Create #Issues list for dev.',
    '22 D:0 V:3 E:3': '0.0.4   Present this map in sort-value order.',
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

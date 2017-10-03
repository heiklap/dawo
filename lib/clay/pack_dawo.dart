// is governed by a BSD-style license that can be found in the LICENSE file.
///  packDawo
///  presenting data for dawo-chore system
///  dawo version:  ready for 0.0.4 : 20%    3.10.2017
///  Tracking and helping development of dawo package.

library packDawo;

///
class PackDawo {
  String name = 'Create dawo package';

  ///  forming new kind of map, to keep more information
  Map<String, Map<String, String>> packDawoClayM = {};

  Map<String, String> vers004 = {
    '1 V:3 E:3': 'Fill #Word data to buff.',
    '2': 'Seek StringBuffer, for to find certain data.',
    '3': 'Clean rest 7 of files for TODO and Notes.',
    '4': 'Four box sided in devBox outPut.',
    '4b': '- Resolve row-count / height.',
    '5': 'Empty all screen outPutfor to get control on it-',
    '6': 'Get flow-output, 20-30 items of app roll.',
    '7  DON_': 'Mission report, boxed 2x2.',
    '8': 'Fine-Print-Map.',
    '9': 'Dev-Notes, add 30.',
    '10': 'Classes: add field: outBuf. Use in flow.',
    '11': 'Word/ Lang. Create Lang class and methods.To collect words.',
    '12': 'Use set, queue, enum aso.',
    '13': 'Stamp time, duration.',
    '14': 'JSON, indexedDB.',
    '15': 'Async, Stream.',
    '16': 'Render, make all them presentations.',
    '17': 'Opera - placard. To carry data inside operations.',
  };

  Map<String, String> vers005 = {
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
    });
  }
}

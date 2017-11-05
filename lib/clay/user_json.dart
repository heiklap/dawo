// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  ##  dawo : data-in : user specific data in json format.

///  dawo version:  0.0.4  4.11.2017.    ready-state for 0.0.5  0 %
///
///  Hist: hkl  4.11.2017 dawo.0.0.4  dawo/lib/clay user_json.dart
///  Move here from effort.dart all json aso. data.

///  NEXT:  Personalize for different missions.
///  NEXT:
///  NEXT:
///
//

library user_json;

import 'dart:collection';
import 'dart:convert';

///  Now only one UserJson data file.
///  Eventually every #clay may have it's own user/json-file.
class UserJson {
  //  Build system where every user has it's own incoming / json-data.
  String name = '';

  ///  **************   JSON  example material      **************************
  ///  #QUEST : howTo mediate incoming data to user in JSON format?
  ///  https://api.dartlang.org/stable/1.24.2/dart-convert/JsonCodec-class.html
  ///  encode(Object value, { dynamic toEncodable(object) }) → String
  ///  Converts value to a JSON string.

  ///  decode(String source, { dynamic reviver(key, value) }) → dynamic
  ///  Parses the string and returns the resulting Json object.
  ///
  /// Class from json:   Type t = Animal;
//  new t.fromJson(...);
  ///  Example: Simulating user imported data with: JSON.  //  in dart:convert
  ///  #dartFMT has funny way to write JSON
  var encoded = JSON.encode([
    1,
    2,
    {"a": null}
  ]);

  ///  output: [1,2,{"a":null}]  length:  16

  ///  output:  [foo, {bar: 499}]  length:  2
  var decoded = JSON.decode('["foo", { "bar": 499 }]');

  var dpIn = JSON.encode([
    "dpStart",
    {"inData": 5}
  ]);
  var dpOut = JSON.decode('["dpNext", { "outFormData": 7 }]');

  ///  **************   JSON  example material      **************************

  ///  **************   JSON  example material      **************************
  ///  Simulating two user-data.
  var busJSONEnc = JSON.encode([
    "dBus37",
    {"outCode": 521},
    "dBus38",
    {"outCode": 369},
    "dBus39",
    {"outCode": 437}
  ]);
  var furyJSONEnc = JSON.encode([
    "dpEncNext",
    {"outFormData": 7}
  ]);

  var humanInEnc = JSON.encode([
    "front",
    {"hr4": 3, "hr5": 2},
//    "mid",
//    {"cr5": 4, "cr7": 2},
    "back",
    {"mr6": 5, "mr12": 7}
  ]);

  ///  Two var that are planned to be used for user-in JSON data.
  var busJSONDec = JSON.decode('["dpFirst", { "outBusData": 7 }]');
  var furyJSONDec = JSON.decode('["dpFirst", { "outFuryData": 3 }]');
} //  -----   class UserJson

var userJson = new UserJson();

///  Only a presentation function.
void renderUserJson(String caller) {
  print('  -->-->  renderUserJson started  called by: $caller   -->--> ');
  //  Crete only-here instance.
  var uj = new UserJson();
  //  encode(Object value, { dynamic toEncodable(object) }) → String
  //  Converts value to a JSON string.

  //  decode(String source, { dynamic reviver(key, value) }) → dynamic
  //  Parses the string and returns the resulting Json object.
  print('encoded:: ');
  print(uj.encoded);
  print(uj.encoded.length);
  print('decoded::');
  print(uj.decoded);
  print(uj.decoded.length);

  print('- encode: Converts value to a JSON string.::');
  print(uj.dpIn);
  print([
    "dpStart",
    {"inData": 5}
  ]);
  print(uj.dpIn[0]);
  print(uj.dpIn[1]);
  print('- decode: Parses the string and returns the resulting Json object::');
  print(uj.dpOut);
  print('["dpNext", { "outFormData": 7 }]');
  print(uj.dpOut[0]);
  print(uj.dpOut[1]);
  print('  --<--<  renderUserJson   done  called by: $caller   --<--< ');
}

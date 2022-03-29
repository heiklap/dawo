// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  ##
///  ##  dawo : data-in : user specific data in JSON format.
///  Learning to import JSON decoded / encoded data.
///  Eventually these are imported by server-client / DB system.
///  * dawo version:    0.8.0.   28.3.2022:.    devState: 10%
///  *
///  * NEXT: 0.1.X  Personalize for different missions / search by #clause
///  * NEXT: 0.1.X   Data extracted from #chunk by caller name of #search.
///  * NEXT: 0.1.X  Object check if JSON / DB data is available.

///  Hist: hkl  4.11.2017 dawo.0.0.4  dawo/lib/clay user_json.dart
///

part of 'clay.dart';




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
  var encoded = json.encode([
    1,
    2,
    {"a": null}
  ]);

  ///  output: [1,2,{"a":null}]  length:  16

  ///  output:  [foo, {bar: 499}]  length:  2
  var decoded = json.decode('["foo", { "bar": 499 }]');

  var dpIn = json.encode([
    "dpStart",
    {"inData": 5}
  ]);
  var dpOut = json.decode('["dpNext", { "outFormData": 7 }]');

  ///  **************   json  example material      **************************

  ///  **************   json  example material      **************************
  ///  Simulating two user-data.
  var busJSONEnc = json.encode([
    "dBus37",
    {"outCode": 521},
    "dBus38",
    {"outCode": 369},
    "dBus39",
    {"outCode": 437}
  ]);
  var furyJSONEnc = json.encode([
    "dpEncNext",
    {"outFormData": 7}
  ]);

  var humanInEnc = json.encode([
    "front",
    {"hr4": 3, "hr5": 2},
//    "mid",
//    {"cr5": 4, "cr7": 2},
    "back",
    {"mr6": 5, "mr12": 7}
  ]);

  ///  Two var that are planned to be used for user-in json data.
  var busJSONDec = json.decode('["dpFirst", { "outBusData": 7 }]');
  var furyJSONDec = json.decode('["dpFirst", { "outFuryData": 3 }]');
} //  -----   class UserJson

UserJson userJson = UserJson();

///  Only a presentation function.
void renderUserJson(String caller) {
  print('  -->-->  renderUserJson started  called by: $caller   -->--> ');
  //  Crete only-here instance.
  UserJson uj = UserJson();
  //  encode(Object value, { dynamic toEncodable(object) }) → String
  //  Converts value to a json string.

  //  decode(String source, { dynamic reviver(key, value) }) → dynamic
  //  Parses the string and returns the resulting Json object.
  print('encoded:: ');
  print(uj.encoded);
  print(uj.encoded.length);
  print('decoded::');
  print(uj.decoded);
  print(uj.decoded.length);

  print('- encode: Converts value to a json string.::');
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

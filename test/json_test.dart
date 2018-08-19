// Copyright (c) 2017, hmmmm
//  dawo version:  0.0.5  6.11.2017

import 'dart:convert';

void main() {
  myCars();

  fooBar();
  car();
}

void myCars() {
  //  https://www.w3schools.com/js/js_json_arrays.asp
  print('----  myCars  -----myObj create::');
  var myObj = {
    "name": "John",
    "age": 30,
    "cars": [
      {
        "name": "Ford",
        "models": ["Fiesta", "Focus", "Mustang"]
      },
      {
        "name": "BMW",
        "models": ["320", "X3", "X5"]
      },
      {
        "name": "Fiat",
        "models": ["500", "Panda"]
      }
    ]
  };
  print('----  myCars  -----String s::');
  String s;
  s = myObj.toString();
  print(s);
  print('----  myCars  -----myObjD = json . decode::  ');
  //  hklTry  make this a List.

  //var myObjD = json.decode('["mc", {name: John, age: 30, cars: [{name: Ford, models: [Fiesta, Focus, Mustang]}, {name: BMW, models: [320, X3, X5]}, {name: Fiat, models: [500, Panda]}]}]');
  var myObjD = json.decode(
      '{"name":"John","age":30,"cars": [{ "name":"Ford", "models":[ "Fiesta", "Focus", "Mustang" ] }, { "name":"BMW", "models":[ "320", "X3", "X5" ] }, { "name":"Fiat", "models":[ "500", "Panda" ] }]}');
  print(myObjD);
  print('----  myCars  -----myObjD name::');
  print(myObjD["name"]);
  print('----  myCars  -----myObj-age::'); //
  print(myObjD["age"]); //  Class 'int' has no instance method '[]'.

  print('----  myCars  ---myObj cars:: --');
  print(myObjD["cars"]);
  print('----  myCars  ---myObj cars:: models 0::-');
  print(myObjD["cars"][0]);
  print('----  myCars  ---myObj cars:: models 1::-');
  print(myObjD["cars"][1]); //  {name: BMW, models: [320, X3, X5]}
  print('----  myCars  ---myObj cars:: models 2::-');
  print(myObjD["cars"][2]); //  {name: Fiat, models: [500, Panda]}
}

void fooBar() {
  print('\n------  fooBar  ----------');
  var decoded = json.decode('["foo", { "bar": 499 }]');
  print(decoded); //  Decoded is a List.
  print(decoded[0]); // This is a String.
  String s = decoded[0];
  String s2 = s.padRight(4, '!');
  print(s2);
  print(decoded[1]);
  //  no
  print(decoded[0][1]); // ok letter

  //print(decoded[0].bar);
}

void car() {
  print('\n------  car  ----------');
  var myObj =
      json.decode('["foo", { "name": "499", "cars": "Fiat Ford BMW" }]');
  //  hklTry  more complicated map
  //  var myObj = json.decode('["foo", { "name": "499", {"car1": "Fiat",  "car2" : "Ford", "car3" : "BMW"} }]');
  //  Map testM =  {"car1": "Fiat",  "car2" : "Ford", "car3" : "BMW"};

  //type '_InternalLinkedHashMap<String, dynamic>' is not a subtype of type 'String' of 'y' where
  print(myObj.runtimeType);
  print(myObj);
  print(myObj.length); // 2
  String x;
  String y;
  print('---   x: item 0  ----');
  x = myObj[0];
  print(x);
  //or:
  print('---   y: item 1  ----');
  //  y = myObj[1][0];  //  null
  // y = myObj[1]["name"];  //  499
  y = myObj[1]["cars"]; //  Fiat Ford BMW
  print(y);
}

void playDecode() {
  var myObj = json.decode('{ "name":"John", "age":30, "car":null }');
  String x;
  print(myObj.toString());
  print(myObj);
  x = myObj.name;
  print(x);
}

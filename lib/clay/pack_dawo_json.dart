///  While waiting for server-client to import json.data

library packDawoJson;

import 'dart:convert';

class PdJson {
  var myFriends = {
    "name": "John",
    "age": 30,
    "cars": ["Ford", "BMW", "Fiat"]
  };

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
  }; // myObj

} //  class packDawoJson
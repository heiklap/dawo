///  JSON data for packDawo.  -  dawo version  0.0.6 : 27.11.2017
///  While waiting for server-client to import json.data

library packDawoJson;

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

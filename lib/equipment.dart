// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  equipment.dart  resources for Mission and Chore.
///  * Dawo version 0.0.4  16.10.2017    ready state for 0.0.5 : 0%
///  * Instance as:  equ
//

library equipment;

import 'dart:math';

///  Material and name resources for Missions and Chore.
class Equipment {
  bool active = false;
  var random = new Random(27);

  String area = 'areaR';
  String car = 'carR';
  String law = 'lawR';
  String machine = 'machineR';
  String money = 'moneyR';
  String office = 'officeR';
  String people = 'peopleR';
  String time = 'timeR';

  String notAvailable = 'notR';
  String unknown = 'unknownR';
  List<String> resL = [];

  void init(String caller) {
    print('-->-->   **  resource-init by:  $caller   ****');
    resL.addAll([area, car, law, machine, money, office, people, time]);
  }

  List<String> areas = [
    'Area-Hall',
    'A-Warehouse',
    'A-Factory',
    'pipe Storage',
    'Car-Park',
    'Garden',
    'Yard',
    'Electric-center'
  ];

  List<String> cars = [
    'Rover',
    'ToyotaPic',
    'Toyota',
    'Saab',
    'Sisu',
    'Mercedes',
    'Volksawgen',
    'Volvo',
    'Ford'
  ];

  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  List<String> officeCities = [
    'Tampere Office',
    'Helsinki Warehouse',
    'Oulu Main',
    'Rovaniemi Office',
    'Berlin Office',
    'London Office'
  ];

  List<String> programAreas = [
    'Web',
    'Server',
    'Isolate',
    'Async',
    'HTTP',
    'Mongo'
  ];

  List<String> weekDays = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  ///  Produce nice-looking allocation-list.
  List<String> allocate(int _r, int _c) {
    //  TODO  use _c variable to control width
    //  init();  must be done somewhere.
    List<String> _l = [];
    StringBuffer _sB = new StringBuffer();
    _l.add(
        'Days Area:   Car:    Law:    Machine:Money:  Office: People: Time:');
    for (var x = 0; x < _r; x++) {
      String _dS = x.toString();
      //TODO  padRight(5, ' ')
      String _sbW = 'D:$_dS ';
      _sB.write(_sbW.padRight(5, ' '));

      ///  Write one of 8 resources in right place
      ///  int nextInt(int max);
      int _rand = random.nextInt(8); //  get one of first 8 resources.
      for (var x = 0; x < 8; x++) {
        if (x == _rand) {
          //  padRight(8, ' ')
          String _sP = resL[x].padRight(8, ' ');
          _sB.write(_sP);
        } else {
          _sB.write('_______ ');
        }
      }
      _l.add(_sB.toString());
      //  _sB.write();
      _sB.clear();
    }
    return _l;
  }
}

///  Creating instance with short handy name.
var equ = new Equipment();

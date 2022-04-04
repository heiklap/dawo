// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  ## equipment  :  material resources for Mission and Chore.
///  * No objects, but:  String-values for simple demo and presentation.
///  * dwv: version:   0.7.0.  27.3.2022.    devState : 30 %
///  * Instance as:  equ
///

part of mis;




///  Material and name resources for Missions and Chore.
class Equipment {
  ///
  bool active = false;
  Random random = Random(27);

  ///  Imitating real classes / Just using String-names.
  String area = 'areaR';
  ///
  String car = 'carR';
  String law = 'lawR';
  ///
  String machine = 'machineR';
  String money = 'moneyR';
  ///
  String office = 'officeR';
  String people = 'peopleR';
  String time = 'timeR';
  ///
  String notAvailable = 'notR';
  String unknown = 'unknownR';
  ///
  List<String> resL = [];

  ///
  void init(String caller) {
    print('-->-->   **  resource-init by:  $caller   ****');
    //  line 35 col 9: Use isEmpty instead of length
    if (resL.isEmpty) {
      resL.addAll([area, car, law, machine, money, office, people, time]);
    }
  }     //     -----     init

  ///  representation on aerial entities
  Map<String, String> areas = {
    'Area-Hall': '_ _ _ _ _ _ _ _ _ _ ',
    'A-Warehouse': '_ _ _ _ _ _ _ _ _ _ ',
    'A-Factory': '_ _ _ _ _ _ _ _ _ _ ',
    'pipe Storage': '_ _ _ _ _ _ _ _ _ _ ',
    'Car-Park': '_ _ _ _ _ _ _ _ _ _ ',
    'Garden': '_ _ _ _ _ _ _ _ _ _ ',
    'Yard': '_ _ _ _ _ _ _ _ _ _ ',
    'Electric-center': '_ _ _ _ _ _ _ _ _ _ '
  };

  ///  That's what you drive.
  Map<String, String> cars = {
    'Rover': '_ _ _ _ _ _ _ _ _ _ ',
    'ToyotaPic': '_ _ _ _ _ _ _ _ _ _ ',
    'Toyota': '_ _ _ _ _ _ _ _ _ _ ',
    'Saab': '_ _ _ _ _ _ _ _ _ _ ',
    'Sisu': '_ _ _ _ _ _ _ _ _ _ ',
    'Mercedes': '_ _ _ _ _ _ _ _ _ _ ',
    'Volksawgen': '_ _ _ _ _ _ _ _ _ _ ',
    'Volvo': '_ _ _ _ _ _ _ _ _ _ ',
    'Ford': '_ _ _ _ _ _ _ _ _ _ '
  };

  ///  Might be better from intl? package.  Do it Map.
  Map<String, String> months = {
    'January': '_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ ',
    'February': '_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ ',
    'March': '_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ ',
    'April': '_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ ',
    'May': '_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ ',
    'June': '_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ ',
    'July': '_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ ',
    'August': '_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ ',
    'September': '_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ ',
    'October': '_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ ',
    'November': '_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ ',
    'December': '_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ ',
  };

  ///  Nice little towns from civilized world.
  Map<String, String> officeCities = {
    'Tampere Office': '_ _ _ _ _ _ _ _ _ _ ',
    'Helsinki Warehouse': '_ _ _ _ _ _ _ _ _ _ ',
    'Oulu Main': '_ _ _ _ _ _ _ _ _ _ ',
    'Rovaniemi Office': '_ _ _ _ _ _ _ _ _ _ ',
    'Berlin Office': '_ _ _ _ _ _ _ _ _ _ ',
    'London Office': '_ _ _ _ _ _ _ _ _ _ '
  };

  ///
  Map<String, String> programAreas = {
    'Web': '_ _ _ _ _ _ _ _ _ _ ',
    'Server': '_ _ _ _ _ _ _ _ _ _ ',
    'Isolate': '_ _ _ _ _ _ _ _ _ _ ',
    'Async': '_ _ _ _ _ _ _ _ _ _ ',
    'HTTP': '_ _ _ _ _ _ _ _ _ _ ',
    'Mongo': '_ _ _ _ _ _ _ _ _ _ ',
  };

  ///  How about 3-letter abbreviations?
  Map<String, String> weekDays = {
    'Monday': '_ _ _ _ _ _ _ _ _ _ ',
    'Tuesday': '_ _ _ _ _ _ _ _ _ _ ',
    'Wednesday': '_ _ _ _ _ _ _ _ _ _ ',
    'Thursday': '_ _ _ _ _ _ _ _ _ _ ',
    'Friday': '_ _ _ _ _ _ _ _ _ _ ',
    'Saturday': '_ _ _ _ _ _ _ _ _ _ ',
    'Sunday': '_ _ _ _ _ _ _ _ _ _ ',
  };

  ///
  Map<String, String> twoWeeks = {
    'Monday': '_ _ _ _ _ _ _ _ _ _ ',
    'Tuesday': '_ _ _ _ _ _ _ _ _ _ ',
    'Wednesday': '_ _ _ _ _ _ _ _ _ _ ',
    'Thursday': '_ _ _ _ _ _ _ _ _ _ ',
    'Friday': '_ _ _ _ _ _ _ _ _ _ ',
    'Saturday': '_ _ _ _ _ _ _ _ _ _ ',
    'Sunday': '_ _ _ _ _ _ _ _ _ _ ',
    'Monday2': '_ _ _ _ _ _ _ _ _ _ ',
    'Tuesday2': '_ _ _ _ _ _ _ _ _ _ ',
    'Wednesday2': '_ _ _ _ _ _ _ _ _ _ ',
    'Thursday2': '_ _ _ _ _ _ _ _ _ _ ',
    'Friday2': '_ _ _ _ _ _ _ _ _ _ ',
    'Saturday2': '_ _ _ _ _ _ _ _ _ _ ',
    'Sunday2': '_ _ _ _ _ _ _ _ _ _ ',
  };

  ///  simulation: Produce nice-looking allocation-list of resources.
  List<String> allocate(int _r, int _c) {
    ///  devl:MIS  use _c variable to control width
    ///  init();  must be done somewhere.
    List<String> _l = [];
    StringBuffer _sB = StringBuffer();
    _l.add(
        'Days Area:   Car:    Law:    Machine:Money:  Office: People: Time:');
    for (var x = 0; x < _r; x++) {
      String _dS = x.toString();
      //  devl:MIS  padRight(5, ' ')
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
  }     //     -----     allocate

}     //     -----     class Equipment

///  Creating instance with short handy name.
Equipment equ = Equipment();

// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
//
///  # dawo clay  myTime
///  * Presenting data for dawo-myTimeMission and it's chore system.
///  * All missions can (PLAN:) contact and co-work other objects in dawo.
///  * PLAN: connect to outside time-management and productivity tools.
///  * version:   0.3.0  23.3.2022  -  devState: 30%

//
library myTime;

///  MyTime class
class MyTime {
  ///  name
  String name = 'My Time class';

  ///
  Map<String, Map<String, String>> myTimeClayM = {};

  ///
  Map<String, String> dayM = {
    'Monday': 'Dartlang, Music',
    'Tuesday': 'Boating, outdoor',
    'Wednesday': 'Dartlang, Dawo-package',
    'Thursday': 'Helsinki-day',
    'Friday': 'Resting, trip to cottage',
    'Saturday': 'Cottage, woodWork',
    'Sunday': 'Cottage, Willage-day',
  };

  ///  day times and functionality in them
  Map<String, String> dayTimes = {
    'day': '#work:8 #eat:1 #outdoor:2 #travel:1 #learn:4 #net:5',
    'night': '#sleep:7 #tryToSleep:0 #shortWake:05 #wakeUp',
    'morning': '#wakeUp #coffee:1 #breakfast',
    'midnight': 'Moon is rising',
    'afternoon': '#lunch',
    'evening': '#home:6 :tv:1 :coffee:1',

    ///
  };

  ///
  Map<String, String> workHours = {
    '06': '#net #pub #stack #gitter',
    '07': '#net #social #post',
    '08': '#learnb #mong:1o #dartlang:2 #computer',
    '09': '#coding #dawo',
    '10': 'Inspirational things',
    '11': '#lunch',
    '12': 'un-rational things',
    '13': 'Meet people',
    '14': 'Get organized',
    '15': '#dawo:1 #gitHub',
    '16': '#travelHome #dinner',
    '18': 'homeWork:1',
    '21': '#net:1'

    ///
  };

  ///
  void buildMaps() {
    myTimeClayM
        .addAll({'dayMap': dayM, 'dayTimes': dayTimes, 'workHours': workHours});
  }
} //  -----  class MyTime

///  render-function
void renderWorkingWeek() {
  var wW = new MyTime();
  wW.dayM;
}

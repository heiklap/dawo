// is governed by a BSD-style license that can be found in the LICENSE file.
///  dawo clay  myWeek
///  presenting data for dawo-chore system
///  dawo version:  0.0.3  25.9.2017

//
library myTime;

///
class MyTime {
  String name = 'My Time class';

  Map<String, Map<String, String>> myTimeClayM = {};

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

  void buildMaps() {
    myTimeClayM
        .addAll({'dayMap': dayM, 'dayTimes': dayTimes, 'workHours': workHours});
  }
} //  -----  class MyTime

void renderWorkingWeek() {
  var wW = new MyTime();
  wW.dayM;
}

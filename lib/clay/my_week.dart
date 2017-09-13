// is governed by a BSD-style license that can be found in the LICENSE file.
///  dawo clay  myWeek
///  presenting data for dawo-chore system
///

//
library myWeek;

///
class WorkingWeek {
  Map<String, String> dayM = {
    'Monday': 'Dartlang, Music',
    'Tuesday': 'Boating, outdoor',
    'Wednesday': 'Dartlang, Dawo-package',
    'Thursday': 'Helsinki-day',
    'Friday': 'Resting, trip to cottage',
    'Saturday': 'Cottage, woodWork',
    'Sunday': 'Cottage, Willage-day',
  };
}

void renderWorkingWeek() {
  var wW = new WorkingWeek();
  wW.dayM;
}

// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  ##  devNotes class
///  Primary functionality:  Keep dev data.
/// * dawo version:  0.0.8.  -  13.3.2019.
/// * devState : 25%    in GitHub : yes
// hist>  9.1.2018  Separated from dawoApp.
//

part of dawo_dev.dart;

///  Roll, next, calls this.
void fillNotes() {
  dev.admN
    ..add('>>ADM:CHECK-IN  dawo_app-roll  >>')
    ..add(':Ar: = in App-Roll. Mark value number: #7: ')
    ..add(':Ar: :Word: Testing: #ALERT #NoAction.')
    ..add(':Ar: :Word: Testing: #ALL #Action.')
    ..add(':Ar: :Word: Testing: #ALL #NoAction.')
    ..add(':Ar: :Word: Testing: #ALL #NoAction.')
    ..add(':Ar: :#ORDER: Short names for coders to use.');

  dev.devN
    ..add(':Ar: :TDev: Habits: keep 3 day off before new version.')
    ..add(':Ar: :TDev: Connect: Try to get :feedback: #Area.')
    ..add(':Ar: :Placement in time and area for objects.')
    ..add(':Ar: :Word: #Picker.')
    ..add(':Ar: :Performance: #?  #CL Long time to render.')
    ..add(':Ar: :NO: list for prohibited #Words for team.')
    ..add(':Ar: :YES: list for only-allowed #Words for team.')
    ..add(':Ar: :SHOW: method; parameter to give #Find this.')
    ..add(':Ar: :TEST:  Benchmark.');

  dev.innoN
    ..add('full of extensions, macros, rules, and more.  bazel')
    ..add(':Ar: Incremented #Number in new notes.')
    ..add(':Ar: Clean older notes or archive them.')
    ..add(':Ar: Not allowed messages if at least one Legal word.')
    ..add(':Ar: Words: ')
    ..add(':Ar: Words: ## To mark word for consideration as key.')
    ..add(':Ar: Words: ##Carry : R:mediate message to #receiver.')
    ..add(':Ar: Phraseology.')
    ..add(':Ar: #LowLevel talk for dev folks.');

  dev.howToN
    ..add(':Ar: howTo fetch data via HTTP.')
    ..add(':Ar: howTo   getfirst  changeable web pages.')
    ..add(':Ar: howTo Gather devNotes by type.')
    ..add(':Ar: howTo Classify devNotes by value.')
    ..add(':Ar: howTo Add notes last in to list?')
    ..add(':Ar: howTo Send #ALERT #ALL -note => to every List?');

  dev.secN
    ..add(':Ar: #Numbers for #Event:s and #Msg :s. ')
    ..add(':Ar: #FlowC call check for extra innder calls.')
    ..add(':Ar: #Password.')
    ..add(':Ar: #Encrypt :ion.')
    ..add(':Ar: #Force render methods to leave #Stamp or #Logo.')
    ..add(':Ar:  #Force test methods to leave #Stamp or #Logo.')
    ..add(':Ar:  #Prevent deleting notes without notice.')
    ..add(':Ar:  Keep #Track of extra iterators in notes.')
    ..add(':Ar:  #encrypt ed notes not allowed.');
}

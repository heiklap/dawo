// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
///  ##  dawo : some simple collection data, mainly Sets.
///  dawo version:  0.0.4  16.10.2017.    ready-state for 0.0.5  0 %
///
///  Hist: hkl  22.5.2014  0.0.1  dawo/lib
///  No connection to dawo-app for now, but keeping ideas and data for them.
///  NEXT version: Add SplayTreeSet,  and  LinkedHashSet
///  devNote:  Connect something from these to dawo.

//

library dawlib_coll;

///  Mediating this value to getter, that counts sum of these.
num dawlibCollReadiness = 93;

///  howTo: howToMap:  Common method to print a map.  HowToPrintMap:
void dawLibCollOperationMapPrint(Map thisMap) {
  thisMap.forEach((k, v) {
    print('$k, $v');
  });
}

//  team-howTo add map fields to list...   example
//  info('next: adding map keys to list:  ');
//  dartMap.forEach((k, v) { myValuesLists.add(v); });
//  info('next: adding map values to list:  ');
//  dartMap.forEach((k, v) { myValuesList.add(v); });

///  Initializing some sets.
var goalsS = new Set();
var plansS = new Set();
var teamsS = new Set();
var tempsS = new Set(); // adminNote   not nice name

///  testing... difference between  .  and ..
void makeGoals() {
  goalsS
    ..add('Project 0.0.1 Plan')
    ..add('Github  clean')
    ..add('HTML  Pages')
    ..add('TO-DOs check');
  goalsS.forEach(print);
}

/// adding data to Set
void makePlans() {
  plansS
    ..add('Plain idea')
    ..add('Accepted schema')
    ..add('W o r k  scheduled')
    ..add('W o r k  started');
  plansS.forEach(print);
}

/// Filling teamS Set
void makeTeams() {
  teamsS
    ..add('teamAdm')
    ..add('teamDev')
    ..add('teamEdu')
    ..add('teamHowTo')
    ..add('teamInno')
    ..add('teamNext');
  teamsS.forEach(print);
}

///  Function for adding data to this Set.
void makeTemps() {
  tempsS
    ..add('Largo     leveästi')
    ..add('Lento     hitaasti ')
    ..add('Grave     raskaasti ')
    ..add('Adagio    hitaasti ')
    ..add('Andante   käyden ')
    ..add('Allegro   nopeasti');
  tempsS.forEach(print);
}

///  Rendering and presenting sets.
void makeAllSets() {
  print('---------------------------------------- dawo sets, goals:');
  makeGoals();

  print('------------------------------------------------    plans:');
  makePlans();

  print('------------------------------------------------    teams:');
  makeTeams();

  print('------------------------------------------------    temps:');
  makeTemps();

  print('----------------------------------------------------------');
}

//

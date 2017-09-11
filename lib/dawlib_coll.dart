///  ##  dawo : some simple collection data, mainly Sets. Version 0.0.2
///  No connection to dawo-app for now.
///  NEXT version: SplayTreeSet,  and  LinkedHashSet
///
///  Hist: hkl  22.5.2014  0.0.1  dawo/lib
//

library dawlib_coll;

///  mediating this value to getter, that counts sum of these
num dawlibCollReadiness = 93;

///  method to print a map
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

///  initializing some sets
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

///  rendering and presenting sets
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

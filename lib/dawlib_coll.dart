///  hkl  22.5.2014  0.0.1  dawo/lib    collections..  simple collections
///  dawo : some collection data
///  NEXT version: SplayTreeSet,  and  LinkedHashSet
///  howTo  list print:   fort.obligations.forEach(print);

//  CHECK  LOGIC

part of dawo_src;

///  mediating this value to getter, that counts sum of these
num dawlibCollReadiness = 93;

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
var goals = new Set();
var plans = new Set();
var teams = new Set();
var temps = new Set(); // adminNote   not nice name

//  testing... difference between  .  and ..
void makeGoals() {
  goals
    ..add('Project 0.0.1 Plan')
    ..add('Github  clean')
    ..add('HTML  Pages')
    ..add('TO-DOs check');
  goals.forEach(print);
}

/// ..
void makePlans() {
  plans
    ..add('Plain idea')
    ..add('Accepted schema')
    ..add('W o r k  scheduled')
    ..add('W o r k  started');
  plans.forEach(print);
}

/// ..
void makeTeams() {
  teams
    ..add('teamAdm')
    ..add('teamDev')
    ..add('teamEdu')
    ..add('teamHowTo')
    ..add('teamInno')
    ..add('teamNext');
  teams.forEach(print);
}

///  ..
void makeTemps() {
  temps
    ..add('Largo     leveästi')
    ..add('Lento     hitaasti ')
    ..add('Grave     raskaasti ')
    ..add('Adagio    hitaasti ')
    ..add('Andante   käyden ')
    ..add('Allegro   nopeasti');
  temps.forEach(print);
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

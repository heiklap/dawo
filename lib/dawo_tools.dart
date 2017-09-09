///  ##  Some helper tools
/// *  Hist:  hkl  2014  0.0.1  dawo/lib
/// *  READY-STATE for version 0.0.1   90 %   in GIT

library dawo_tools.dart;

///
num demoToolsReadiness = 96;

///  buffer also outside class, for testing and adding visibility
var toolsBuf = new StringBuffer();

///  just a note, howTo print a map
void operationMapPrint(Map thisMap) {
  thisMap.forEach((k, v) {
    print('$k, $v');
  });
}

/// some class tests.. for coming use
var strLin = '----------------------------------------         ';

///  To print class, that is commonly used in dawo
void printClass(var thisClass, String str1, String str2, String str3) {
  print(strLin + thisClass.runtimeType.toString());
  print('Class runtime type:  ' + thisClass.runtimeType.toString());
  print('Class to string:  ' + thisClass.toString());
  // that presumes that class fas these fields
  print(thisClass.name);
  print(thisClass.motto);
  print(thisClass.info);
  print('');

  print(thisClass.description);

  print('par1:  ' + str1);
  print('par2:  ' + str2);
  print('par3:  ' + str3);

  print(' ');
  print(' ');
}

//-------------------------------------------------------

//   dawoMapApps.forEach((k,v) => print('Key:  $k  Value:  $v  '));

///  some functions for to print two values
void printSS(String str, String str2) {
  print(str + '  ' + str2);
}

//  printing numeric and String values
void printNS(num n, String str2) {
  print(n.toString() + '  ' + str2);
}

//  printing numeric value
void printN(num n) {
  print(n.toString);
}

///   small sleep-methods, to get time, to see, what is happening in tests
void sleepSimple(int waitingTime) {
  //  1000 =  one second
  //var testSleepTime = new Duration(hours:0, minutes:0, seconds:0, microseconds:500);
  var goalTime =
      new DateTime.now().add(new Duration(milliseconds: waitingTime));
  do {} while (new DateTime.now().compareTo(goalTime) < 0);
}

///  sleep method with time and optional info
void sleepMS(int waitingTime, [bool info]) {
//var testSleepTime = new Duration(hours:0, minutes:0, seconds:0, microseconds:500);
  var goalTime =
      new DateTime.now().add(new Duration(milliseconds: waitingTime));
  bool _info = info;
  if (_info) (print('Waiting for  $waitingTime'));
  do {
    //    var timeNow = new DateTime.now();
  } while (new DateTime.now().compareTo(goalTime) < 0);
  if (_info) (print('waiting time over over'));
}

//  some sample maps for coming use
Map<String, bool> toolsActive = {
  'leftActive': true,
  'rightActive': false,
  'topActive': false,
  'bottomActive': true,
  'middleActive': true
};

///  sample map
Map<num, String> toolsSpeed = {
  1: 'Speed',
  2: 'Hurry',
  3: 'Schedule',
  4: 'Slow',
  5: 'Delayed'
};

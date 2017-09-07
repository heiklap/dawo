# dawo 0.0.1

Learning Dart simple basic data for beginners, and howTo use it for building a package.
Beginner Dart programmers kickoff to develop a glorious package..

## Usage

### Brainstorming
 
 Collect people together, let they present ideas, collect best ideas to files and 
 try to group them meaningfully.
 DO NOT build many classes in this phase, for to keep your mind open for intuitive solutions. 
 Leave room and time to resolve, what will be the direction of this package.
 Practise to use Dawo by finding it's keywords in editor.
 
 First dawo version seems to be a mess, and, yes, it is intentional so.
 dawo 0.0.1 shows starter programmers confusion, and records way and steps out of this mess 
 to clarity and understanding.
 
 0.0.1  demonstrates how data is messy, when it is not inside classes.
   Check for pollution of public namespace!!
 
 0.0.2 version is meant to weed out the material and create a couple of classes.
 0.0.3 might be for building first control-flow structures to really use this app.
 
 0.0 x  
 0.0 x  Basic idea and orientation of package to resolve.
 0.0 x  Incubator idea: -move first too big parts to independent packages.
        Maybe  chore  and  team
 

### Files;
aldente_func :  Simple functions, including some logical errors. Find them!
bat_loop :  control structures.
dawlib_phase :  idea of keeping some of this stuff inside of "mini-library".

dawlib_chore : start of bigger "job" / "chore" for real-world-work. This should
quite soon to be moved to it's own library, co's it will grow too big and important.
dawlib_base : 
dawlib_coll : examples and hacking material of collections.
dawlib_stream : examples of simple Streams.
dawo.dart : 
dawo_app : dawoApp class
dawo_dew : small helper functions for cl (command line) testing.
dawo_src  file created by stagehand plugin app
dawo_tools : helper tools, stamps aso.

A simple usage example:

    import 'package:dawo/dawo.dart';
    
    // wanna import all of them?
    import 'package:dawo/aldente_func.dart';
    import 'package:dawo/bat_loop.dart';
    import 'package:dawo/dawlib_chore.dart';
    import 'package:dawo/dawlib_coll.dart';
    import 'package:dawo/dawlib_stream.dart';
    import 'package:dawo/dawo_app.dart';
    import 'package:dawo/dawo_dev.dart';
    import 'package:dawo/dawo_tools.dart';
    
       
//  create classes::
var da = new DawoApp();
var df = new DawoFlag();
var bLib = new BLib();
var ch = new SuperChore();

    main() {
      //  from Dart sample:
      var awesome = new Awesome();
      
      //  play with classes
      //  da.
      //  df.
      //  bLib.
      //  vh.
      
      //  code, play with other variables
    }

###  About variable names in Dawo
Play in IDE editor with alphabet: a..z to see, what variables are available.
See how common namespace is polluted with unnecessary stuff, and try to find
a way, to organize them to meaningful classes.

Like:
bLib 

morn, night, day 

make, init, blake

Joker

sleep(), start()   stop() 
render()

ride()   roll() 


## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: http://example.com/issues/replaceme

import 'package:first_app/w8/EXERCISE-2/ui/screens/temperature_screen.dart';
import 'package:flutter/material.dart';

import 'ui/screens/welcome_screen.dart';
 
class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});

  @override
  State<TemperatureApp> createState() {
    return _TemperatureAppState();
  }
}

class _TemperatureAppState extends State<TemperatureApp> {
  bool isStart = false;

  void setStart (){
    setState((){
      isStart = !isStart;
    });
  }
  
  @override
  Widget build(context) {

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff16C062),
                Color(0xff00BCDC),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Builder(
            builder: (BuildContext context){
              if(isStart){
                return TemperatureScreen();
              }
              else{
                return WelcomeScreen(onClick: setStart);
              }
            }
          
          )
        ),
      ),
    );
  }
}

void main() {
  runApp(const TemperatureApp());
}

import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text("Custom buttons")),
      body: Center(
        child: Column(
          children: [
            Btn(),
            SizedBox(height: 10),
            Btn(),
          ],
        )
      ),
    ),
  ),
);

class Btn extends StatefulWidget {

  const Btn({super.key});

  @override
  State<Btn> createState() => _BtnState();
}

class _BtnState extends State<Btn> {
  bool isSelected = false;

  String get textLabel => isSelected? 'Selected' : 'Not Selected';
  Color get textColor => isSelected? Colors.white : Colors.black;
  Color? get backgroundColor => isSelected? Colors.blue[500] : Colors.blue[50];
  
  void select (){
    
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
          width: 400,
          height: 100,
          child: ElevatedButton(
            style:  ElevatedButton.styleFrom(
              backgroundColor: backgroundColor, // Sets the background color of the button
              foregroundColor: textColor, // Sets the color of the text/icon on the button
            ),
            onPressed: select,
            child: Center(child: Text(textLabel)),
          ),
        );
  }
}

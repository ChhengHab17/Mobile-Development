import 'package:flutter/material.dart';

/*
Activity 1
*/

// void main() {

//   runApp(
//     MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text("HELLO")),
//         body: Center(
//           child: Column(
//             children: [
//               Container(
//                 width: 200,
//                 height: 200,
//                 color: Colors.amber,
//                 child: const Center(
//                   child: Text(
//                     'HI',
//                     style: TextStyle(
//                       fontSize: 50,
//                       color: Color.fromARGB(255, 52, 7, 255),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }

/*
Activity 2
*/

void main (){
  runApp(
    MaterialApp(
      home:
        Center(
          child: Column(
            children: [
              GradientBtn(text: 'Hello 1', start: Color(0xff0335f6), end: Color(0xff0335b6)),
              GradientBtn(text: 'Hello 2', start: Color(0xff0335f6), end: Color(0xff0335b6)),
              GradientBtn(text: 'Hello 3', start: Color(0xff0335f6), end: Color(0xff0335b6))
            ],
          ),
        )
      )
  );
}
class GradientBtn extends StatelessWidget {
  final String text;
  final Color start;
  final Color end;
  const GradientBtn({super.key, required this.text, required this.start, required this.end});

  @override
  Widget build(BuildContext context) {
    return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                  colors: [start, end],
                  ),
                  borderRadius: BorderRadius.circular(30)
                ),
                padding: EdgeInsets.all(40),
                margin: EdgeInsets.all(20),
                child: Text(text,
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  decoration: TextDecoration.none
                ),
                ),
              );
  }
}

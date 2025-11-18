import 'package:flutter/material.dart';
enum IconPosition { left, right }
enum ButtonType { primary(Colors.blue), secondary(Colors.green), disabled(Colors.grey);
  final Color color;
  const ButtonType(this.color);
}


void main () {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Custom Button')),
      body: Center(
        child: Column(
          children: [
            CustomButton(
              label: 'Submit',
              icon: Icons.check,
              btnType: ButtonType.primary,
              iconPosition: IconPosition.left,
            ),
            SizedBox(height: 20),
            CustomButton(
              label: 'Time',
              icon: Icons.access_time,
              btnType: ButtonType.secondary,
              iconPosition: IconPosition.right,
            ),
            SizedBox(height: 20),
            CustomButton(
              label: 'Account',
              icon: Icons.account_tree,
              btnType: ButtonType.disabled,
              iconPosition: IconPosition.right,
            ),
          ],
        ),
    ),
  )));
}

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconPosition iconPosition;
  final ButtonType btnType;
  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.btnType = ButtonType.primary,
    this.iconPosition = IconPosition.left,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: btnType.color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: iconPosition == IconPosition.left
              ? [
                  Icon(icon, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    label,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ]
              : [
                  Text(
                    label,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(width: 10),
                  Icon(icon, color: Colors.white),
                ],
        ),
      ),
    );
  }
}
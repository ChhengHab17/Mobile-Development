import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text("Classroom"),
            onTap: () => {
              Navigator.pop(context),
              context.go('/classroom')
              // Navigator.pop(context)
            },
          ),
          ListTile(
            title: Text("Student"),
            onTap: () => {
              Navigator.pop(context),
              context.go('/student')
            },
          ),
          ListTile(title: Text("Profile"), onTap: () => {}),
        ],
      ),
    );
  }
}

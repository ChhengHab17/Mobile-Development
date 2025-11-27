import 'package:first_app/w8/EXERCISE-3/model/profile_tile_model.dart';
import 'package:flutter/material.dart';

import '../theme/theme.dart';

class ProfileApp extends StatelessWidget {
  final ProfileData data;
  const ProfileApp({super.key, required this.data});

  List<ProfileTile> getTileData (){
    var tileData = data.tiles;

    return tileData.map((d) => ProfileTile(icon: d.icon, title: d.title, data: d.value)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary.withAlpha(100),
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          'CADT student Profile',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          children: [
            const SizedBox(height: 40),
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(
                  'assets/w5_ex3/flutter.png'), 
            ),
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  Text(
                    data.name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  Text(
                    data.position,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ...getTileData()
          ],
        ),
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
    required this.data,
  });

  final IconData icon;
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: ListTile(
          leading: Icon(icon, color: AppColors.primary),
          title: Text(title),
          subtitle: Text(data),
        ),
      ),
    );
  }
}

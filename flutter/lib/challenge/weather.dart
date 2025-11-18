import 'package:flutter/material.dart';

enum Season {
  winter(imagePath: 'assets/w7/challenge/winter.jpg'),
  summer(imagePath: 'assets/w7/challenge/summer.jpg'),
  spring(imagePath: 'assets/w7/challenge/spring.jpg'),
  fall(imagePath: 'assets/w7/challenge/fall.jpg');

  final String imagePath;
  const Season({required this.imagePath});
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(body: Center(child: SeasonBox())),
    ),
  );
}

class SeasonCard extends StatefulWidget {
  final String countryName;
  const SeasonCard({super.key, required this.countryName});

  @override
  State<SeasonCard> createState() => _SeasonCardState();
}

class _SeasonCardState extends State<SeasonCard> {
  Season currentSeason = Season.fall;

  void changeSeason() {
    setState(() {
      final season = Season.values;
      final currentIndex = season.indexOf(currentSeason);
      final nextIndex = (currentIndex + 1) % season.length;
      currentSeason = season[nextIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: Colors.grey),
      ),
      child: Column(
        children: [
          Container(
            height: 400,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
            ),
            child: GestureDetector(
              onTap: changeSeason,
              child: Image.asset(currentSeason.imagePath),
            ),
          ),
          Text(widget.countryName),
        ],
      ),
    );
  }
}

class SeasonBox extends StatelessWidget {
  const SeasonBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      height: 500,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Column(
          children: [
            const Text(
              "Seasons",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SeasonCard(countryName: 'Cambodia'),
                SeasonCard(countryName: 'France'),
                SeasonCard(countryName: 'Brazil'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: 
          Align(
            alignment: AlignmentGeometry.centerRight,
            child: Icon(Icons.menu, color: Colors.white)
            ),
          backgroundColor: Colors.lightBlue,
        ),
        body:
        Padding(
          padding: EdgeInsets.only(top: 20, left: 5, right: 5),
          child: ListView(
            children: [
              Whether(
                city: 'Phnom Penh',
                minTemp: 10.0,
                maxTemp: 30.0,
                currentTemp: 12.2,
                weatherImagePath: 'assets/w5_ex4/cloudy.png',
                from: Color(0xFFB57EDC),
                to: Color(0xFF9C6ADE),
              ),
              SizedBox(height: 10),
              Whether(
                city: 'Paris',
                minTemp: 10.0,
                maxTemp: 40.0,
                currentTemp: 18.2,
                weatherImagePath: 'assets/w5_ex4/sunnyCloudy.png',
                from: Color.fromARGB(255, 139, 221, 182),
                to: Color.fromARGB(255, 95, 194, 179),
              ),
              SizedBox(height: 10),
              Whether(
                city: 'Rome',
                minTemp: 10.0,
                maxTemp: 40.0,
                currentTemp: 35.2,
                weatherImagePath: 'assets/w5_ex4/sunny.png',
                from: Color.fromRGBO(255, 99, 146, 1),
                to: Color.fromARGB(255, 229, 61, 165),
              ),
              SizedBox(height: 10),
              Whether(
                city: 'Toulouse',
                minTemp: 10.0,
                maxTemp: 38.0,
                currentTemp: 37.2,
                weatherImagePath: 'assets/w5_ex4/veryCloudy.png',
                from: Color.fromARGB(255, 237, 182, 135),
                to: Color.fromARGB(255, 238, 176, 101),
              ),
              SizedBox(height: 10),
              Whether(
                city: 'London',
                minTemp: 10.0,
                maxTemp: 25.0,
                currentTemp: 15.2,
                weatherImagePath: 'assets/w5_ex4/cloudy.png',
                from: Color.fromARGB(255, 255, 165, 180),
                to: Color.fromARGB(255, 251, 69, 93),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class Whether extends StatelessWidget {
  final String city;
  final double minTemp;
  final double maxTemp;
  final double currentTemp;
  final String weatherImagePath;
  final Color from;
  final Color to;
  const Whether({
    required this.city,
    required this.minTemp,
    required this.maxTemp,
    required this.currentTemp,
    required this.weatherImagePath,
    required this.from,
    required this.to,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      shadowColor: Colors.black,
      elevation: 8.0,
      borderRadius: BorderRadius.circular(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [from, to]),
          ),
          child: Stack(
            clipBehavior: Clip.hardEdge,
            alignment: Alignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(weatherImagePath),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                city,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Opacity(
                                opacity: 0.6,
                                child: Column(
                                  children: [
                                    Text(
                                      'min $minTemp °C',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      'max $maxTemp °C',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '$currentTemp °C',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: -50,
                top: -20,
                child: Container(
                  width: 200,
                  height: 130,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withValues(alpha: 0.2),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

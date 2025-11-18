import 'package:flutter/material.dart';

List<String> images = [
  "assets/w4-s2/bird.jpg",
  "assets/w4-s2/bird2.jpg",
  "assets/w4-s2/insect.jpg",
  "assets/w4-s2/girl.jpg",
  "assets/w4-s2/man.jpg",
];

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false, // Why this line ? Can you explain it ?
      home: ImageSwitching(),
    ));

class ImageSwitching extends StatefulWidget {
  const ImageSwitching({
    super.key,
  });

  @override
  State<ImageSwitching> createState() => _ImageSwitchingState();
}

class _ImageSwitchingState extends State<ImageSwitching> {
  int imageIndex = 0;

  void nextImage(){
    setState(() {
      if(imageIndex < images.length - 1){
        imageIndex++;
      }
      else{
        imageIndex = 0;
      }
    });
  }
  void preImage(){
    setState(() {
      if(imageIndex > 0){
        imageIndex--;
      }
      else{
        imageIndex = images.length - 1;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: preImage,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: nextImage,
            ),
          ),
        ],
      ),
      body: Image.asset(images[imageIndex]),
    );
  }
}

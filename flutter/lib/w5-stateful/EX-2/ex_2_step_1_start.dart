import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Favorite cards"),
      ),
      body: Column(
        children: [
          FavoriteCard(title: 'Apple', description: 'THis is apple'),
          FavoriteCard(title: 'Orange', description: 'This is Orange'),
          FavoriteCard(title: 'Pine Apple', description: 'This is Pine Apple')
        ],
      ),
    );
  }
}

class FavoriteCard extends StatefulWidget {

  final String title;
  final String description;

  const FavoriteCard({
    super.key,
    required this.title,
    required this.description
  });

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  bool isFavorite = false;

  Color get iconColor => isFavorite? Colors.red : Colors.grey;
  IconData get icon => isFavorite? Icons.favorite : Icons.favorite_outline;

  void selectFav (){
    setState(() {
      isFavorite = !isFavorite;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        // YOUR CODE
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0.5, color: Colors.black)
        )
      ),
      padding: EdgeInsets.fromLTRB(10, 10, 10, 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title),
                SizedBox(height: 10),
                Text(widget.description)
              ],
            ),
          ),
          IconButton(
              onPressed: selectFav,
              icon: Icon(
                icon,
                color: iconColor,
                
              )),
        ],
      ),  
      );
  }
}

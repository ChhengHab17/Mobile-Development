import '../data/joke_data.dart';
import '../model/joke.dart';
import 'package:flutter/material.dart';

Color appColor = Colors.green[300] as Color;

class JokeApp extends StatefulWidget {
  const JokeApp({super.key});

  @override
  State<JokeApp> createState() => _JokeAppState();
}

class _JokeAppState extends State<JokeApp> {
  final List<Joke> jokes = getJoke();
  int favoriteIndex = -1;

  void toggleFavorite(int id) {
    setState(() {
      if (favoriteIndex == id) {
        favoriteIndex = -1;
      } else {
        favoriteIndex = id;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appColor,
        title: const Text("Favorite Jokes"),
      ),
      body: ListView.builder(
        itemCount: jokes.length,
        itemBuilder: (context, index) {
          final curJoke = jokes[index];
          return JokeCard(
            joke: curJoke,
            isFav: curJoke.id == favoriteIndex,
            onFavoriteClick: () => toggleFavorite(curJoke.id),
          );
        },
      ),
    );
  }
}

class JokeCard extends StatelessWidget {
  final Joke joke;
  final bool isFav;
  final VoidCallback onFavoriteClick;

  const JokeCard({
    super.key,
    required this.joke,
    required this.isFav,
    required this.onFavoriteClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: .5, color: Colors.grey)),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  joke.title,
                  style: TextStyle(
                    color: appColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(joke.description),
              ],
            ),
          ),
          IconButton(
            onPressed: onFavoriteClick,
            icon: Icon(
              isFav ? Icons.favorite : Icons.favorite_border,
              color: isFav ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

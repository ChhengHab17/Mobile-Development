import '../model/joke.dart';

List<Joke> getJoke() {
  return List.generate(
    25,
    (index) =>
        Joke(id: index, title: "joke ${index + 1}", description: "funny joke ${index + 1}"),
  );
}
class Joke {
  final int id;
  final String title;
  final String description;

  Joke({required this.id, required this.description, required this.title});
}

List<Joke> getJoke() {
  return List.generate(
    25,
    (index) =>
        Joke(id: index, title: "joke ${index + 1}", description: "funny joke ${index + 1}"),
  );
}

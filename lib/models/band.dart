class Band {
  String id;
  String name;
  int votes;
  Band({this.id, this.name, this.votes});

  factory Band.fromMap(Map<String, dynamic> obj) => Band(
        id: obj['id'].toString(),
        name: obj['name'].toString(),
        votes: obj['votes'] as int,
      );
}

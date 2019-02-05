class Speaker {
  int id;
  String name;
  String email;

  Speaker(int id, String name, String email) {
    this.id = id;
    this.name = name;
    this.email = email;
  }

  Speaker.fromJson(Map json)
      : id = int.parse(json['comment_ID']),
        name = json['comment_author'],
        email = json['comment_author_email'];

  Map toJson() {
    return {'comment_ID': id, 'comment_author': name, 'comment_author_email': email};
  }
}
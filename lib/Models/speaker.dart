class Speaker {
  int id;
  String name;
  String photoURL;

  Speaker(int id, String name, String photoURL) {
    this.id = id;
    this.name = name;
    this.photoURL = photoURL;
  }

  Speaker.fromJson(Map json)
      : id = int.parse(json['ID']),
        name = json['post_title'],
        photoURL = "https://icmsbg.org/wp-content/uploads/" + json['meta_value'];

  Map toJson() {
    return {'ID': id, 'post_title': name, 'meta_value': photoURL};
  }
}
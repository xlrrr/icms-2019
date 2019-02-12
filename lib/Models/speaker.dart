class Speaker {
  int id;
  String name;
  String photoURL;
  String postContent;

  Speaker(int id, String name, String photoURL, String postContent) {
    this.id = id;
    this.name = name;
    this.photoURL = photoURL;
    this.postContent = postContent;
  }

  Speaker.fromJson(Map json)
      : id = int.parse(json['ID']),
        name = json['post_title'],
        photoURL = "https://icmsbg.org/wp-content/uploads/" + json['meta_value'],
        postContent = json['post_content'].replaceAll(new RegExp(r'\[(.*?)\]|(\<(.*?)\>)'), '');

  Map toJson() {
    return {'ID': id, 'post_title': name, 'meta_value': photoURL, 'post_content': postContent};
  }
}
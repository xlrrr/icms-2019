class NewsEntry {
  int id;
  String title;
  String photoURL;
  String postContent;

  NewsEntry(int id, String title, String photoURL, String postContent) {
    this.id = id;
    this.title = title;
    this.photoURL = photoURL;
    this.postContent = postContent;
  }

  NewsEntry.fromJson(Map json)
      : id = int.parse(json['ID']),
        title = json['Title'],
        photoURL = json['PhotoURL'],
        postContent = json['Content'];

  Map toJson() {
    return {'ID': id, 'Title': title, 'PhotoURL': photoURL, 'Content': postContent};
  }
}
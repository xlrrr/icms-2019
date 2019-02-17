class Workshop {
  String title;
  String photoURL;
  String place;
  String time;

  Workshop(String postContent, String photoURL, String place, String time) {
    this.title = postContent;
    this.photoURL = photoURL;
    this.place = place;
    this.time = time;
  }

  Workshop.fromJson(Map json)
      : title = json['title'],
        photoURL = "https://icmsbg.org/wp-content/uploads/" + json['photoURL'],
        place = json['place'],
        time = json['time'];

  Map toJson() {
    return {'title': title, 'photoURL':photoURL , 'place':place , 'time':time};
  }
}
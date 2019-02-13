class Competition {
  String postContent;

  Competition(String postContent) {
    this.postContent = postContent;
  }

  Competition.fromJson(Map json)
      : postContent = json['post_content'].replaceAll(new RegExp(r'\[(.*?)\]|(\<(.*?)\>)'), '');

  Map toJson() {
    return {'post_content': postContent};
  }
}
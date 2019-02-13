class Workshop {
  String postContent;

  Workshop(String postContent) {
    this.postContent = postContent;
  }

  Workshop.fromJson(Map json)
      : postContent = json['post_content'].replaceAll(new RegExp(r'\[(.*?)\]|(\<(.*?)\>)'), '');

  Map toJson() {
    return {'post_content': postContent};
  }
}
class ScheduleEntry {
  int id;
  String name;
  String time;
  String day;
  String daySlug;

  ScheduleEntry(int id, String name, String time, String day, String daySlug) {
    this.id = id;
    this.name = name;
    this.time = time;
    this.day = day;
    this.daySlug = daySlug;
  }

  ScheduleEntry.fromJson(Map json)
      : id = int.parse(json['ID']),
        name = json['post_title'],
        time = json['meta_value'],
        day = json['day'],
        daySlug = json['slug'];

  Map toJson() {
    return {'ID': id, 'post_title': name, 'meta_value': time, 'day': day, 'slug':daySlug};
  }
}
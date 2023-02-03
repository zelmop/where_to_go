class Friend {
  String id;
  String avatar;
  double? lat;
  double? lng;
  String name;
  String nick;
  List<String> preferences;

  Friend({
    required this.id,
    required this.avatar,
    required this.name,
    required this.nick,
    required this.preferences,
    this.lat,
    this.lng
  });
}
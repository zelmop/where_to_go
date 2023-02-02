class Friend {
  String avatar;
  double? lat;
  double? lng;
  String name;
  String nick;
  List<String> preferences;

  Friend({
    required this.avatar,
    required this.name,
    required this.nick,
    required this.preferences,
    this.lat,
    this.lng
  });
}
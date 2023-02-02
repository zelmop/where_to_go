class Friend {
  String avatar;
  double? lat;
  double? lng;
  String name;
  String nick;
  List<String> query;

  Friend({
    required this.avatar,
    required this.name,
    required this.nick,
    required this.query,
    this.lat,
    this.lng
  });
}
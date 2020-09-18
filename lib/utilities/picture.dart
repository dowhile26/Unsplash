class Picture {
  final String username;
  final String description;
  final String imageURL;

  Picture({this.username, this.description, this.imageURL});

  factory Picture.fromJson(Map json) {
    return Picture(
      username: json['user']['name'],
      description: json['alt_description'],
      imageURL: json['urls']['regular'],
    );
  }
}
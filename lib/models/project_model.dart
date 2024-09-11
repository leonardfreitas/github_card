class Project {
  int id;
  String name;
  String fullName;
  String userImage;

  Project({
    required this.id,
    required this.name,
    required this.fullName,
    required this.userImage,
  });

  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      id: map['id'],
      name: map['name'],
      fullName: map['full_name'],
      userImage: map['owner']['avatar_url'],
    );
  }
}

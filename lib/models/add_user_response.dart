class AddUserResponse {
  final String name;
  final String job;
  final String id;
  final String createdAt;

  AddUserResponse({
    required this.name,
    required this.job,
    required this.id,
    required this.createdAt,
  });

  factory AddUserResponse.fromJson(Map<String, dynamic> json) {
    return AddUserResponse(
      name: json['name'],
      job: json['job'],
      id: json['id'],
      createdAt: json['createdAt'],
    );
  }
}

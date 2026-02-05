class UserEntity {
  final int id;
  String? name;
  String? phone;
  String? email;
  String? image;
  int? LastReadNotification;
  num wallet;
  String? token;

  UserEntity({
    required this.id,
    required this.phone,
    required this.email,
    required this.image,
    required this.name,
    required this.wallet,
    this.LastReadNotification,
    required this.token,
  });
}

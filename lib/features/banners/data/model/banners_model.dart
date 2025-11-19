import '../../domain/entities/banner_entity.dart';

class BannersModel extends BannersEntity {
  const BannersModel({
    required super.id,
    required super.image,
    required super.link,
  });

  factory BannersModel.fromJson(Map<String, dynamic> data) {
    return BannersModel(
      id: data['id'],
      image: data['image'],
      link: data['link'],
    );
  }
}

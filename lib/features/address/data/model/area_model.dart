import '../../domain/entities/area_entity.dart';

class AreaModel extends AreaEntity {
  AreaModel({
    required super.id,
    required super.name,
    required super.cityId,
    required super.partNumber,
  });

  factory AreaModel.fromJson(Map data) {
    return AreaModel(
      id: data['id'],
      name: data['name'],
      cityId: data['city_id'],
      partNumber: data['block_number'],
    );
  }
}

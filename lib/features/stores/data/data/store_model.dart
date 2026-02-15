import 'package:flouka/features/stores/domain/entity/store_entity.dart';

class StoreModel extends StoreEntity {
  StoreModel({required super.id, required super.name, required super.image});

  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(id: json['id'], name: json['name'], image: json['image']);
  }
}

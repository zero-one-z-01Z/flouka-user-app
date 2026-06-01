import '../../../../core/helper_function/convert.dart';
import '../../domain/entities/address_entity.dart';
import 'area_model.dart';

class AddressModel extends AddressEntity {
  AddressModel({
    required super.id,
    required super.userId,
    required super.areaEntity,
    required super.areaId,
    required super.isDefault,
    required super.addressName,
    required super.lat,
    required super.lng,
    required super.createdAt,
    required super.phone,
    required super.address,
  });

  factory AddressModel.fromJson(Map<String, dynamic> data) {
    final AreaModel? areaModel = data['area'] != null ? AreaModel.fromJson(data['area']) : null;
    return AddressModel(
      id: data['id'],
      userId: data['user_id'],
      areaId: data['area_id'] ?? 0,
      areaEntity: areaModel,
      addressName: data['name'] is String ? data['name'] : '',
      lat: convertDataToDouble(data['lat']),
      isDefault: convertDataToBool(data['default']),
      lng: convertDataToDouble(data['lng']),
      phone: data['phone'],
      address: data['address'],
      createdAt: data['created_at'],
    );
  }
}

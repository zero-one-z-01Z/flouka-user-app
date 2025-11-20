
import 'package:flouka/features/address/data/model/area_model.dart';

import '../../../../../core/helper_function/convert.dart';
import '../../domain/entities/address_entity.dart';

class AddressModel extends AddressEntity {
  const AddressModel({
    required super.id,
    required super.userId,
    required super.areaEntity,
    required super.areaId,
    required super.partNumber,
    required super.addressName,
    required super.streetName,
    required super.lat,
    required super.lng,
    required super.building,
    required super.apartment,
    required super.notes,
    required super.createdAt,
  });

  factory AddressModel.fromJson(Map<String, dynamic> data) {
    final AreaModel? areaModel = data['area'] != null
        ? AreaModel.fromJson(data['area'])
        : null;
    return AddressModel(
      id: data['id'],
      userId: data['user_id'],
      areaId: data['area_id'],
      partNumber: data['block_number'],
      areaEntity: areaModel,
      addressName: data['address_name'],
      streetName: data['street_name'],
      lat: convertDataToDouble(data['lat']),
      lng: convertDataToDouble(data['lng']),
      building: data['building'],
      apartment: data['apartment'],
      notes: data['notes'],
      createdAt: data['created_at'],
    );
  }
}

import '../../../../core/helper_function/convert.dart';
import '../../domain/entities/address_entity.dart';
import 'area_model.dart';

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
      areaId: data['area_id'] ?? 0,
      partNumber: data['block_number'] ?? 0,
      areaEntity: areaModel,
      addressName: data['name'],
      streetName: data['street'],
      lat: convertDataToDouble(data['lat']),
      lng: convertDataToDouble(data['lng']),
      building: data['building'],
      apartment: data['apartment'],
      notes: data['notes'],
      createdAt: data['created_at'],
    );
  }
}
        // {
        //     "id": 3,
        //     "lat": "23.32324230",
        //     "lng": "28.33333000",
        //     "name": "test",
        //     "street": "eee eee 12",
        //     "building": "12",
        //     "apartment": "22",
        //     "notes": "test",
        //     "default": 0,
        //     "area": {
        //         "id": 1,
        //         "city_id": 1,
        //         "name": {
        //             "ar": "مدينة نصر",
        //             "en": "Nasr City"
        //         },
        //         "city": {
        //             "id": 1,
        //             "name": {
        //                 "ar": "القاهرة",
        //                 "en": "Cairo"
        //             },
        //             "deleted_at": null
        //         }
        //     }
        // },
        // {
        //     "id": 2,
        //     "lat": "23.32324230",
        //     "lng": "28.33333000",
        //     "name": "test",
        //     "street": "eee eee 12",
        //     "building": "12",
        //     "apartment": "22",
        //     "notes": "test",
        //     "default": 0,
        //     "area": {
        //         "id": 1,
        //         "city_id": 1,
        //         "name": {
        //             "ar": "مدينة نصر",
        //             "en": "Nasr City"
        //         },
        //         "city": {
        //             "id": 1,
        //             "name": {
        //                 "ar": "القاهرة",
        //                 "en": "Cairo"
        //             },
        //             "deleted_at": null
        //         }
        //     }
        // }
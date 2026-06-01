import 'package:equatable/equatable.dart';

import 'area_entity.dart';

class AddressEntity extends Equatable {
  final int? id;
  final int? userId;
  final int? areaId;
  final String? addressName;
  final String? address;
  final double? lat;
  final double? lng;
  final String? phone;
  final String? createdAt;
  final AreaEntity? areaEntity;
  bool? isDefault;
  AddressEntity({
    required this.id,
    required this.userId,
    required this.areaEntity,
    required this.areaId,
    required this.isDefault,
    required this.addressName,
    required this.lat,
    required this.lng,
    required this.createdAt,
    required this.phone,
    required this.address,
  });

  @override
  List<Object?> get props => [
    id,
    userId,
    areaId,
    addressName,
    areaEntity,
    isDefault,
    lat,
    lng,
    createdAt,
  ];
}

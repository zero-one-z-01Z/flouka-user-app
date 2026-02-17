import 'package:equatable/equatable.dart';

import 'area_entity.dart';

class AddressEntity extends Equatable {
  final int? id;
  final int? userId;
  final int? areaId;
  final int? partNumber;
  final String? addressName;
  final String? streetName;
  final double? lat;
  final double? lng;
  final String? building;
  final String? apartment;
  final String? notes;
  final String? createdAt;
  final AreaEntity? areaEntity;

  const AddressEntity({
    required this.id,
    required this.userId,
    required this.areaEntity,
    required this.areaId,
    required this.partNumber,
    required this.addressName,
    required this.streetName,
    required this.lat,
    required this.lng,
    required this.building,
    required this.apartment,
    required this.notes,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
    id,
    userId,
    areaId,
    partNumber,
    addressName,
    streetName,
    areaEntity,
    lat,
    lng,
    building,
    apartment,
    notes,
    createdAt,
  ];
}

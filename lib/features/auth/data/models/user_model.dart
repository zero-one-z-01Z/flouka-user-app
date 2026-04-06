import 'dart:developer';

import 'package:flouka/core/helper_function/convert.dart';

import '../../../address/data/model/address_model.dart';
import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.phone,
    required super.email,
    required super.token,
    required super.image,
    required super.wallet,
    required super.name,
    required super.LastReadNotification,
    required super.addressEntity
  });

  factory UserModel.fromJson(Map data) {
    try {
      return UserModel(
        id: data['id'],
        phone: data['phone'],
        email: data['email'],
        token: data['token'],
        image: data['image'],
        wallet: convertDataToNum(data['wallet']) ?? 0,
        name: data['name'],
        LastReadNotification: convertStringToInt(data['last_read_notification']),
        addressEntity: data['address'] !=null ? AddressModel.fromJson(data['address']) :null
      );
    } catch (e, line) {
      log(line.toString());
      log(e.toString());
      throw Exception(e);
    }
  }
}

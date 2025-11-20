import 'package:equatable/equatable.dart';

import '../../../../core/constants/app_images.dart';

class OperationEntity extends Equatable {
  final int id;
  final int userId;
  final String price;
  final String operation;
  final String createdAt;
  const OperationEntity({required this.id, required this.userId, required this.price, required this.operation, required this.createdAt});


  String transactionIcon() {
    if (operation == "buy" || operation == "join") {
      return Images.visa;
    } else {
      return Images.wallet;
    }
  }

  @override
  List<Object?> get props => [id, userId, price, operation, createdAt];
}

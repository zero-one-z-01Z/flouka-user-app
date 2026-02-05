import 'package:equatable/equatable.dart';

import '../../../../core/constants/app_images.dart';

class OperationEntity extends Equatable {
  final int id;
  final int userId;
  final String price;
  final String operation;
  final String createdAt;
  const OperationEntity({
    required this.id,
    required this.userId,
    required this.price,
    required this.operation,
    required this.createdAt,
  });

  String transactionIcon() {
    if (operation == "deposited" || operation == "deducted") {
      return AppImages.arrowDown;
    } else {
      return AppImages.arrowUp;
    }
  }

  @override
  List<Object?> get props => [id, userId, price, operation, createdAt];
}

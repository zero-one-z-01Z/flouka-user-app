import '../../../../core/helper_function/convert.dart';
import '../../domain/entities/operation_entity.dart';

class OperationModel extends OperationEntity {
  const OperationModel({required super.id, required super.userId, required super.price, required super.operation, required super.createdAt});

  factory OperationModel.fromJson(Map<String, dynamic> data) {
    return OperationModel(
        id: data['id'],
        userId: data['user_id'],
        price: data['amount'].toString(),
        operation: data['operation'],
        createdAt: convertDateToStringYMD(DateTime.parse(data['created_at']??"${DateTime.now()}")));
  }
}

import '../../../../core/helper_function/convert.dart';
import '../../../products/data/models/product_model.dart';
import '../../domain/entity/order_entity.dart';

class OrderModel extends OrderEntity {
  OrderModel({
    required super.product,
    required super.id,
    required super.createdAt,
    required super.price,
    required super.status,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    DateTime? date;

    if (json.containsKey('date') && json['date'] != null) {
      date = DateTime.parse(json['date']);
    }

    // log(json['items'][0]['product']['name']);

    return OrderModel(
      id: json['id'],
      product: ProductModel.fromJson(json["product"]),
      price: convertDataToNum(json['price']),
      status: OrderStatus.getFromString(json['status']),
      createdAt: json['created_at'],
    );
  }
}
// {
//           "id": 3,
//           "price": "300.00",
//           "status": "pending",
//           "created_at": "يوم الثلاثاء 17 ,5:44 م",
//           "product": {
//               "id": 1,
//               "title": "هدية عيد ميلاد",
//               "description": "test description ar",
//               "price": "300.00",
//               "offer_price": "340.00",
//               "avg_rating": "0.00",
//               "image": "https://floka.devalm.com/uploads/products/712d41e1-36d4-4890-88e9-3fdb34241bb9.png",
//               "is_favorite": false
//           }
//       },
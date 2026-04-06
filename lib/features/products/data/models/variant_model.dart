import 'package:flouka/core/helper_function/convert.dart';
import 'package:flouka/features/products/domain/entity/variant_entity.dart';

class VariantModel extends VariantEntity{
  VariantModel({required super.id, required super.price, required super.offerPrice, required super.sku, required super.combination, required super.stock});


  factory VariantModel.fromJson(Map data){
    List<int> combination = [];
    for(var i in data['combination']){
      combination.add(convertStringToInt(i));
    }
    return VariantModel(id: data['id'], price: convertDataToNum(data['price'])??0, offerPrice: convertDataToNum(data['offer_price']),
        sku: data['sku'], combination: combination,stock: convertStringToInt(data['stock']));
  }

}
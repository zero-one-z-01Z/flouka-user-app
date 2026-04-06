

import 'package:flouka/features/products/domain/entity/variant_entity.dart';
import 'package:flouka/features/products/presentation/providers/products_details_provider.dart';

extension ProductVariantProvider on ProductDetailsProvider{

  void onTap(int index,int id){
    if(!variants.containsKey(index-1)&&index!=0){
      // show error must shose by lvl
      return;
    }
    variants[index] = id;
    variants.removeWhere((key, value) => key > index);
    rebuild();
  }
  bool hide(int index,int id){
    List<VariantEntity> stocks = data!.variants;
    List<int> ids = variants.values.toList();
    if(ids.isNotEmpty){
      return false;
    }
    // ids.removeRange(0, (index + 1).clamp(0, ids.length));
    ids.add(id);
    List<VariantEntity> available = stocks.where((list) {
      final comboSet = list.combination.toSet();
      return list.stock>0&&ids.every((item) => comboSet.contains(item));
    }).toList();
    return available.isEmpty;
  }
  bool isSelected(int index,int id){
    return variants.containsKey(index)&&variants[index]==id;
  }
  VariantEntity? variantEntity(){
    List<VariantEntity> stocks = data!.variants;
    List<int> ids = variants.values.toList();
    List<VariantEntity> matches = stocks.where((item) {
      return item.combination.length == ids.length &&
          item.combination.toSet().containsAll(ids);
    }).toList();
    if(matches.isNotEmpty){
      return matches.first;
    }
    return null;
  }
}
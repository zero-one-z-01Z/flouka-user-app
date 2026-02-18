import 'package:flouka/features/products/data/models/product_model.dart';
import 'package:flouka/features/stories/domain/entity/story_entity.dart';

import '../../../stores/data/data/store_model.dart';

class StoryModel extends StoryEntity {
  StoryModel({
    required super.store,
    required super.product,
    required super.stories,
  });

  factory StoryModel.fromJson(Map<String, dynamic> json) {
    List<StoriesEntity> stories = [];
    if (json['stories'] != null && json['stories'] is List) {
      List<StoriesModel> list = [];
      for (var i in json['stories']) {
        list.add(StoriesModel.fromJson(i));
      }
      stories = list;
    }
    return StoryModel(
      store: StoreModel.fromJson(json['store']),
      product: ProductModel.fromJson(json['product']),
      stories: stories,
    );
  }
}

class StoriesModel extends StoriesEntity {
  StoriesModel({required super.id, required super.path, required super.type});

  factory StoriesModel.fromJson(Map<String, dynamic> json) {
    return StoriesModel(
      id: json['id'],
      path: json['path'],
      type: json['type'],
    );
  }
}

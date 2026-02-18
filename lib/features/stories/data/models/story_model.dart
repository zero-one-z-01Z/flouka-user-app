import 'package:flouka/features/products/data/models/product_model.dart';
import 'package:flouka/features/stories/domain/entity/story_entity.dart';

class StoryModel extends StoryEntity {
  StoryModel({
    required super.id,
    required super.name,
    required super.image,
    required super.stories,
  });

  factory StoryModel.fromJson(Map<String, dynamic> json) {
    return StoryModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      stories: (json['stories'] as List)
          .map((e) => StoriesModel.fromJson(e))
          .toList(),
    );
  }
}

class StoriesModel extends StoriesEntity {
  StoriesModel({
    required super.id,
    required super.path,
    required super.type,
    required super.product,
  });

  factory StoriesModel.fromJson(Map<String, dynamic> json) {
    return StoriesModel(
      id: json['id'],
      path: json['path'],
      type: json['type'],
      product: json['product'] != null
          ? ProductModel.fromJson(json['product'])
          : null,
    );
  }
}

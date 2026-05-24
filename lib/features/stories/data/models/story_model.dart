import 'package:flouka/core/helper_function/convert.dart';
import 'package:flouka/features/products/data/models/product_model.dart';
import 'package:flouka/features/stories/domain/entity/story_entity.dart';

class StoryModel extends StoryEntity {
  StoryModel({
    required super.id,
    required super.name,
    required super.logo,
    required super.stories,
  });

  factory StoryModel.fromJson(Map<String, dynamic> json) {
    return StoryModel(
      id: json['id'],
      name: json['name'],
      logo: json['logo'],
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
    required super.isWatched,
    required super.title,
    required super.productId,
  });

  factory StoriesModel.fromJson(Map<String, dynamic> json) {
    return StoriesModel(
      id: json['id'],
      path: json['image'],
      title: json['title'],
      isWatched: convertDataToBool(json['is_watched']),
      productId: json['product_id'] ?? null,
    );
  }
}

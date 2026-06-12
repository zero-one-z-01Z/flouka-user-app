import '../../../products/domain/entity/product_entity.dart';

class StoryEntity {
  final int id;
  final String name;
  final String logo;
  final List<StoriesEntity> stories;

  StoryEntity({required this.id, required this.name, required this.logo, required this.stories});
}

class StoriesEntity {
  final int id;
  final int? productId;
  final String path;
  final String? title;
  bool isWatched;
  StoriesEntity({
    required this.id,
    required this.path,
    required this.isWatched,
    required this.title,
    required this.productId,
  });
}

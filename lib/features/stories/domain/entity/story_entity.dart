import '../../../products/domain/entity/product_entity.dart';

class StoryEntity {
  final int id;
  final String name;
  final String image;
  final List<StoriesEntity> stories;

  StoryEntity({required this.id, required this.name, required this.image, required this.stories});
}

class StoriesEntity {
  final int id;
  final ProductEntity? product;
  final String path;
  final String type;
  StoriesEntity({
    required this.id,
    required this.path,
    required this.type,
     this.product,
  });
}

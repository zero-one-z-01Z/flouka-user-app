import 'package:flouka/features/stores/domain/entity/store_entity.dart';

import '../../../products/domain/entity/product_entity.dart';

class StoryEntity {
  final StoreEntity store;
  final ProductEntity product;
  final List<StoriesEntity> stories;

  StoryEntity({required this.store, required this.product, required this.stories});
}

class StoriesEntity {
  final int id;
  final String path;
  final String type;
  StoriesEntity({required this.id, required this.path, required this.type});
}

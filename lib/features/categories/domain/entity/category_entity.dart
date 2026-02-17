class CategoryEntity {
  final int id;
  final String name;
  final String image;
  final List<CategoryEntity>? subCategories;

  CategoryEntity({
    required this.id,
    required this.image,
    required this.name,
    required this.subCategories,
  });
}

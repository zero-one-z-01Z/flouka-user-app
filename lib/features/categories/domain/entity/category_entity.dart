class CategoryEntity {
  final int id;
  final String name;
  final String image;
  final List<CategoryEntity>? children;

  CategoryEntity({
    required this.id,
    required this.image,
    required this.name,
    this.children,
  });
}

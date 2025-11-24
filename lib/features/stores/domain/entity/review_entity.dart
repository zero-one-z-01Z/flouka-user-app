class ReviewEntity {
  final int id;
  final String reviewerName;
  final double rating;
  final String comment;
  final DateTime date;
  final String avatarUrl;

  ReviewEntity({
    required this.id,
    required this.reviewerName,
    required this.rating,
    required this.comment,
    required this.date,
    required this.avatarUrl,
  });
}

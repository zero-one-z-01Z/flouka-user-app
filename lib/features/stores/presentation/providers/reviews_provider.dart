import 'package:flutter/material.dart';
import '../../domain/entity/review_entity.dart';

class ReviewsProvider extends ChangeNotifier {
  // Mock data for reviews similar to CategoryProvider
  final List<ReviewEntity> _reviews = [];

  List<ReviewEntity> get reviews => _reviews;

  // Load mock reviews
  Future<void> loadReviews() async {
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 500)); // simulate latency
    _reviews.clear();
    _reviews.addAll([
      ReviewEntity(
        id: 1,
        reviewerName: 'John Doe',
        rating: 4.5,
        comment: 'Great product, highly recommend!',
        date: DateTime.now().subtract(const Duration(days: 10)),
        avatarUrl: 'https://placehold.co/600x400/000000/FFFFFF/png',
      ),
      ReviewEntity(
        id: 2,
        reviewerName: 'Jane Smith',
        rating: 5.0,
        comment: 'Excellent service and quality.',
        date: DateTime.now().subtract(const Duration(days: 30)),
        avatarUrl: 'https://placehold.co/600x400/FFFFFF/000000/png',
      ),
      // Add more mock items as needed
    ]);
    notifyListeners();
  }

  String timeAgo(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);
    if (diff.inDays < 1) return 'Today';
    if (diff.inDays < 7) return '${diff.inDays} days ago';
    if (diff.inDays < 30) return '${(diff.inDays / 7).floor()} weeks ago';
    if (diff.inDays < 365) return '${(diff.inDays / 30).floor()} months ago';
    return '${(diff.inDays / 365).floor()} years ago';
  }

  void clear() {
    _reviews.clear();
    notifyListeners();
  }
}

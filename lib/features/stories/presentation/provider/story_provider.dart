import 'package:flutter/material.dart';
import 'package:story_view/controller/story_controller.dart';
import '../../../../core/dialog/snack_bar.dart';
import '../../domain/entity/story_entity.dart';
import '../../domain/use_case/story_use_case.dart';

class StoryProvider extends ChangeNotifier {
  final StoryUseCase storyUseCase;

  StoryProvider(this.storyUseCase);

  List<StoryEntity>? data;
  final StoryController controller = StoryController();
  void clear() {
    data = null;
    notifyListeners();
  }

  Future getData() async {
    final result = await storyUseCase.getStories();

    result.fold((l) => showToast(l.message ?? "Failed to load stories"), (r) {
      data ??= [];
      data!.addAll(r);
      notifyListeners();
    });
  }
}

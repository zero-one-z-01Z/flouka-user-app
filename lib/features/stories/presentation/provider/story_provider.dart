import 'package:flutter/material.dart';
import '../../../../core/dialog/snack_bar.dart';
import '../../../../core/helper_function/navigation.dart';
import '../../../../core/models/provider_structure_model.dart';
import '../../domain/entity/story_entity.dart';
import '../../domain/use_case/story_use_case.dart';
import '../views/stories_view.dart';

class StoryProvider extends ChangeNotifier
    implements ProviderStructureModel<List<StoryEntity>> {
  final StoryUseCase storyUseCase;

  StoryProvider(this.storyUseCase);

  @override
  List<StoryEntity>? data;

  @override
  Map? inputs;

  ScrollController controller = ScrollController();

  TextEditingController searchController = TextEditingController();

  void clear() {
    data = null;
    inputs = null;

    notifyListeners();
  }

  @override
  Future getData() async {
    final result = await storyUseCase.getStories();

    result.fold((l) => showToast(l.message ?? "Failed to load stories"), (r) {
      data ??= [];
      data!.addAll(r);
      notifyListeners();
    });
  }

  @override
  void goToPage([Map<String, dynamic>? inputs]) {
    refresh();
    navP(const StoriesView());
  }

  @override
  Future refresh() async {
    clear();
    await getData();
  }
}

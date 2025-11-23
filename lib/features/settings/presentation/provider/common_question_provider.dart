import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../../../../../core/dialog/snack_bar.dart';
import '../../../../../core/helper_function/navigation.dart';
import '../../../../../core/models/pagination_class.dart';
import '../../../../../injection_container.dart';
import '../../domain/entities/common_question_entity.dart';
import '../../domain/usecases/settings_usecases.dart';
import '../views/common_question_detail_view.dart';
import '../views/common_questions_view.dart';

class CommonQuestionsProvider extends ChangeNotifier implements PaginationClass {
  void goToCommonQuestionPage() async {
    refresh();
    navP(const CommonQuestionsView());
  }

  void goToCommonQuestionDetailsPage({
    required CommonQuestionEntity commonQuestionEntity,
  }) async {
    navP(CommonQuestionDetailsview(commonQuestionEntity: commonQuestionEntity));
  }

  List<CommonQuestionEntity>? commonQuestionList;
  Future getFaqCategories() async {
    Map<String, dynamic> data = {};
    data['page'] = pageIndex;
    Either<DioException, List<CommonQuestionEntity>> response =
        await SettingsUseCases(sl()).getFaqCategories();
    response.fold(
      (l) {
        showToast(l.message!);
      },
      (r) {
        pageIndex++;
        commonQuestionList ??= [];
        commonQuestionList?.addAll(r);
        if (r.isEmpty) {
          paginationFinished = true;
        }
        notifyListeners();
      },
    );
    paginationStarted = false;
    notifyListeners();
  }

  void clear() {
    commonQuestionList = null;
    paginationStarted = false;
    paginationFinished = false;
    pageIndex = 1;
  }

  Future refresh() async {
    clear();
    notifyListeners();
    await getFaqCategories();
  }

  @override
  int pageIndex = 1;

  @override
  bool paginationFinished = false;

  @override
  bool paginationStarted = false;
  ScrollController controller = ScrollController();
  @override
  void pagination() async {
    controller.addListener(() async {
      if (controller.position.atEdge && controller.position.pixels > 50) {
        if (!paginationFinished &&
            !paginationStarted &&
            commonQuestionList != null &&
            commonQuestionList!.isNotEmpty) {
          paginationStarted = true;
          notifyListeners();
          await getFaqCategories();
        }
      }
    });
  }
}

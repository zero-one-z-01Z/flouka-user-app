import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/helper_function/api.dart';
import '../models/story_model.dart';

class StoryRemoteDataSource {
    final ApiHandel apiHandel;

  StoryRemoteDataSource(this.apiHandel);

  Future<Either<DioException, List<StoryModel>>> getStories() async {
    var response = await apiHandel.get('stories');
    return response.fold((l) => Left(l), (r) {
      List<StoryModel> list = [];
      for (var i in r.data['data']) {
        list.add(StoryModel.fromJson(i));
      }
      return Right(list);
    });
  }
}


// {
//     "data": [
//         {
//             "id": 1,
//             "name": "Mohamed Ayman",
//             "image": "https://floka.devalm.com/images/place_holder/default.png",
//             "stories": [
//                 {
//                     "id": 1,
//                     "path": "https://floka.devalm.com/uploads/stories/e0fc40ae-e398-4ae9-a040-e8eea5cf5d5c.mp4",
//                     "type": "video",
//                     "expires_at": "2026-02-11 22:51:09",
//                     "store": {
//                         "id": 1,
//                         "name": "Mohamed Ayman",
//                         "image": "https://floka.devalm.com/images/place_holder/default.png"
//                     },
//                     "product": {
//                         "id": 1,
//                         "title": "هدية عيد ميلاد",
//                         "description": "test description ar",
//                         "price": "300.00",
//                         "offer_price": "340.00",
//                         "avg_rating": "0.00",
//                         "image": "https://floka.devalm.com/uploads/products/712d41e1-36d4-4890-88e9-3fdb34241bb9.png",
//                         "is_favorite": false
//                     }
//                 }
//             ]
//         }
//     ],
//     "message": "success",
//     "code": 200,
//     "total": 1,
//     "pages_count": 1
// }

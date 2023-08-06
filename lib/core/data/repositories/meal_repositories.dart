
import 'package:dartz/dartz.dart';
import 'package:foodordering/core/data/models/apis/category_model.dart';
import 'package:foodordering/core/data/models/apis/meal_model.dart';
import 'package:foodordering/core/data/models/common_response.dart';
import 'package:foodordering/core/data/network/endpoints/category_endpoints.dart';
import 'package:foodordering/core/data/network/endpoints/meal_endpoints.dart';

import 'package:foodordering/core/data/network/network_config.dart';
import 'package:foodordering/core/enums/request_type.dart';
import 'package:foodordering/core/utilis/network_utilis.dart';

class MealRepositiers {
  Future<Either<String, List<MealModel>>> getAll() async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.GET,
          url: MealEndpoints.getAll,
          headers: NetworkConfig.getHeaders(
            needAuth: false,type: RequestType.GET
          )).then((respons) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(respons);
        if (commonResponse.getstatus) {
          List<MealModel> resultList = [];
          commonResponse.data!.forEach((element) {resultList.add(MealModel.fromJson(element));});

          return Right(resultList);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}

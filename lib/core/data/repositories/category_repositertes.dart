import 'package:dartz/dartz.dart';
import 'package:foodordering/core/data/models/apis/category_model.dart';
import 'package:foodordering/core/data/models/common_response.dart';
import 'package:foodordering/core/data/network/endpoints/category_endpoints.dart';

import 'package:foodordering/core/data/network/network_config.dart';
import 'package:foodordering/core/enums/request_type.dart';
import 'package:foodordering/core/utilis/network_utilis.dart';

class CategoryRepositiers {
  Future<Either<String, List<CategoryModel>>> getAll() async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.GET,
          url: CategoryEndpoints.getAll,
          headers: NetworkConfig.getHeaders(type: RequestType.GET,
            needAuth: false,
          )).then((respons) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(respons);
        if (commonResponse.getstatus) {
          List<CategoryModel> resultList = [];
          commonResponse.data!.forEach((element) {resultList.add(CategoryModel.fromJson(element));});

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

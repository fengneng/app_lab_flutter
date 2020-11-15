import 'package:app_lab_flutter/entity/columns_response.dart';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'client.g.dart';

@RestApi(baseUrl: "https://zhuanlan.zhihu.com/api/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("columns/{name}")
  Future<ColumnsResponse> fetchColumns(
    @Path() String name,
  );
}

final _dio = Dio(BaseOptions(
  connectTimeout: 5000,
  receiveTimeout: 10000,
));

final client = RestClient(_dio);

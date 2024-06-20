import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:network/models/base_model.dart';
import 'package:network/models/error_model.dart';
import 'package:network/network.dart';
import 'package:network/src/api_helpers/dio.dart';

var apiHelperProvider = Provider(
  (ref) => ApiHelper(
    ref.read(dioProvider),
  ),
);

class ApiHelper {
  final Dio _dio;

  ApiHelper(this._dio);

  Future<Either<Exception, T>> postRequest<T extends BaseModel>({
    required String path,
    required CreateModel<T> create,
    CancelToken? cancelToken,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    ProgressCallback? onReceiveProgress,
  }) async {
    var response = await _dio
        .post(
      path,
      data: body,
      options: Options(headers: headers),
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    )
        .catchError((error) {
      return Response(
        requestOptions: RequestOptions(path: ''),
        statusMessage: error.toString(),
        statusCode: 999,
      );
    });
    if (response.statusCode == 999) {
      return Left(
          ApiError(error: "Unknown error occurred, please try again later."));
    }
    try {
      return Right(create().fromJson(response.data));
    } on Exception catch (e) {
      print(
        "Ayush Error ${e.toString()}",
      );
      return Left(e);
    } catch (error) {
      try {
        return Left(
            ApiError(error: ErrorModel.fromJson(response.data).message));
      } catch (error) {
        return Left(
            ApiError(error: "Unknown error occurred, please try again later."));
      }
    }
  }

  Future<Either<Exception, T>> postFormRequest<T extends BaseModel>({
    required String path,
    required CreateModel<T> create,
    CancelToken? cancelToken,
    FormData? body,
    Map<String, dynamic>? headers,
    ProgressCallback? onReceiveProgress,
  }) async {
    var response = await _dio
        .post(
      path,
      data: body,
      options: Options(headers: headers),
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    )
        .catchError((error) {
      return Response(
        requestOptions: RequestOptions(path: ''),
        statusMessage: error.toString(),
        statusCode: 999,
      );
    });
    if (response.statusCode == 999) {
      return Left(
          ApiError(error: "Unknown error occurred, please try again later."));
    }
    try {
      return Right(create().fromJson(response.data));
    } on Exception catch (e) {
      return Left(e);
    } catch (error) {
      try {
        return Left(
            ApiError(error: ErrorModel.fromJson(response.data).message));
      } catch (error) {
        return Left(
            ApiError(error: "Unknown error occurred, please try again later."));
      }
    }
  }


  Future<Either<Exception, List<T>>> getListRequest<T extends BaseModel>({
    required String path,
    required CreateModel<T> create,
    CancelToken? cancelToken,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      Response response = await _dio.get(
        path,
        queryParameters: params,
        options: Options(headers: headers),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      if (response.statusCode == 200) {
        if (response.data['data'] is List) {
          List<dynamic> dataList = response.data['data'];
          List<T> modelList = dataList
              .map<T>((data) => create().fromJson(data))
              .toList();
          return Right(modelList);
        } else {
          return Left(ApiError(error: "Response data is not a list"));
        }
      } else {
        return Left(ApiError(error: "Failed to fetch data. Status code: ${response.statusCode}"));
      }
    } on DioError catch (e) {
      return Left(ApiError(error: e.message));
    } catch (e) {
      return Left(ApiError(error: "Unknown error occurred, please try again later."));
    }
  }


  Future<Either<Exception, T>> getRequest<T extends BaseModel>({
    required String path,
    required CreateModel<T> create,
    CancelToken? cancelToken,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
    ProgressCallback? onReceiveProgress,
  }) async {
    var response = await _dio.get(
      path,
      queryParameters: params,
      options: Options(headers: headers),
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
    try {
      return Right(create().fromJson(response.data));
    } on Exception catch (e) {
      return Left(e);
    } catch (error) {
      try {
        return Left(
            ApiError(error: ErrorModel.fromJson(response.data).message));
      } catch (error) {
        return Left(
            ApiError(error: "Unknown error occurred, please try again later."));
      }
    }
  }

  Future<Either<Exception, List<int>>> getByteArray({
    required String path,
    CancelToken? cancelToken,
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
    ProgressCallback? onReceiveProgress,
  }) async {
    var response = await Dio().post<List<int>>(
      path,
      data: body,
      options: Options(responseType: ResponseType.bytes),
    );
    try {
      if (response.data != null && response.data is List<int>) {
        return Right(response.data!);
      } else {
        return Left(ApiError(error: "Response is not list type"));
      }
    } on Exception catch (e) {
      return Left(e);
    } catch (error) {
      return Left(
          ApiError(error: "Unknown error occurred, please try again later."));
    }
  }
}

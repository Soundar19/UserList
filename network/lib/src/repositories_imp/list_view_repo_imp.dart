import 'package:dartz/dartz.dart';
import 'package:network/models/user_view_response.dart';

import 'package:network/repositories/list_view_repository.dart';
import 'package:network/src/api_helpers/api_helper.dart';

import '../../models/list_view_params.dart';
import '../../models/list_view_response.dart';

class ListViewRepoImp implements ListViewRepository {
  final ApiHelper apiHelper;

  ListViewRepoImp(this.apiHelper);

  @override
  Future<Either<Exception, List<User>>> getList() async {
    return apiHelper.getListRequest(
      path: '?page={page_number}', // Adjust path according to your API endpoint
      create: () => User(),
    );
  }

  @override
  Future<Either<Exception, UserView>> getUser({required int userId}) async {
    return apiHelper.getRequest(
      path: "/$userId",
      create: () => UserView(),
    );
  }
}

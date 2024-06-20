import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:network/models/list_view_params.dart';
import 'package:network/models/list_view_response.dart';
import 'package:network/models/user_view_response.dart';

import 'package:network/src/api_helpers/api_helper.dart';
import 'package:network/src/repositories_imp/list_view_repo_imp.dart';


var listViewRepositoryProvider =
    Provider((ref) => ListViewRepoImp(ref.read(apiHelperProvider)));

abstract class ListViewRepository {
  Future<Either<Exception, List<User>>> getList();
  Future<Either<Exception, UserView>> getUser({
  required int userId
});
}



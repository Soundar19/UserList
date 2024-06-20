import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:network/models/list_view_params.dart';
import 'package:network/repositories/list_view_repository.dart';
import 'package:untitled/list_view/list_view_state.dart';

// class UserNotifier extends StateNotifier<UserState> {
//   final ListViewRepoImp listViewRepoImp;
//   UserNotifier() : super(UserState.empty());
var listControllerProvider =
StateNotifierProvider<UserController, UserState>((ref) =>
    UserController(
        ref.read(listViewRepositoryProvider)));

class UserController extends StateNotifier<UserState> {
  final ListViewRepository listRepository;

  UserController(this.listRepository) : super(UserState.empty()) {
      fetchUsers();
  }
  Future<void> fetchUsers() async {

    state = state.copyWith(isLoading: true);
    listRepository.getList().then((value) => value.fold(
          (l) => state = state.copyWith(
            isLoading: false,
            errorMessage: l.toString(),
          ),
          (r) {
            if (r.isEmpty) {
              state = state.reset(isLoading: false);
            } else {
              state = state.copyWith(
                isLoading: false,
                isSuccess: false,
                userList: r,
              );
            }
          },
        ));
  }

  void reset() {
    state = UserState.empty();
  }
}

// final userProvider = StateNotifierProvider<UserNotifier, UserState>((ref) {
//   return UserNotifier();
// });

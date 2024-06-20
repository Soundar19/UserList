import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/models/list_view_params.dart';
import 'package:network/repositories/list_view_repository.dart';
import 'package:untitled/user_view/user_view_state.dart';

var userControllerProvider =
    StateNotifierProvider.autoDispose.family<UserController, UserState, int>(
  (ref, id) => UserController(
      ref.read(
        listViewRepositoryProvider,
      ),
      id),
);



class UserController extends StateNotifier<UserState> {
  final ListViewRepository listRepository;
  final int id;

  UserController(this.listRepository, this.id) : super(UserState.initial()) {
    fetchUser();
  }

  Future<void> fetchUser() async {
    try {
      state = state.copyWith(isLoading: true, errorMessage: null);
      final result = await listRepository.getUser(userId: id);
      result.fold(
        (l) => state = state.copyWith(
            isLoading: false, isSuccess: false, errorMessage: l.toString()),
        (r) => state =
            state.copyWith(isLoading: false, isSuccess: true, user: r.data),
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }
}

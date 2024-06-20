import 'package:network/models/list_view_response.dart';

class UserState {
  final bool isSuccess;
  final bool isLoading;
  final String? errorMessage;
  final List<User>? userList;

  UserState({
    required this.isSuccess,
    required this.isLoading,
    this.errorMessage,
    this.userList,
  });

  factory UserState.empty() {
    return UserState(
      isSuccess: false,
      isLoading: false,
    );
  }

  UserState copyWith({
    bool? isSuccess,
    bool? isLoading,
    String? errorMessage,
    List<User>? userList,
  }) {
    return UserState(
      isSuccess: isSuccess ?? this.isSuccess,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      userList: userList ?? this.userList,
    );
  }

  UserState reset({
    bool? isSuccess,
    bool? isLoading,
    String? errorMessage,
  }) {
    return UserState(
      isSuccess: isSuccess ?? this.isSuccess,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? '',
    );
  }
}

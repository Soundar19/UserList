import 'package:flutter/foundation.dart';
import 'package:network/models/list_view_response.dart';
import 'package:network/models/user_view_response.dart';

class UserState {
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;
  final Data? user;

  UserState({
    required this.isLoading,
    required this.isSuccess,
    this.errorMessage,
    this.user,
  });

  factory UserState.initial() {
    return UserState(
      isLoading: false,
      isSuccess: false,
    );
  }

  UserState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
    Data? user,
  }) {
    return UserState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage ?? this.errorMessage,
      user: user ?? this.user,
    );
  }
}

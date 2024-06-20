import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:network/models/user_view_response.dart';
import 'package:untitled/user_view/user_view_controller.dart';

class UserViewWidget extends HookConsumerWidget {
  final int id;

  const UserViewWidget({required this.id, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(userControllerProvider(id));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${state.user?.firstName ?? ""} ${state.user?.lastName ?? ""}',
          style: TextStyle(
            fontFamily: 'SF Pro Text',
            fontWeight: FontWeight.w700,
            color: Colors.black54,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFF98866), Color(0xFFF7C5CC)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        child: state.isLoading
            ? Center(child: CircularProgressIndicator())
            : state.errorMessage != null
                ? Center(child: Text('Error: ${state.errorMessage}'))
                : state.isSuccess
                    ? _buildUserDetails(state.user!)
                    : Center(child: Text('No user data')),
      ),
    );
  }

  Widget _buildUserDetails(Data user) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(user.avatar ?? ""),
            backgroundColor: Colors.orangeAccent,
          ),
          SizedBox(height: 16),
          AnimatedTextKit(
            animatedTexts: [
              TyperAnimatedText(
                '${user.firstName} ${user.lastName}',
                speed: const Duration(milliseconds: 50),
                textStyle: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
            isRepeatingAnimation: true,
          ),
          SizedBox(height: 8),
          Text(
            user.email ?? "",
            style: TextStyle(
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.email, color: Colors.white),
            label: Text('Send Email'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orangeAccent,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

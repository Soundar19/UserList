import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routing/routing.dart';
import 'package:untitled/app_routes.dart';
import 'package:untitled/list_view/list_controller.dart';

class UserListView extends HookConsumerWidget {
  const UserListView({Key? key}) : super(key: key);
  static const routeName = 'user_list';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(listControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Hello,',
            style: TextStyle(
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w700,
                color: Colors.black54)),
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
      body: state.isLoading
          ? Center(child: CircularProgressIndicator())
          : state.errorMessage != null
              ? Center(child: Text('Error: ${state.errorMessage}'))
              : ListView.builder(
                  itemCount: state.userList?.length ?? 0,
                  itemBuilder: (context, index) {
                    final user = state.userList![index];
                    return GestureDetector(
                      onTap: () {
                        ref.read(routeUtilProvider).pushNamed(
                          AppRoutes.userView.routeName,
                          params: <String, String>{
                            'id': user.id.toString(),
                          },
                        );
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        margin:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black54,
                              blurRadius: 10,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Hero(
                              tag: 'userAvatar${user.id}',
                              child: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(user.avatar ?? ""),
                                radius: 30,
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${user.firstName} ${user.lastName}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    user.email ?? "",
                                    style: TextStyle(
                                      fontFamily: 'SF Pro Display',
                                      fontWeight: FontWeight.w700,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios, color: Colors.orange),
                          ],
                        ),
                      ),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(listControllerProvider.notifier).fetchUsers(),
        backgroundColor: Color(0xFFF98866),
        child: Icon(Icons.refresh, color: Colors.black),
      ),
      backgroundColor: Color(0xFFFFF2D7),
    );
  }
}

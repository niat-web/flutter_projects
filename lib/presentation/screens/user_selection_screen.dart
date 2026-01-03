import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'chat_screen.dart';
import '../bloc/chat_bloc.dart';

import '../../data/repositories/chat_repository_impl.dart';
import '../../data/datasources/remote_chat_datasource.dart';
import '../../core/connectivity/connectivity_service.dart';

class UserSelectionScreen extends StatelessWidget {
  const UserSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text("Login as User A"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BlocProvider(
                      create: (_) => ChatBloc(
                        ChatRepositoryImpl(
                          RemoteChatDataSource(),
                          ConnectivityService(),
                        ),
                        "user_1",
                        "user_2",
                      ),
                      child: const ChatScreen("user_1", "user_2"),
                    ),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: const Text("Login as User B"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BlocProvider(
                      create: (_) => ChatBloc(
                        ChatRepositoryImpl(
                          RemoteChatDataSource(),
                          ConnectivityService(),
                        ),
                        "user_2",
                        "user_1",
                      ),
                      child: const ChatScreen("user_2", "user_1"),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

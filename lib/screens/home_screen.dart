import 'package:flutter/material.dart';
import 'package:sqflite_flutter/models/user_model.dart';
import 'package:sqflite_flutter/service/user_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future<List<UserModel>> getUsersData() async {
      return await UserService().getUser();
    }

    return Scaffold(
      appBar: AppBar(title: Text("HomeScreen")),
      body: FutureBuilder<List<UserModel>>(
        future: getUsersData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final users = snapshot.data!;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                title: Text(user.username),
                subtitle: Text("${user.email} && ${user.password}"),
              );
            },
          );
        },
      ),
    );
  }
}

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite_flutter/models/user_model.dart';

class UserService {
  static final UserService _instance = UserService._internal();
  factory UserService() => _instance;
  UserService._internal();

  static Database? db;

  Future<Database> get database async {
    if (db != null) return db!;
    db = await initDB();
    return db!;
  }

  Future<Database> initDB() async {
    final path = join(await getDatabasesPath(), 'user.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
            CREATE TABLE users(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            email TEXT,
            password TEXT,
            username TEXT
            )
            ''');
      },
    );
  }

  Future<int> insertUser(UserModel user) async {
    final db = await database;
    return await db.insert('users', user.toMap());
  }

  Future<List<UserModel>> getUser() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query("users");
    return List.generate(maps.length, (i) => UserModel.fromMap(maps[i]));
  }


}

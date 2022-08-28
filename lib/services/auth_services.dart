import 'package:authentication/model/user_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

class DBHelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db!;
    }

    _db = await initDatabase();
    return _db;
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'auth.db');
    var db = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE Auth (email VARCHAR UNIQUE, password VARCHAR)',
    );
  }

  Future<User> insert(User user) async {
    var dbClient = await db;
    try {
      await dbClient!.insert('auth', user.toMap());
    } catch (error) {
      print(error);
    }
    return user;
  }
  
  Future<bool> isEmailExist(String email, String password) async {
    var dbClient = await db;
    final List<Map<String, Object?>> queryResult =
        await dbClient!.query('auth');
    var allUsers = queryResult.map((e) => User.fromMap(e)).toList();
    for(var userInfo in allUsers){
      print("Hello *******************");
      print("EMAIL :${userInfo.email}");
      print("Password :${userInfo.password}");
      if(email == userInfo.email && password == userInfo.password){
        return true;
      }
    }
    return false;
  }

  
}

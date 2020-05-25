import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper {
  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;

    _db = await initDb();

    return _db;
  }

  //Creating a database with name test.dn in your directory
  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "bazar.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  // Creating a table name Employee with fields
  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute("CREATE TABLE PersonaID(id INTEGER PRIMARY KEY, uid TEXT)");
    print("Created tables");
  }

  // Retrieving employees from Employee Tables
  Future getPersonUID() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM PersonaID');
    return (list[0]["uid"]).toString();
  }

  void deletePersonUID() async {
    var dbClient = await db;
    var res = await dbClient.rawQuery('DELETE FROM PersonaID');
    print(res);
  }

  void savePersonaID(String uid) async {
    var dbClient = await db;
    await dbClient.transaction((txn) async {
      var query = "INSERT INTO PersonaID (uid) VALUES ('$uid')";
      return await txn.rawInsert(query);
    });
  }
}

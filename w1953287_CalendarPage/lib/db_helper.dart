import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:to_do/appointments.dart';

class DBHelper{
  static Database? _db;
  static final int _version = 1;
  static final String _tableName = "Appointments";
  static Future<void> initDb() async {
    if(_db != null) {
      return;
    }
    try {
      String _path = await getDatabasesPath() +  "appointments.db";
      _db = await openDatabase(
        _path,
        version: _version,
        onCreate: (db, version) {
          print("Creating a new one");
          return db.execute(
            "CREATE TABLE $_tableName("
            "id InTEGER PRIMARY KEY AUTOINCREMENT, "
            "title STRING, note TEXT, date STRING, "
            "startTime STRING, endTAime STRING, "
            "remind INTEGER, repeat STRING, "
            "COLOR INTEGER, "
            "isCompleted INTEGER)" ,

          );

        },
      );
    } catch (e){
    print(e);
  }
}
static Future<int> insert(Appointment? appointment) async {
  print("insert function called");
  return await _db?.insert(_tableName, appointment!.toJson())??1;
}
static Future<List<Map<String, dynamic>>> query() async{
  print("query function called");
  return await _db!.query(_tableName);
}
static delete(Appointment appointment) async{
return await _db!.delete(_tableName, where:'id=?', whereArgs: [appointment.id]);
}
static update(int id) async{
 return await _db!.rawUpdate('''
UPDATE appointments
SET isCompleted = ?
WHERE id =?
  ''', [1, id]);
}
}
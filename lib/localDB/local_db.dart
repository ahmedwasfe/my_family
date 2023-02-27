
import 'package:my_family/localDB/model/save_entertainments.dart';
import 'package:my_family/localDB/model/save_study.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class LocalDB {
  static final LocalDB instance = LocalDB._init();

  static Database? _database;

  LocalDB._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('localData.db');
    return _database!;
  }

  // TODO Init DATABASE
  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _onCreateDB);
  }

  // TODO Create Database
  Future _onCreateDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';
    final doubleType = 'DOUBLE NOT NULL';

    // TODO Entertainments TABLE
    await db.execute('''
    CREATE TABLE $tableEntertainment (
    ${EntertainmentsFields.id} $idType,
    ${EntertainmentsFields.title} $textType)
    ''');

    // TODO Can add anoth table here

    // TODO Entertainments TABLE
    await db.execute('''
    CREATE TABLE $tableStudy (
    ${StudyFields.id} $idType,
    ${StudyFields.title} $textType)
    ''');


  }

  // TODO Entertainments ----------------------------------------
  // TODO Insert to database
  /* TODO Other way to insert to data base
    final columns =
     '${NoteFields.title}, ${NoteFields.description}, ${NoteFields.time}';
    final values =
     '${json[NoteFields.title]}, ${json[NoteFields.description]}, ${json[NoteFields.time]}';
    final id = await db
     .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');
  */
  Future<SaveEntertainments> saveEntertainments(SaveEntertainments entertainments) async {
    final db = await instance.database;
    final id = await db.insert(tableEntertainment, entertainments.toJson());
    return entertainments.copy(id: id);
  }

  // TODO Read Single File
  Future<SaveEntertainments> getSingleEntertainment(int id) async {
    final db = await instance.database;
    final maps = await db.query(tableEntertainment,
        columns: EntertainmentsFields.values,
        where: '${EntertainmentsFields.id} = ?',
        whereArgs: [id]);

    if (maps.isNotEmpty) {
      return SaveEntertainments.fromJson(maps.first);
    } else {
      throw Exception('ID $id is not exist');
    }
  }

  // TODO Read All Files
  /* TODO Other way to read all files from database
  *  final result =
      await db.rawQuery('SELECT * FROM tableFiles ORDER BY $orderBy');
  *
  */
  Future<List<SaveEntertainments>> readAllEntertainments() async {
    final db = await instance.database;

    const orderBy = 'ASC';
    final result = await db.query(tableEntertainment);

    return result.map((json) => SaveEntertainments.fromJson(json)).toList();
  }

  // TODO Update file in database
  Future<int> updateEntertainment(SaveEntertainments entertainments) async {
    final db = await instance.database;

    return db.update(tableEntertainment, entertainments.toJson(),
        where: '${EntertainmentsFields.id} = ?', whereArgs: [entertainments.id]);
  }

  // TODO Delete file from database
  Future<int> deleteEntertainment(int id) async {
    final db = await instance.database;

    return await db
        .delete(tableEntertainment, where: '${EntertainmentsFields.id} = ?', whereArgs: [id]);
  }

  // TODO Delete all file from database
  Future<int> clearEntertainment() async {
    final db = await instance.database;

    return await db.rawDelete('DELETE FROM $tableEntertainment');
  }


  // TODO STUDY ----------------------------------------
  // TODO Insert to database
  /* TODO Other way to insert to data base
    final columns =
     '${NoteFields.title}, ${NoteFields.description}, ${NoteFields.time}';
    final values =
     '${json[NoteFields.title]}, ${json[NoteFields.description]}, ${json[NoteFields.time]}';
    final id = await db
     .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');
  */
  Future<SaveStudy> saveStudy(SaveStudy study) async {
    final db = await instance.database;
    final id = await db.insert(tableStudy, study.toJson());
    return study.copy(id: id);
  }

  // TODO Read Single File
  Future<SaveStudy> getSingleStudy(int id) async {
    final db = await instance.database;
    final maps = await db.query(tableStudy,
        columns: StudyFields.values,
        where: '${StudyFields.id} = ?', whereArgs: [id]);

    if (maps.isNotEmpty) {
      return SaveStudy.fromJson(maps.first);
    } else {
      throw Exception('ID $id is not exist');
    }
  }

  // TODO Read All Files
  /* TODO Other way to read all files from database
  *  final result =
      await db.rawQuery('SELECT * FROM tableFiles ORDER BY $orderBy');
  *
  */
  Future<List<SaveStudy>> readAllStudy() async {
    final db = await instance.database;

    final orderBy = 'ASC';
    final result = await db.query(tableStudy, orderBy: orderBy);

    return result.map((json) => SaveStudy.fromJson(json)).toList();
  }

  // TODO Update file in database
  Future<int> updateStudy(SaveStudy study) async {
    final db = await instance.database;

    return db.update(tableStudy, study.toJson(),
        where: '${StudyFields.id} = ?', whereArgs: [study.id]);
  }

  // TODO Delete file from database
  Future<int> deleteStudy(int id) async {
    final db = await instance.database;

    return await db
        .delete(tableStudy, where: '${StudyFields.id} = ?', whereArgs: [id]);
  }

  // TODO Delete all file from database
  Future<int> clearStudy() async {
    final db = await instance.database;

    return await db.rawDelete('DELETE FROM $tableStudy');
  }


  Future close() async {
    final db = await instance.database;
    db.close();
  }
}

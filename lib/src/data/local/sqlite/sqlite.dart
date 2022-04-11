// ignore_for_file: prefer_constructors_over_static_methods

import 'package:flutter/services.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SQLite {
  const SQLite._();

  static Database? _database;

  static SQLite? _instance;

  /// Return a singleton SQLite instance.
  static SQLite get instance {
    return _instance ??= const SQLite._();
  }

  /// Close the current database.
  Future<void> close() async {
    await _database?.close();
    _database = null;
  }

  /// Return a database instance.
  Future<Database> get database async {
    return _database ??= await openDatabase(
      join(await getDatabasesPath(), 'localdata.db'),
      onConfigure: (db) {
        return db.execute('PRAGMA foreign_keys = ON');
      },
      onCreate: (db, version) async {
        final String script = await rootBundle.loadString(
          'assets/db/create.sql',
        );
        final Batch batch = db.batch();
        script.split(';').forEach((element) {
          if (element.isNotEmpty) batch.execute(element.trim());
        });
        await batch.commit(noResult: true);
      },
      version: 1,
    );
  }
}

import 'dart:io';

import 'package:autorefresh/model/site_model.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart' as paths;

 

part 'moor_curd.g.dart';

@UseMoor(
  tables: [Sites],
)
class AppDatabase extends _$AppDatabase {
  static AppDatabase _db = _constructDb();

  factory AppDatabase() {
    return _db;
  }
  @override
  MigrationStrategy get migration =>
      MigrationStrategy(onUpgrade: (doMigration, from, to) async {
        // ignore: unnecessary_statements
        (db, details) async {
          await db.customStatement(
              'PRAGMA foreign_keys = ON ' + 'PRAGMA journal_mode=WAL');
        };
      });
  AppDatabase._internal(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;

  static AppDatabase _constructDb({bool logStatements8 = false}) {
    final executor = LazyDatabase(() async {
      final dataDir = await paths.getApplicationDocumentsDirectory();
      final dbFile = File(p.join(dataDir.path, 'moena.sqlite'));
      return FlutterQueryExecutor.inDatabaseFolder(
          path: dbFile.path, logStatements: true);
    });
    return AppDatabase._internal(executor);
  }
}

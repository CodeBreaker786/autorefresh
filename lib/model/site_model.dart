import 'package:moor_flutter/moor_flutter.dart';

class Sites extends Table {
  IntColumn get id => integer().nullable().autoIncrement()();
  TextColumn get title => text().nullable()();
  TextColumn get url => text().nullable()();
  IntColumn get reloadCount => integer().nullable()();
  IntColumn get totalReloadCount => integer().nullable()();
  IntColumn get hours => integer().nullable()();
  IntColumn get mintue => integer().nullable()();
}

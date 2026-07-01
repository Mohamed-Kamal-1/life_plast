import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

class ProductsTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text().withLength(min: 1, max: 200)();
  RealColumn get buyingPrice => real()();
  RealColumn get sellingPrice => real()();
  IntColumn get quantity => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

class AccountsTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get phone => text()();
  TextColumn get city => text()();
  TextColumn get type => text()();

  @override
  Set<Column> get primaryKey => {id};
}

@singleton
@DriftDatabase(tables: [ProductsTable, AccountsTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'life_plast_erp.sqlite'));
    return NativeDatabase(file);
  });
}
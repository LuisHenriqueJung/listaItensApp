// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'package:listagem/models/ItemModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ItensDatabase {
  static final ItensDatabase instance = ItensDatabase._init();

  static Database? _database;

  ItensDatabase._init();
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('Itens.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const numberType = 'INTEGER NOT NULL';

    await db.execute('''CREATE TABLE $tabelaItens (
      ${ItemFields.id} $idType,
      ${ItemFields.descricao} $textType,
      ${ItemFields.quantidade} $numberType,
      ${ItemFields.selected} $numberType
    )''');
  }

  Future<Item> insertItem(Item item) async {
    final db = await instance.database;
    final id = await db.insert(tabelaItens, item.toMap());
    return item.copyWith(id: id);
  }

  Future<Item> readItem(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      tabelaItens,
      columns: ItemFields.values,
      where: '${ItemFields.id} = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return Item.fromMap(maps.first);
    } else {
      throw Exception('Id $id não encontrado');
    }
  }

  Future<List<Item>> readAllItem() async {
    final db = await instance.database;
    final results =
        await db.query(tabelaItens, orderBy: '${ItemFields.id} ASC');

    return results.map((json) => Item.fromMap(json)).toList();
  }

  Future<int> updateItem(Item item) async {
    final db = await instance.database;

    return db.update(tabelaItens, item.toMap(),
        where: '${ItemFields.id} = ? ', whereArgs: [item.id]);
  }

  Future<int> deleteItem(int id) async {
    final db = await instance.database;

    return db
        .delete(tabelaItens, where: '${ItemFields.id} = ? ', whereArgs: [id]);
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}

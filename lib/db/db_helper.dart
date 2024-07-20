import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/book.dart';

class DBHelper {
  static Database? _database;

  static final DBHelper instance = DBHelper._privateConstructor();
  DBHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'books.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE books(
        id INTEGER PRIMARY KEY,
        title TEXT,
        author TEXT,
        rating REAL,
        isRead INTEGER,
        image TEXT
      )
    ''');
  }

  Future<int> addBook(Book book) async {
    Database db = await instance.database;
    return await db.insert('books', book.toMap());
  }

  Future<List<Book>> fetchBooks(String sortOrder) async {
    Database db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query('books', orderBy: sortOrder);
    return List.generate(maps.length, (i) {
      return Book.fromMap(maps[i]);
    });
  }

  Future<int> updateBook(Book book) async {
    Database db = await instance.database;
    return await db.update('books', book.toMap(), where: 'id = ?', whereArgs: [book.id]);
  }

  Future<int> deleteBook(int id) async {
    Database db = await instance.database;
    return await db.delete('books', where: 'id = ?', whereArgs: [id]);
  }
}

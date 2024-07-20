import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:book_library/model/book.dart';

class BookRepository {
  static final BookRepository instance = BookRepository._init();
  static Database? _database;

  BookRepository._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('books.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE books (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT NOT NULL,
      author TEXT NOT NULL,
      rating REAL NOT NULL,
      isRead INTEGER NOT NULL,
      image TEXT NOT NULL,
      isFavorite INTEGER NOT NULL
    )
    ''');
  }

  Future<void> addBook(Book book) async {
    final db = await instance.database;
    await db.insert('books', book.toMap());
  }

  Future<void> updateBook(Book book) async {
    final db = await instance.database;
    await db.update(
      'books',
      book.toMap(),
      where: 'id = ?',
      whereArgs: [book.id],
    );
  }

  Future<void> deleteBook(int id) async {
    final db = await instance.database;
    await db.delete(
      'books',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Book>> fetchAllBooks() async {
    final db = await instance.database;
    final result = await db.query('books');
    return result.map((json) => Book.fromMap(json)).toList();
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}

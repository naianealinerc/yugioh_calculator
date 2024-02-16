import 'package:sqflite/sqflite.dart';
import 'package:yugioh/models/match_game_model.dart';
import 'package:yugioh/repositories/home_repository.dart';
import 'package:path/path.dart';

class HomeRepositoryImpl implements HomeRepository {
  static const _databaseName = 'YugiohDatabase.db';
  static const _tableName = 'matchs';

  static const columnId = 'id';
  static const columnLifePlayer1 = 'lifePlayer1';
  static const columnLifePlayer2 = 'lifePlayer2';
  static const columnWinningPlayer = 'winningPlayer';

  late Database _db;

  @override
  Future<void> init() async {
    final documentsDirectory = await getDatabasesPath();
    final path = join(documentsDirectory, _databaseName);

    _db = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $_tableName (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            $columnLifePlayer1 INTEGER NOT NULL,
            $columnLifePlayer2 INTEGER NOT NULL,
            $columnWinningPlayer TEXT NOT NULL
          )
          ''');
  }

  @override
  Future<void> deleteMatch(MatchGameModel match) async {
    await init();

    await _db.delete(_tableName, where: "id = ?", whereArgs: [match.id]);
  }

  @override
  Future<List<MatchGameModel>> getListMatchs() async {
    await init();

    final List<Map<String, dynamic>> maps = await _db.query(_tableName);

    return List.generate(maps.length, (index) {
      return MatchGameModel.fromMap(maps[index]);
    });
  }

  @override
  Future<void> insertMatch(MatchGameModel match) async {
    await init();

    await _db.insert(_tableName, match.toMap());
  }
}

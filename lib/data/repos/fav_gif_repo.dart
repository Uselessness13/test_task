import 'package:Test_task/data/models/gif_info.dart';
import 'package:sqflite/sqflite.dart';

class FavGifsRepo {
  final String tableGif = 'gif';
  final String columnId = 'inner_id';
  final String id = 'id';
  final String url = 'url';

  Future<Database> _db;

  Future<Database> getDb() {
    _db ??= _initDb();
    return _db;
  }

  // Guaranteed to be called only once.
  Future<Database> _initDb() async {
    final db = await openDatabase('gif.db', version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
create table $tableGif ( 
  $columnId integer primary key autoincrement, 
  $id integer,
  $url text not null
  )
''');
    });
    return db;
  }

  Future<GifInfo> insert(GifInfo gifInfo) async {
    try {
      if (gifInfo.innerId == null)
        gifInfo.innerId =
            await (await getDb()).insert(tableGif, gifInfo.toMap());
      else
        return gifInfo.copyWith(innerId: null);
    } catch (e) {
      return gifInfo.copyWith(innerId: null);
    }
    return gifInfo;
  }

  Future<List<GifInfo>> getAllFavGifs() async {
    List<Map> maps = await (await getDb()).query(
      tableGif,
      columns: [columnId, url],
    );
    List<GifInfo> gifs = maps.map((e) => GifInfo.fromMap(e)).toList();
    return gifs;
  }

  Future<int> delete(int id) async {
    return await (await getDb())
        .delete(tableGif, where: '$columnId = ?', whereArgs: [id]);
  }

  Future close() async => await (await getDb()).close();
}

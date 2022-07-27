import 'package:dollar_real_time/App/Models/Money.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';



final String  table= 'money_value';



class Db_controller{
  static final Db_controller _instance =  Db_controller.internal();// não precisa entender
  factory Db_controller() => _instance;// não precisa entender
  Db_controller.internal();// não precisa entender

  Database? _db;

  Future<Database>get db async{
    if(_db != null){
      return _db!;
    }else{
      _db = await initDb();
      return _db!;
    }
  }

  Future<Database> initDb() async{// inicializa o banco de dados
    final databasePath = await  getDatabasesPath();// pega o caminho onde está feito
    final path = join(databasePath,'money_value.db');// nome do banco de dados

    return openDatabase(
      path, version:1,
      onCreate: (Database db, int version) async{
        await db.execute(
           """CREATE TABLE $table(
                id TEXT PRIMARY KEY, sigla TEXT, name TEXT, value REAL, date TEXT
           )
           """
        );
      } );
  }

  Future<Money> insertMoney(Money money) async{
    Database db_money = await db;
    money.id = await db_money.insert(table, money.toMap());
    return money;
    
  }



  Future<int> deleteMoney(int id) async{// o delete retorna um numero inteiro
    Database dbTodo = await db;
    return await dbTodo.delete(table, where: 'id = ?', whereArgs:[id]);
  }
  
  Future<int> updateMoney(Money money) async{// o delete retorna um numero inteiro
    Database dbTodo = await db;
    return await dbTodo.update(table, money.toMap(), where: 'id = ?', whereArgs: [money.id]);
  }

  Future<List> getAll()async{
    Database dbTodo = await db;
    List listMap = await dbTodo.rawQuery("SELECT * FROM $table;");// pega todas as tables
    List<Money>  listTodo = [];
    for(Map m in listMap){
      listTodo.add(Money.fromMap(m));
    }
    return listTodo;
  }

  Future<int?> getSize() async{
    Database dbTodo =await db;
    return Sqflite.firstIntValue(await dbTodo.rawQuery("SELECT COUNT(*) FROM $table"));
  }

   Future<int> deleteAll() async{
    Database dbTodo = await db;
    return dbTodo.rawDelete('DELETE FROM $table');
  }

  Future closeDb() async{
    Database dbTodo = await db;
    dbTodo.close();
  }

 

}
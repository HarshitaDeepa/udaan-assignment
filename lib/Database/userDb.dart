import 'package:sqflite/sqflite.dart';

// class Database {
  var database;
  createDatabase() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, 'my.db');

     database = await openDatabase(dbPath, version: 1, onCreate: userDb);
    // database = await openDatabase(dbPath, version: 1, onCreate: selfAssessmentDb);

    return database;
  }
  
  // void selfAssessmentDb(Database database, int version) async{
  //   await
  // }

  void userDb(Database database, int version) async {
    //user db
    await database.execute("CREATE TABLE userDb ("
        "userId INTEGER PRIMARY KEY,"
        "name TEXT,"
        "phn_no TEXT,"
        "pinCode TEXT"
        ")");
    //self assessment db
    await database.execute("create table selfAssessment("
        "userId INTEGER PRIMARY KEY,"
        "symptoms TEXT,"
        "travelHistory bool,"
        "contactWithCovidPatient bool"
    ")");
  //admin register db
    await database.execute("create table adminUser("
        "adminId INTEGER PRIMARY KEY,"
        "name TEXT,"
        "phn_no text,"
        "pinCode text"
        ")");

    await database.execute("create table covidResult("
        "adminId INTEGER ,"
        "userId INTEGER,"
        "result text,"
        ")");
  }

 Future<bool> getUser(int id) async {
  var results = await database.rawQuery('SELECT * FROM covidResult WHERE id = $id');

  if (results.length > 0) {
    return true;
  }

  return false;
}

Future<String> getZoneInfo(String pinCode) async {
  var results = await database.rawQuery('SELECT * FROM userDb WHERE pinCode = $pinCode');

  if (results.length >= 1 && results.length <= 5) return "orange";
  else if(results.length > 5) return "red";

  return "green";
}

  createUser(Users user) async {
    var result = await database.rawInsert(
        "INSERT INTO Customer (id,first_name, last_name, email)"
            " VALUES (${user.user_id},${user.name},${user
            .phn_no},${user.pin_code})");
    return result;
  }


class Users {
  String name;
  String phn_no;
  String pin_code;
  int user_id;

  Users({
    required this.user_id,
    required this.name,
    required this.phn_no,
    required this.pin_code,
  });

  int get userId => user_id;
  String get Name => name;
  String get phnNo => phn_no;
  String get pinCode => pinCode;


  factory Users.fromJson(Map<String, dynamic> data) => new Users(
    user_id: data["user_id"],
    name: data["name"],
    phn_no: data["phn_no"],
    pin_code: data["pin_code"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": user_id,
    "name": name,
    "phn_no": phn_no,
    "pin_code": pin_code,
  };


  //findZone
  void findZone() async{
    String pinCode = "1111";
  String zoneInfo = await getZoneInfo(pinCode);
  }
}
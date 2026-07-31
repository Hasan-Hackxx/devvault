import 'package:supabase_flutter/supabase_flutter.dart';

// map{codeName: result, code: result}

class CodeStorage {
  final database = Supabase.instance.client.from("codes");

  Future<void> saveCode(String codeName, String code) async {
    await database.insert({"codeName": codeName, "code": code});
  }

  Stream<List<Map<String, dynamic>>> getCode() {
    return database.stream(primaryKey: ["id"]).order("id");
  }

  Future<void> deleteCode(int id) async {
    await database.delete().eq("id", id);
  }
}

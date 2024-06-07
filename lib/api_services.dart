import 'dart:convert';
import 'package:http/http.dart' as http;
import 'user_model.dart';

class APIServices {
  Future<List<UserModel>> getUserData() async {
    var response =
        await http.get(Uri.parse('https://reqres.in/api/users?page=1'));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)["data"];
      return result.map(((e) => UserModel.fromJshon(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

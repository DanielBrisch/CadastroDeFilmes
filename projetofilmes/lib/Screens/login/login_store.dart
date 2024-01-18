import 'package:http/http.dart' as http;
import 'package:projetofilmes/serverInfo.dart';

class LoginStore {

  static Future<bool> getUserExist(String user, String password) async {

    final urlGet = Uri.parse('${ServerInfo.hostAPI}/usuarios/getUsuario/$user/$password');

    final response = await http.get(urlGet);

    if (response.statusCode == 200) {
      response.body;
    }
    return false;
  }
}
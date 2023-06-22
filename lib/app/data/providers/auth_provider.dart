import 'package:get/get.dart';
import 'package:money_app_mobile/app/data/models/user_model.dart';
import 'package:money_app_mobile/app/data/providers/base_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends BaseProvider {
  @override
  void onInit() {
    super.onInit();
  }

  Future<dynamic> login(email, password) async {
    try{
      dynamic body = {
        'email': email,
        'password': password
      };
      final response = await post('login', body);
      print(response.request?.headers);
      if (response.body["success"]) {
          final SharedPreferences sharedPreferences = await prefs;
          var token = response.body['data'];
          await sharedPreferences.setString("token", "Bearer $token");
          return true;
        } else {
          print("except");
          throw Exception({"message": response.body["message"]});
        }
      } catch (e) {
        print("cath");
        throw e;
      }
    
    }

  Future<User?> getProfile(String id) async {
    try {
      final response = await get('profile');

      if (response.body["success"]) {
        return User.fromJson(response.body["data"]);
      } else {
        throw Exception({"message": response.body["message"]});
      }
    } catch (e) {
      throw "An error occurred while fetching the user data.";
    }
  }
}

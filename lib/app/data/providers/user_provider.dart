  import 'package:get/get.dart';
  import 'package:money_app_mobile/app/data/providers/base_provider.dart';

  import '../models/user_model.dart';

  class UserProvider extends BaseProvider {
    @override
    void onInit() {
      super.onInit();
    }

    
    Future<User?> getUser(String id) async {
      try {
        var headers = {'Authorization': "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0ODg3ODQ1MzE1ZWNlYWIzMGM0NjI2MiIsIm5hbWUiOiJUZXN0MTExMjIyIiwiZW1haWwiOiJ0ZXN0aW5nQGdtYWlsLmNvbSIsImlhdCI6MTY4NzEwNzE2N30.nocVWVJMimqGhwvmbqvPidf7wQH2xYRDdRBitkG7zT4"};
        final response = await get('users/$id', headers: headers);

        if (response.body["success"]) {
          return User.fromJson(response.body["data"]);
        } else {
          throw Exception({"message": response.body["message"]});
        }
      } catch (e) {
        throw "An error occurred while fetching the user data.";
      }
    }


    Future<Response<User>> postUser(User user) async => await post('users', user);
    Future<Response> deleteUser(String id) async => await delete('users/$id');
  }

import 'package:shared_preferences/shared_preferences.dart';
import 'package:theme_and_clean_architecture_state_management/domain/model/user.dart';
import 'package:theme_and_clean_architecture_state_management/domain/repository/local_storage_repository.dart';

const _pref_token = 'TOKEN';
const _pref_username = 'USERNAME';
const _pref_name = 'NAME';
const _pref_image = 'IMAGE';

class LocalRepositoryImpl extends LocalRepositoryInterface {
  @override
  Future<void> clearAllData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
  }

  @override
  Future<String?> getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(_pref_token);
  }

  @override
  Future<String?> saveToken(String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(_pref_token, token);
    return token;
  }

  @override
  Future<User> getUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final tUserName = pref.getString(_pref_username);
    final tName = pref.getString(_pref_name);
    final tImage = pref.getString(_pref_image);
    return User(
      name: tName!,
      userName: tUserName!,
      image: tImage!,
    );
  }

  @override
  Future<User> saveUser(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(_pref_username, user.userName);
    pref.setString(_pref_name, user.name);
    pref.setString(_pref_image, user.image);
    return user;
  }
}

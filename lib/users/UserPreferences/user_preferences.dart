import 'dart:convert';

import 'package:clothes_app/users/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RememberUserPrefs{
  //save-remember user-info

  static Future<void> storeUserInfo(User userInfo) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String userJsonData = jsonEncode(userInfo.toJson());
    await sharedPreferences.setString("currentUser", userJsonData);
  }

//  get-read User-info
static Future<User?> readUserInfo() async{
    User? currentUserInfo;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userInfo = sharedPreferences.getString("currentUser");

    if(userInfo != null){
      Map<String,dynamic> userDataMap = jsonDecode(userInfo);
     currentUserInfo = User.fromJson(userDataMap);
    }
    return currentUserInfo;
}

}
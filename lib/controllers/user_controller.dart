import 'package:get/get.dart';

class UserController extends GetxController {
  var isLoggedIn = false.obs;
  var name = "Guest".obs;
  var balance = 0.obs;
  var currentRoute = "/home".obs;

  void logIn() => isLoggedIn.value = true;
  void logOut() => isLoggedIn.value = false;
  void setBalance(int value) => balance.value = value;
  void setName(String value) => name.value = value;
  void setCurrentRoute(String value) => currentRoute.value = value;
}

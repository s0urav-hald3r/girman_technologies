import 'package:get/get.dart';
import 'package:girman/controllers/screen_controller.dart';
import 'package:girman/controllers/user_controller.dart';
import 'package:girman/services/user_repository.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    // To change screen via dropdown button
    Get.lazyPut(() => ScreenController());

    // To access the users operation
    Get.lazyPut(() => UserController());
    Get.lazyPut(() => UserRepository());
  }
}

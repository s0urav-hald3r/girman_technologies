import 'package:get/get.dart';
import 'package:girman/controllers/screen_controller.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    // To change screen via dropdown button
    Get.lazyPut(() => ScreenController());
  }
}

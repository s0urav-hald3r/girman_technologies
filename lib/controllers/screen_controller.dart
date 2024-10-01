import 'package:get/get.dart';

class ScreenController extends GetxController {
  static ScreenController get instance => Get.find();

  // * ---------------------------------/ Variable Start /------------------------------

  final RxInt _screenIndex = 0.obs;
  final _screenItems = ['SEARCH', 'WEBSITE', 'LINKEDIN', 'CONTACT'];

  // * ---------------------------------/ Variable End /--------------------------------

  // ! ----------------------------------------------------------------------------------

  // * ---------------------------------/ Getter Start /------------------------------

  int get screenIndex => _screenIndex.value;
  List<String> get screenItems => _screenItems;

  // * ---------------------------------/ Getter End /--------------------------------

  // ! ----------------------------------------------------------------------------------

  // * ---------------------------------/ Setter Start /------------------------------

  set screenIndex(int index) => _screenIndex.value = index;

  // * ---------------------------------/ Setter End /--------------------------------

  // ! ----------------------------------------------------------------------------------
}

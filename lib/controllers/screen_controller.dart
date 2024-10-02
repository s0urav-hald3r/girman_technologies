import 'package:get/get.dart';

class ScreenController extends GetxController {
  static ScreenController get instance => Get.find();

  // * ---------------------------------/ Variable Start /------------------------------

  final RxInt _screenIndex = 0.obs;
  final RxBool _loadingWebView = true.obs;
  final RxBool _isSerachFieldTapped = false.obs;
  final _screenItems = ['SEARCH', 'WEBSITE', 'LINKEDIN', 'CONTACT'];

  // * ---------------------------------/ Variable End /--------------------------------

  // ! ----------------------------------------------------------------------------------

  // * ---------------------------------/ Getter Start /------------------------------

  int get screenIndex => _screenIndex.value;
  bool get loadingWebView => _loadingWebView.value;
  bool get isSerachFieldTapped => _isSerachFieldTapped.value;
  List<String> get screenItems => _screenItems;

  // * ---------------------------------/ Getter End /--------------------------------

  // ! ----------------------------------------------------------------------------------

  // * ---------------------------------/ Setter Start /------------------------------

  set screenIndex(int index) => _screenIndex.value = index;
  set loadingWebView(bool status) => _loadingWebView.value = status;
  set isSerachFieldTapped(bool status) => _isSerachFieldTapped.value = status;

  // * ---------------------------------/ Setter End /--------------------------------

  // ! ----------------------------------------------------------------------------------
}

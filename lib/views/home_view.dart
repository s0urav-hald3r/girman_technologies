import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girman/config/constants.dart';
import 'package:girman/controllers/screen_controller.dart';
import 'package:girman/views/components/custom_appbar.dart';
import 'package:girman/views/linkedin_view.dart';
import 'package:girman/views/search_view.dart';
import 'package:girman/views/website_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final controller = ScreenController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage('assets/images/bg_image.png')),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.white, primaryColor.withOpacity(.4)],
          ),
        ),
        child: Obx(() => Column(
              children: [
                const CustomAppBar(),
                if (controller.screenIndex == 0) const SearchView(),
                if (controller.screenIndex == 1) const WebsiteView(),
                if (controller.screenIndex == 2) const LinkedInView(),
              ],
            )),
      ),
    );
  }
}

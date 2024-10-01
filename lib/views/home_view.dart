import 'package:flutter/material.dart';
import 'package:girman/views/components/custom_appbar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image:
              DecorationImage(image: AssetImage('assets/images/bg_image.png')),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Color.fromARGB(188, 144, 202, 249)],
          ),
        ),
        child: const Column(
          children: [
            CustomAppBar(),
          ],
        ),
      ),
    );
  }
}

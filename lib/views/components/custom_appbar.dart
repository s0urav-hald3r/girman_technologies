import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 66 + MediaQuery.of(context).padding.top,
      padding: EdgeInsets.fromLTRB(
          20, MediaQuery.of(context).padding.top + 20, 20, 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey, spreadRadius: 5, blurRadius: 5)
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/logos/brand_logo.png', height: 30),
          const Icon(Icons.menu, size: 30)
        ],
      ),
    );
  }
}

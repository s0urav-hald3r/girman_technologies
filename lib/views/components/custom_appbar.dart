import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girman/config/constants.dart';
import 'package:girman/controllers/screen_controller.dart';
import 'package:girman/utils/utility.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ScreenController.instance;

    return Container(
      width: double.infinity,
      height: 66 + MediaQuery.of(context).padding.top,
      padding: EdgeInsets.fromLTRB(
          30, MediaQuery.of(context).padding.top + 20, 30, 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: greyColor, spreadRadius: 5, blurRadius: 5)
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/logos/brand_logo.png', height: 30),
          DropdownButtonHideUnderline(
            child: Obx(
              () => DropdownButton2(
                customButton: const Icon(Icons.menu, size: 30),
                items: controller.screenItems.map(
                  (item) {
                    final ifSelect = controller.screenIndex ==
                        controller.screenItems.indexOf(item);
                    return DropdownMenuItem(
                      value: item,
                      child: Text(
                        item,
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: ifSelect ? primaryColor : Colors.black,
                          fontWeight:
                              ifSelect ? FontWeight.bold : FontWeight.normal,
                          decoration: ifSelect
                              ? TextDecoration.underline
                              : TextDecoration.none,
                          decorationColor: primaryColor,
                        ),
                      ),
                    );
                  },
                ).toList(),
                onChanged: (value) async {
                  if (controller.screenItems.last == value!) {
                    Utility.openMailApp();
                    return;
                  }

                  controller.screenIndex =
                      controller.screenItems.indexOf(value);
                },
                dropdownStyleData: DropdownStyleData(
                  width: 110,
                  maxHeight: 190,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white,
                  ),
                  offset: const Offset(-80, -5),
                ),
                menuItemStyleData: const MenuItemStyleData(height: 40),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

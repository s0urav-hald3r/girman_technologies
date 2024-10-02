import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:girman/config/constants.dart';
import 'package:girman/controllers/screen_controller.dart';
import 'package:girman/controllers/user_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 100),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logos/logo.png', height: 48),
            const SizedBox(width: 20),
            Text(
              'Girman',
              style: GoogleFonts.poppins(
                fontSize: 72,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                shadows: <Shadow>[
                  const Shadow(
                    offset: Offset(0, 3),
                    blurRadius: 5.0,
                    color: greyColor,
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 10),
        // Search Box
        Container(
          height: 50,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(width: 1, color: greyColor)),
          child: Row(
            children: [
              const SizedBox(width: 20),
              const Padding(
                padding: EdgeInsets.only(top: 3),
                child: Icon(Icons.search, color: greyColor, size: 20),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: UserController.instance.searchController,
                  onSubmitted: (value) {
                    ScreenController.instance.isSerachFieldTapped = true;
                    UserController.instance.getUsers();
                  },
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    color: greyColor,
                    fontWeight: FontWeight.w500,
                  ),
                  cursorColor: greyColor,
                  cursorHeight: 20,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'[a-zA-Z]') // Allows only characters
                        ),
                  ],
                  textCapitalization: TextCapitalization.sentences,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    isCollapsed: true,
                    hintText: 'Search',
                    hintStyle: GoogleFonts.inter(
                      fontSize: 16,
                      color: greyColor,
                      fontWeight: FontWeight.w500,
                    ),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(width: 12),
            ],
          ),
        ),
      ],
    );
  }
}

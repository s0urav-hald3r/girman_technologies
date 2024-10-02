import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:girman/config/constants.dart';
import 'package:girman/controllers/user_controller.dart';
import 'package:girman/views/components/user_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchResultView extends StatelessWidget {
  const SearchResultView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Expanded(
      child: Obx(
        () => Column(
          children: [
            const SizedBox(height: 30),
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
                      controller: controller.searchController,
                      onSubmitted: (value) {
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
                  const SizedBox(width: 20),
                ],
              ),
            ),
            const SizedBox(height: 20),

            if (controller.isLoading)
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: 3,
                  itemBuilder: (context, index) => const Skeletonizer(
                    enabled: true,
                    child: UserCard(),
                  ),
                ),
              ),

            if (!controller.isLoading && controller.userList.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: controller.userList.length,
                  itemBuilder: (context, index) =>
                      UserCard(user: controller.userList[index]),
                ),
              ),

            if (!controller.isLoading && controller.userList.isEmpty)
              Expanded(
                child: Column(
                  children: [
                    const Spacer(),
                    Image.asset(
                      'assets/images/no_image.png',
                      width: 290,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'No results found.',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF999999),
                      ),
                    ),
                    const Spacer(flex: 2),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

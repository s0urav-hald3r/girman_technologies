import 'package:flutter/material.dart';
import 'package:girman/config/constants.dart';
import 'package:girman/views/components/user_detail_card.dart';
import 'package:google_fonts/google_fonts.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(30, 0, 30, 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: greyColor.withOpacity(.5),
            spreadRadius: .1,
            blurRadius: 5,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 67.45,
            height: 67.45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: greyColor),
            ),
            child: Center(
              child: Container(
                width: 53.61,
                height: 53.61,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/place_holder.png'))),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Sourav Halder',
            style: GoogleFonts.inter(fontSize: 28, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const Icon(
                Icons.location_pin,
                size: 15,
                color: Color(0xFF425763),
              ),
              const SizedBox(width: 5),
              Text(
                'Mumbai',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF425763),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.call,
                        size: 15,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '8609640499',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Available on phone',
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFFAFAFAF),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 35,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    foregroundColor: const Color(0xFFFAFAFA),
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) {
                          return const Dialog(
                            backgroundColor: Colors.white,
                            insetPadding: EdgeInsets.symmetric(horizontal: 30),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            child: UserDetailCard(),
                          );
                        });
                  },
                  child: Text(
                    'Fetch Details',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

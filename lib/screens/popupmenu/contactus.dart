import 'package:flutter/material.dart';
import 'package:fresh_herbs_project/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: AppColors.primaryColor,
        title: Text('Contact Us',style: GoogleFonts.sansita(
                fontWeight: FontWeight.bold,
              ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            Text(
              'We would love to hear your suggestions or problems or questions so we can improve it.send feedbach send@gmail.com',
              style: GoogleFonts.sansita(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

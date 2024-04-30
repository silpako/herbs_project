import 'package:flutter/material.dart';
import 'package:fresh_herbs_project/screens/views/category.dart';
import 'package:fresh_herbs_project/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class Signupherb extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryColor, 
        ),
        child: Column(
          children: [
            Container(
              height: 70,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome To,",
                      style: GoogleFonts.sansita(
                        color: AppColors.textColor, 
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Fresh Herbs",
                      style: GoogleFonts.sansita(
                        color: AppColors.textColor, 
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 40,
              backgroundImage: AssetImage("assets/herbs/splashs.jpeg"),
              child: Container(
                height: 90,
                width: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                ),
              ),
            ),
            SizedBox(height: 50,),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        color: Colors.white,
                        child: Center(
                          child: Text(
                            "Step into Ayurveda's embrace,\n where ancient wisdom meets modern well-being.\n Find balance and vitality in harmony with nature's rhythms.\n",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.sansita(
                              color: AppColors.primaryColor,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        color: Colors.white,
                        child: Center(
                          child: Text(
                            " WE CARE ABOUT YOUR HEALTH.",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.sansita(
                              color: AppColors.textColor,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    SizedBox(
                      height: 30,
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoryHerb()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Get Started  ", style: GoogleFonts.sansita(fontWeight: FontWeight.bold)),
                            Icon(
                              Icons.arrow_forward_rounded, size: 15,
                            )
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

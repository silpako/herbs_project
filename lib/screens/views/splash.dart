import 'dart:async';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fresh_herbs_project/screens/views/signup.dart';
import 'package:fresh_herbs_project/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  // await WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options:FirebaseOptions(
  //     apiKey:"AIzaSyD7VWzCR97Y98_X9zuqLQ2QTUCKPy0p5NA", 
  //     appId: "1:468117386075:android:688eae8bbf8294004be07e" , 
  //     messagingSenderId:"" , 
  //     projectId: "herb-b8b92"));
  runApp(MaterialApp( 
    debugShowCheckedModeBanner: false,
    home: Splash(),));
}
class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _YogaSplashState();
}

class _YogaSplashState extends State<Splash> {
  void initState()
  {
    Timer(Duration(seconds: 5), ()
    {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Signupherb()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "FRESH HERBS",
              style: GoogleFonts.sansita(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
                color:AppColors.textColor,
              ),
            ),
         SizedBox(height: 40,),
          CircleAvatar(
            backgroundColor:AppColors.textColor,
            radius: 70,
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

  SizedBox(height: 70),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "From Nature,",
                  style: GoogleFonts.sansita(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "For Your Health,",
                  style: GoogleFonts.sansita(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

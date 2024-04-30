import 'package:flutter/material.dart';
import 'package:fresh_herbs_project/model/categorydata.dart';
import 'package:fresh_herbs_project/screens/popupmenu/about.dart';
import 'package:fresh_herbs_project/screens/popupmenu/contactus.dart';
import 'package:fresh_herbs_project/screens/popupmenu/discalaimer.dart';
import 'package:fresh_herbs_project/screens/popupmenu/privacy.dart';
import 'package:fresh_herbs_project/screens/popupmenu/rate.dart';
import 'package:fresh_herbs_project/screens/views/alldiseases.dart';
import 'package:fresh_herbs_project/screens/views/ayurvedic.dart';
import 'package:fresh_herbs_project/screens/views/beauti.dart';
import 'package:fresh_herbs_project/screens/views/bodym.dart';
import 'package:fresh_herbs_project/screens/views/introduction.dart';
import 'package:fresh_herbs_project/screens/views/meditation.dart';
import 'package:fresh_herbs_project/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryHerb extends StatefulWidget {
  @override
  _CategoryHerbState createState() => _CategoryHerbState();
}

class _CategoryHerbState extends State<CategoryHerb> {
  final Map<String, WidgetBuilder> routes = {
    "Introduction": (context) => Intro_page(),
    "Ayurvedic Herbs": (context) => Ayrvedic_Herb(),
    "All Diseases": (context) => Diseases_Page(),
    "Beauti Tips": (context) => Beauti_Page(),
    "Meditation": (context) => Meditation_Page(),
    "Body Massage": (context) => Body_Massage_Page(),
  };

  late List<Map<String, String>> filteredData;
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    filteredData = CategoryData.data;
    searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "Category",
          style: GoogleFonts.sansita(color: AppColors.textColor),
        ),
        actions: [
          SizedBox(width: 15),
          Container(
            width: 30,
            height: 30,
            child: PopupMenuButton(itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text("About Us",
                      style: GoogleFonts.sansita(
                          fontSize: 15, color: AppColors.PopColor)),
                  value: 1,
                ),
                PopupMenuItem(
                  child: Text("Privacy",
                      style: GoogleFonts.sansita(
                          fontSize: 15, color: AppColors.PopColor)),
                  value: 2,
                ),
                PopupMenuItem(
                  child: Text("Contact Us",
                      style: GoogleFonts.sansita(
                          fontSize: 15, color: AppColors.PopColor)),
                  value: 3,
                ),
                PopupMenuItem(
                  child: Text("Rate Us",
                      style: GoogleFonts.sansita(
                          fontSize: 15, color: AppColors.PopColor)),
                  value: 4,
                ),
                PopupMenuItem(
                  child: Text("Disclaimer",
                      style: GoogleFonts.sansita(
                          fontSize: 15, color: AppColors.PopColor)),
                  value: 5,
                ),
              ];
            }, onSelected: (value) {
              switch (value) {
                case 1:
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => AboutUsPage()),
                  );
                  break;
                case 2:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PrivacyPage()),
                  );
                  break;
                case 3:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ContactUsPage()),
                  );
                  break;
                case 4:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RateUsPage()),
                  );
                  break;
                case 5:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DisclaimerPage()),
                  );
                  break;
                default:
              }
            }),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 40,
            margin: EdgeInsets.all(6),
            padding: EdgeInsets.symmetric(horizontal: 18),
            decoration: BoxDecoration(
              color: Colors.grey[300], // Grey background color
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    onChanged: (value) {
                      setState(() {
                        filteredData = CategoryData.data
                            .where((category) => category["text"]!
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                            .toList();
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Search...",
                      hintStyle: GoogleFonts.sansita(
                          color: AppColors.searchFieldTextColor, fontSize: 15),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none, // No border
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none, // No border
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: filteredData.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    String text = filteredData[index]["text"]!;
                    if (routes.containsKey(text)) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: routes[text]!),
                      );
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.all(6),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.categoryCardColor,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              height: 5,
                              child: ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(6)),
                                child: filteredData[index]["image"] != ""
                                    ? Image.asset(
                                        filteredData[index]["image"]!,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: double.infinity,
                                      )
                                    : Container(color: Colors.grey),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            alignment: Alignment.center,
                            child: Text(
                              filteredData[index]["text"]!,
                              style: GoogleFonts.sansita(
                                color: AppColors.categoryCardTextColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

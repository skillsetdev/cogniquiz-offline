import 'dart:ui';

import 'package:cogniquiz_offline/app_data.dart';
import 'package:cogniquiz_offline/pages/calendar_page.dart';
import 'package:cogniquiz_offline/pages/folder_page.dart';
import 'package:cogniquiz_offline/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

class NavPage extends StatefulWidget {
  const NavPage({super.key});

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  late AppData appData;
  int _pageIndex = 0;
  bool isDarkMode(BuildContext context) {
    return MediaQuery.of(context).platformBrightness == Brightness.dark;
  }

  final List<Widget> _pages = [
    const HomePage(),
    const FolderPage(),
    const CalendarPage(),
    const CalendarPage(),
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appData = Provider.of<AppData>(context);
    setState(() {
      if (_pageIndex == 2 || _pageIndex == 4) {
        if (appData.myInstitutionId == '') {
          _pageIndex = 4;
        } else {
          _pageIndex = 2;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      body: _pages[_pageIndex],
      bottomNavigationBar: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            decoration: BoxDecoration(
              color: !isDarkMode(context) ? Color.fromARGB(100, 7, 12, 59) : Color.fromARGB(100, 227, 230, 255),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 15),
              child: GNav(
                  tabBackgroundGradient: RadialGradient(
                      colors: isDarkMode(context)
                          ? [Color.fromARGB(255, 128, 141, 254), Color.fromARGB(255, 72, 80, 197)]
                          : [Color.fromARGB(255, 161, 166, 241), Color.fromARGB(255, 128, 141, 254)],
                      center: Alignment(-0.5, 0.0)),
                  color: Colors.white,
                  gap: 8,
                  tabBorderRadius: 100,
                  tabBorder: Border.all(color: Colors.white54, width: 1.2),
                  padding: EdgeInsets.all(16),
                  tabMargin: EdgeInsets.only(bottom: 5),
                  curve: Curves.easeInOut, //easeOutExpo
                  tabs: [
                    GButton(
                      icon: Icons.home,
                      text: 'Home',
                      onPressed: () {
                        setState(() {
                          _pageIndex = 0;
                        });
                      },
                    ),
                    GButton(
                      icon: Icons.copy,
                      text: 'Cards',
                      onPressed: () {
                        setState(() {
                          _pageIndex = 1;
                        });
                      },
                    ),
                    GButton(
                      icon: Icons.calendar_month_outlined,
                      text: 'Stats',
                      onPressed: () {
                        setState(() {
                          _pageIndex = 3;
                        });
                      },
                    ),
                    GButton(
                      icon: Icons.settings,
                      text: 'Setup',
                      onPressed: () {
                        setState(() {
                          _pageIndex = 3;
                        });
                      },
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}

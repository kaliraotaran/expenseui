import 'package:expenseui/colors.dart';
import 'package:expenseui/pages/create_budget.dart';
import 'package:expenseui/pages/daily_page.dart';
import 'package:expenseui/pages/stats_screen.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBody(),
      bottomNavigationBar: getFooter(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setTabs(4);
        },
        shape:const CircleBorder(),
        backgroundColor: primary,
        child:const Icon(Icons.add, size: 25),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  // ignore: non_constant_identifier_names
  Widget GetBody() {
    return IndexedStack(
      index: pageindex,
      children: const [
        DailyPage(),
        StatsPage(),
        CreateBudget(),
        Center(child: Text('profile')),
        Center(child: Text('create budget')),
      ],
    );
  }

  Widget getFooter() {
    List<IconData> icontheme = [
      Ionicons.calendar,
      Ionicons.stats_chart,
      Ionicons.wallet,
      Ionicons.person
    ];
    return AnimatedBottomNavigationBar(
      icons: icontheme,
      activeIndex: pageindex,
      activeColor: primary,
      inactiveColor: black.withOpacity(.5),
      splashColor: secondary,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      leftCornerRadius: 10,
      iconSize: 25,
      rightCornerRadius: 10,
      onTap: (index) {
        setTabs(index);
      },
    );
  }

  setTabs(index) {
    setState(() {
      pageindex = index;
    });
  }
}

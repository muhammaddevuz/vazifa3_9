import 'package:flutter/material.dart';
import 'package:vazifa/views/screens/result_screen.dart';
import 'home_screen.dart';
import 'profile_screen.dart';
import '../widgets/custom_drawer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> pages = [const HomeScreen(), ResultsScreen(), ProfileScreen()];
  List<Widget> titles = [
    const Text("Home Page"),
    const Text("Statistics"),
    const Text("Profile")
  ];
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isPhone = MediaQuery.of(context).size.width < 800;

    return Scaffold(
        appBar: AppBar(
          title: titles[selectedIndex],
        ),
        drawer: const CustomDrawer(),
        body: !isPhone
            ? Row(
                children: [
                  NavigationRail(
                      onDestinationSelected: _onItemTapped,
                      destinations: [
                        const NavigationRailDestination(
                          icon: Icon(Icons.home),
                          label: const Text("Home"),
                        ),
                        const NavigationRailDestination(
                          icon: Icon(Icons.bar_chart_rounded),
                          label: Text("Statistics"),
                        ),
                        const NavigationRailDestination(
                          icon: Icon(Icons.person),
                          label: Text("Profile"),
                        ),
                      ],
                      selectedIndex: selectedIndex),
                  Expanded(child: pages[selectedIndex])
                ],
              )
            : IndexedStack(
                index: selectedIndex,
                children: pages,
              ),
        bottomNavigationBar: isPhone
            ? BottomNavigationBar(
                items: const [
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.bar_chart_rounded), label: ""),
                  BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
                ],
                currentIndex: selectedIndex,
                selectedItemColor: Colors.amber[800],
                onTap: _onItemTapped,
              )
            : null);
  }
}
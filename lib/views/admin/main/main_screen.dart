import 'package:flutter/material.dart';
import 'package:pointofsales/providers/admin/p_dashboard.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/views/ADMIN/dashboard/dashboard_screen.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderDashboardAdmin>(
      builder: (context, data, _) => Scaffold(
        // bottomNavigationBar: BottomNavigationBar(
        //   backgroundColor: kPrimaryColor,
        //   type: BottomNavigationBarType.fixed,
        //   currentIndex: data.selectedIndex,
        //   selectedItemColor: Colors.white,
        //   unselectedFontSize: 8,
        //   onTap: data.change,
        //   items: data.items,
        // ),
        // body: data.getPage(data.selectedIndex),
        body: DashboardScreen(),
      ),
    );
  }
}

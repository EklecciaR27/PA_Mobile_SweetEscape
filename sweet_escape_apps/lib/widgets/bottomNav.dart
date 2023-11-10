import 'package:flutter/material.dart';
import 'package:sweet_escape_apps/home_page.dart';

class BottomNavScreen extends StatefulWidget {
  final int currentIndex;
  final String title; // Tambahkan title ke widget

  BottomNavScreen({Key? key, required this.currentIndex, required this.title})
      : super(key: key);

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState(currentIndex);
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int currentIndex;

  _BottomNavScreenState(this.currentIndex);

  void _onItemTap(int index) {
    setState(() {
      currentIndex = index;
    });
    if (index == 0) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    }
    if (index == 1) {
      // Navigator.push(context, MaterialPageRoute(builder: (context) => InputReviewPage()));
    }
    if (index == 2) {
      // Navigator.push(context, MaterialPageRoute(builder: (context) => OutputReviewPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.title), // Gunakan title yang diberikan melalui widget
      ),
      body: const Center(
        child: Text("Content of the Page"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: _onItemTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color.fromRGBO(123, 120, 255, 1.0)),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon:
                Icon(Icons.reviews, color: Color.fromRGBO(123, 120, 255, 1.0)),
            label: "Reservation",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, color: Color(0xFF1E0E4F)),
            label: "My  Profile",
          ),
        ],
        backgroundColor: Theme.of(context).bottomAppBarTheme.color,
        elevation: Theme.of(context).bottomAppBarTheme.elevation,
      ),
    );
  }
}

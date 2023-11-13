import 'package:flutter/material.dart';
import 'package:sweet_escape_apps/home_page.dart';

class BottomNavScreen extends StatefulWidget {
  final int currentIndex;

  BottomNavScreen({Key? key, required this.currentIndex}) : super(key: key);

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState(currentIndex);
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int currentIndex;

  _BottomNavScreenState(this.currentIndex);

//fungsi on tap jalan ketika user klik menu
  void _onItemTap(int index) {
    setState(() {
      currentIndex = index;
    });
    if (index == 0) {
      // Periksa apakah indeks yang dipilih adalah 1 (home )
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    }
    // if (index == 1) {
    //   // Periksa apakah indeks yang dipilih adalah 1 (input Review)
    //   Navigator.push(
    //       context, MaterialPageRoute(builder: (context) => InputReviewPage()));
    // }
    // if (index == 2) {
    //   // Periksa apakah indeks yang dipilih adalah 1 (output Review)
    //   Navigator.push(
    //       context, MaterialPageRoute(builder: (context) => AboutMePage()));
    // }
    //  if (index == 3) {
    //   // Periksa apakah indeks yang dipilih adalah 1 (output Review)
    //   Navigator.push(
    //       context, MaterialPageRoute(builder: (context) => SettingPage()));
    // }
  }

//isi konten bottom navigasi
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: _onItemTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_filled,
            color: Color.fromRGBO(123, 120, 255, 1.0),
          ),
          // activeIcon: Icon(Icons.home, color:Color.fromRGBO(123, 120, 255, 1.0) ,),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.reviews, color: Color(0xFF1E0E4F)),
          // activeIcon: Icon(Icons.home,
          // color:Color.fromRGBO(123, 120, 255, 1.0) ,),
          label: "Add Review",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: Color.fromRGBO(123, 120, 255, 1.0),
          ),
          // activeIcon: Icon(Icons.favorite,
          // color:Color(0xFF1E0E4F) ,),
          label: "My Profile",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.settings,
            color: Color.fromRGBO(123, 120, 255, 1.0),
          ),
          // activeIcon: Icon(Icons.favorite,
          // color:Color(0xFF1E0E4F) ,),
          label: ("Setting"),
        ),
      ],
      selectedItemColor:
          Color.fromARGB(255, 4, 0, 255), // Warna saat item dipilih
      unselectedItemColor: const Color.fromRGBO(
          123, 120, 255, 1.0), // Warna saat item tidak dipilih
      unselectedLabelStyle: const TextStyle(
        color: Colors.black, // Warna teks label saat item tidak dipilih
      ),
      selectedLabelStyle: const TextStyle(
        color: Colors.black, // Warna teks label saat item dipilih
      ),

      backgroundColor: Theme.of(context)
          .bottomAppBarTheme
          .color, //pake warna yang ada di theme main
      elevation: Theme.of(context)
          .bottomAppBarTheme
          .elevation, //pake elevasi yang ada di theme main
    );
  }
}

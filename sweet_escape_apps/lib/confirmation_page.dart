import 'package:flutter/material.dart';
import 'package:sweet_escape_apps/home_page.dart';
import 'package:intl/intl.dart';

class Confirmation extends StatelessWidget {
  final String? name;
  final String? numbphone;
  final String? radioValue;
  final String? selectedLocation;
  final DateTime? selectedDate;
  final List<Map<String, dynamic>> reservations;

  Confirmation(this.name, this.numbphone, this.radioValue, this.selectedDate,
      this.selectedLocation, this.reservations);

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF66A2AD),
        title: const Text('Confirmation Page'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: lebar,
          height: tinggi,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 150,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/logo2.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  height: 90,
                  width: 90,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/check.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Booking Confirmed',
                      style: TextStyle(
                        color: Color(0xFF35656F),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      'Full Name : $name',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Number Phone : $numbphone',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Location : $selectedLocation',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Concept : $radioValue',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Booking Date : ${selectedDate != null ? DateFormat('dd - MM - yyyy').format(selectedDate!) : 'Belum dipilih'}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFF8AB7BA)),
                    foregroundColor:
                        MaterialStateProperty.all(const Color(0xFF35656F)),
                    fixedSize: MaterialStateProperty.all(const Size(100.0, 50.0)),
                  ),
                  child: const Text("OK!"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

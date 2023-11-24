import 'package:flutter/material.dart';
import 'package:sweet_escape_apps/history_page.dart';
import 'package:sweet_escape_apps/models/reservation_provider.dart';
import 'package:sweet_escape_apps/models/reservation.dart';
import 'package:sweet_escape_apps/signIn.dart';
import 'package:sweet_escape_apps/widgets/bottomNav.dart';
import 'confirmation_page.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Reservasi extends StatefulWidget {
  @override
  _ReservasiState createState() => _ReservasiState();
}

class _ReservasiState extends State<Reservasi> {
  String radioValue = '';
  bool? check1 = false;
  bool? check2 = false;
  bool? check3 = false;
  String? name = '';
  String? numbphone = '';
  String? selectedLocation = 'Bali';
  DateTime? selectedDate;
  FocusNode nameFocus = FocusNode();
  FocusNode phoneFocus = FocusNode();

  List<Map<String, dynamic>> reservations = [];

  // void _incrementCounter() {
  //   setState(() {
  //     reservations.add({
  //       'name': name,
  //       'numbphone': numbphone,
  //       'radioValue': radioValue,
  //       'selectedDate': selectedDate,
  //     });
  //   });
  // }

  //reser pro
  void _incrementCounter(ReservationProvider reservationProvider) {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // ambil emailnya
      String userEmail = user.email ?? '';

      final newReservation = Reservation(
        name: name!,
        numbphone: numbphone!,
        location: selectedLocation!,
        radioValue: radioValue,
        selectedDate: selectedDate!,
        email: userEmail,
      );

      // Tambahkan data reservasi ke menggunakan Provider
      reservationProvider.addReservation(newReservation);
    }
  }

  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    nameFocus.dispose();
    phoneFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;
    var currentIndex = 1;

    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.book_online)),
                Tab(icon: Icon(Icons.history)),
              ],
            ),
          ),
          body: TabBarView(children: [
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("images/bali.jpg"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      "Contact Details",
                      style: TextStyle(
                        color: Color(0xFF35656F),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Full Name",
                        labelStyle: const TextStyle(
                          color: Color(0xFF66A2AD),
                        ),
                        hintText: "Enter your full name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFF66A2AD),
                          ),
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFC0CFC8),
                          ),
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                      ),
                      onChanged: (String value) {
                        setState(() {
                          name = value;
                        });
                      },
                      focusNode: nameFocus,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Phone Number",
                        labelStyle: const TextStyle(
                          color: Color(0xFF66A2AD),
                        ),
                        hintText: "Enter your phone number",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFF66A2AD),
                          ),
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFC0CFC8),
                          ),
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                      ),
                      onChanged: (String value) {
                        setState(() {
                          numbphone = value;
                        });
                      },
                      focusNode: phoneFocus,
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      "Location",
                      style: TextStyle(
                        color: Color(0xFF35656F),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: DropdownButton<String>(
                        value: selectedLocation,
                        items: <String>['Bali', 'Malang', 'Yogyakarta']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                color: Color(0xFF35656F),
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedLocation = newValue!;
                          });
                        },
                        hint: Text(
                          'Select Location',
                          style: TextStyle(
                            color: Color(0xFF66A2AD),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      "Concept",
                      style: TextStyle(
                        color: Color(0xFF35656F),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    RadioListTile(
                      value: 'Casual',
                      groupValue: radioValue,
                      onChanged: (String? value) {
                        setState(() {
                          radioValue = value!;
                        });
                      },
                      title: Text(
                        'Casual',
                        style: TextStyle(
                          color: radioValue == 'Casual'
                              ? const Color(0xFF35656F)
                              : const Color(0xFF66A2AD),
                        ),
                      ),
                    ),
                    RadioListTile(
                      value: 'Vintage',
                      groupValue: radioValue,
                      onChanged: (String? value) {
                        setState(() {
                          radioValue = value!;
                        });
                      },
                      title: Text(
                        'Vintage',
                        style: TextStyle(
                          color: radioValue == 'Vintage'
                              ? const Color(0xFF35656F)
                              : const Color(0xFF66A2AD),
                        ),
                      ),
                    ),
                    RadioListTile(
                      value: 'Formal',
                      groupValue: radioValue,
                      onChanged: (String? value) {
                        setState(() {
                          radioValue = value!;
                        });
                      },
                      title: Text(
                        'Formal',
                        style: TextStyle(
                          color: radioValue == 'Formal'
                              ? const Color(0xFF35656F)
                              : const Color(0xFF66A2AD),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      "Booking Date",
                      style: TextStyle(
                        color: Color(0xFF35656F),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.calendar_today,
                            color: Color(0xFF66A2AD),
                          ),
                          TextButton(
                            onPressed: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2101),
                              );
                              if (pickedDate != null &&
                                  pickedDate != selectedDate) {
                                setState(() {
                                  selectedDate = pickedDate;
                                });
                              }
                            },
                            child: Text(
                              selectedDate != null
                                  ? ' ${DateFormat('dd - MM - yyyy').format(selectedDate!)}'
                                  : 'Select Date',
                              style: TextStyle(
                                color: selectedDate != null
                                    ? const Color(0xFF35656F)
                                    : const Color(0xFF66A2AD),
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    ElevatedButton(
                      onPressed: () {
                        //_incrementCounter();
                        final reservationProvider =
                            Provider.of<ReservationProvider>(
                          context,
                          listen: false,
                        );
                        _incrementCounter(reservationProvider);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Confirmation(
                                name,
                                numbphone,
                                radioValue,
                                selectedDate,
                                selectedLocation,
                                reservations),
                          ),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xFF8AB7BA)),
                        foregroundColor:
                            MaterialStateProperty.all(const Color(0xFF35656F)),
                        fixedSize:
                            MaterialStateProperty.all(const Size(100.0, 50.0)),
                      ),
                      child: const Text("SUBMIT"),
                    ),
                    // SizedBox(height: 80),
                  ],
                ),
              ),
            ),
            History(name, numbphone, radioValue, selectedDate, reservations)
          ]),
          bottomNavigationBar: BottomNavScreen(
            currentIndex: currentIndex,
          ),
        ));
  }
}

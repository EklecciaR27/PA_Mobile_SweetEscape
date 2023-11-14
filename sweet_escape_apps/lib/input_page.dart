import 'package:flutter/material.dart';
import 'confirmation.dart';
import 'package:intl/intl.dart';
import 'widgets/bottomNav.dart';

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
  DateTime? selectedDate;
  List<Map<String, dynamic>> reservations = [];

  void _incrementCounter() {
    setState(() {
      reservations.add({
        'name': name,
        'numbphone': numbphone,
        'radioValue': radioValue,
        'selectedDate': selectedDate,
      });
    });
  }

  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;
    var currentIndex = 0;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // width: lebar,
          // height: tinggi,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  width: 300,
                  height: 150,
                  margin: const EdgeInsets.only(top: 2, bottom: 50),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/zaamakeup.PNG"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Text("Masukkan Nama Anda",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox(
                  width: 200,
                  child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Masukkan Nama Anda",
                        labelText: "Nama",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      onChanged: (String value) {
                        setState(() {
                          name = value;
                        });
                      }),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Text("Masukkan No Telepon Anda",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox(
                  width: 200,
                  child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Masukkan No Telepon Anda",
                        labelText: "No Telepon",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      onChanged: (String value) {
                        setState(() {
                          numbphone = value;
                        });
                      }),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 40, bottom: 20),
                child: Text("Pilih Konsep :",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              ListTile(
                leading: Radio(
                  value: 'Casual',
                  groupValue: radioValue,
                  onChanged: (String? value) {
                    setState(() {
                      radioValue = value!;
                    });
                  },
                ),
                title: const Text('Casual'),
              ),
              ListTile(
                leading: Radio(
                  value: 'Vintage',
                  groupValue: radioValue,
                  onChanged: (String? value) {
                    setState(() {
                      radioValue = value!;
                    });
                  },
                ),
                title: const Text('Vintage'),
              ),
              ListTile(
                leading: Radio(
                  value: 'Formal',
                  groupValue: radioValue,
                  onChanged: (String? value) {
                    setState(() {
                      radioValue = value!;
                    });
                  },
                ),
                title: const Text('Formal'),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 40, bottom: 20),
                child: Text(
                  "Pilih Tanggal Booking :",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null && pickedDate != selectedDate) {
                    setState(() {
                      selectedDate = pickedDate;
                    });
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 255, 255, 255),
                  ),
                  side: MaterialStateProperty.all(
                    const BorderSide(
                      color: Color.fromRGBO(194, 153, 247, 0.612),
                      width: 2.0,
                    ),
                  ),
                ),
                child: Text(
                  selectedDate != null
                      ? 'Tanggal : ${DateFormat('dd - MM - yyyy').format(selectedDate!)}'
                      : 'Pilih Tanggal',
                  style: const TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  _incrementCounter();

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Confirmation(
                        name,
                        numbphone,
                        radioValue,
                        selectedDate,
                        reservations,
                      ),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 255, 255, 255)),
                  side: MaterialStateProperty.all(const BorderSide(
                      color: Color.fromRGBO(194, 153, 247, 0.612), width: 2.0)),
                ),
                child: const Text(
                  'SUBMIT',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavScreen(
        currentIndex: currentIndex, // Ganti dengan judul sesuai kebutuhan
      ),
    );
  }
}

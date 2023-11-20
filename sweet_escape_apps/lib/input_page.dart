import 'package:flutter/material.dart';
import 'confirmation_page.dart';
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
  FocusNode nameFocus = FocusNode();
  FocusNode phoneFocus = FocusNode();

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
    nameFocus.dispose();
    phoneFocus.dispose();
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
          width: lebar,
          height: tinggi,
          padding: EdgeInsets.all(16.0),
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
              SizedBox(height: 30),
              Text(
                "Contact Details",
                style: TextStyle(
                  color: Color(0xFF35656F),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Full Name",
                  labelStyle: TextStyle(
                    color: Color(0xFF66A2AD),
                  ),
                  hintText:
                      "Enter your full name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        40.0), 
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF66A2AD),
                    ),
                    borderRadius: BorderRadius.circular(
                        40.0), 
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFC0CFC8),
                    ),
                    borderRadius: BorderRadius.circular(
                        40.0), 
                  ),
                ),
                onChanged: (String value) {
                  setState(() {
                    name = value;
                  });
                },
                focusNode: nameFocus,
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Phone Number",
                  labelStyle: TextStyle(
                    color: Color(0xFF66A2AD),
                  ),
                  hintText: "Enter your phone number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF66A2AD),
                    ),
                    borderRadius: BorderRadius.circular(
                        40.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFC0CFC8),
                    ),
                    borderRadius: BorderRadius.circular(
                        40.0), 
                  ),
                ),
                onChanged: (String value) {
                  setState(() {
                    numbphone = value;
                  });
                },
                focusNode: phoneFocus,
              ),
              SizedBox(height: 40),
              Text(
                "Concept",
                style: TextStyle(
                  color: Color(0xFF35656F),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
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
                        ? Color(0xFF35656F)
                        : Color(0xFF66A2AD),
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
                        ? Color(0xFF35656F)
                        : Color(0xFF66A2AD),
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
                        ? Color(0xFF35656F)
                        : Color(0xFF66A2AD),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Text(
                "Booking Date",
                style: TextStyle(
                  color: Color(0xFF35656F),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: [
                    Icon(
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
                        if (pickedDate != null && pickedDate != selectedDate) {
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
                              ? Color(0xFF35656F)
                              : Color(0xFF66A2AD),
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
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
                        reservations
                      ),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color(0xFF8AB7BA)),
                  foregroundColor: MaterialStateProperty.all(
                      Color(0xFF35656F)),
                  fixedSize: MaterialStateProperty.all(Size(100.0, 50.0)),
                ),
                child: Text("SUBMIT"),
              ),
              // SizedBox(height: 80),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavScreen(
        currentIndex: currentIndex,
      ),
    );
  }
}

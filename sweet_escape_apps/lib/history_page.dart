import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sweet_escape_apps/theme.dart';

class History extends StatelessWidget {
  final String? name;
  final String? numbphone;
  final String? radioValue;
  final DateTime? selectedDate;
  final List<Map<String, dynamic>> reservations;

  History(this.name, this.numbphone, this.radioValue, this.selectedDate,
      this.reservations);

  @override
  Widget build(BuildContext context) {
    

    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: lebar,
          height: tinggi,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'RESERVASI BERHASIL !!!',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: 20),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: reservations.length,
                  itemBuilder: (context, index) {
                    var reservation = reservations[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 30),
                        Text(
                          'Nama : ${reservation['name']}',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Text(
                          'Nomor Telepon : ${reservation['numbphone']}',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Text(
                          'Konsep : ${reservation['radioValue']}',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Text(
                          'Tanggal Booking : ${reservation['selectedDate'] != null ? DateFormat('dd - MM - yyyy').format(reservation['selectedDate'] as DateTime) : 'Belum Dipilih'}',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        SizedBox(height: 30),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

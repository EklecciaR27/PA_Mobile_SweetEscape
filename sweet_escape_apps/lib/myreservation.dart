import 'package:flutter/material.dart';
import 'package:sweet_escape_apps/models/reservation.dart';
import 'package:sweet_escape_apps/models/reservation_provider.dart';
import 'package:provider/provider.dart';

class MyReservation extends StatelessWidget {
  const MyReservation({Key? key});

  @override
  Widget build(BuildContext context) {
    final reservationProvider = Provider.of<ReservationProvider>(context);

    return FutureBuilder<List<Reservation>>(
      future: reservationProvider.getReservation(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final userReservations = snapshot.data ?? [];
          // Gunakan data userReservations untuk menampilkan reservasi pengguna
          // Misalnya, tampilkan dalam ListView atau GridView
          return ListView.builder(
            itemCount: userReservations.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(userReservations[index].name),
                // Tampilkan data reservasi lainnya sesuai kebutuhan
              );
            },
          );
        }
      },
    );
  }
}

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
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          final userReservations = snapshot.data ?? [];

          return Container(
            padding: EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: userReservations.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 3,
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name: ${userReservations[index].name}',
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          'Phone Number: ${userReservations[index].numbphone}',
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          'Location: ${userReservations[index].location}',
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          'Concept: ${userReservations[index].radioValue}',
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          'Email: ${userReservations[index].email}',
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          'Date: ${userReservations[index].selectedDate.toString()}',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}

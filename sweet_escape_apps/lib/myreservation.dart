import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sweet_escape_apps/models/reservation.dart';
import 'package:sweet_escape_apps/models/reservation_provider.dart';
import 'package:provider/provider.dart';

class MyReservation extends StatelessWidget {
  const MyReservation({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        //itemCount: userReservations.length,
        itemBuilder: (context, index) {
          return const Card(
            elevation: 3,
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'NAME',
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    'NUMBPHONE',
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    'LOCATION',
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    'RADIOVALUE',
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    'EMAIL',
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    'DATE',
                    style: TextStyle(color: Colors.black),
                  ),
                  // Text(
                  //   //'Phone Number: ${userReservations[index].numbphone}',
                  //   style: const TextStyle(color: Colors.black),
                  // ),
                  // Text(
                  //   //'Location: ${userReservations[index].location}',
                  //   style: const TextStyle(color: Colors.black),
                  // ),
                  // Text(
                  //   //'Concept: ${userReservations[index].radioValue}',
                  //   style: const TextStyle(color: Colors.black),
                  // ),
                  // Text(
                  //   //'Email: ${userReservations[index].email}',
                  //   style: const TextStyle(color: Colors.black),
                  // ),
                  // Text(
                  //   //'Date: ${userReservations[index].selectedDate.toString()}',
                  //   style: const TextStyle(color: Colors.black),
                  // ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

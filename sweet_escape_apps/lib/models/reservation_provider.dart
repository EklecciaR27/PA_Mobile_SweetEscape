import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sweet_escape_apps/models/reservation.dart';

class ReservationProvider extends ChangeNotifier {
  final CollectionReference _reservationsCollection =
      FirebaseFirestore.instance.collection('data_reservasi');

  Future<void> addReservation(Reservation reservation) async {
    try {
      await _reservationsCollection.add(reservation.toMap());
      notifyListeners();
    } catch (e) {
      print('Error adding reservation: $e');
    }
  }

  Future<List<Reservation>> getReservation() async {
    List<Reservation> userReservation = [];
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String userEmail = user.email ?? '';
      try {
        QuerySnapshot snapshot = await _reservationsCollection
            .where('email', isEqualTo: userEmail)
            .get();

        if (snapshot.docs.isNotEmpty) {
          snapshot.docs.forEach((document) {
            Reservation reservation = Reservation(
              name: document['name'],
              numbphone: document['numbphone'],
              location: document['location'],
              radioValue: document['radioValue'],
              email: document['email'],
              selectedDate: (document['selectedDate'] as Timestamp).toDate(),
            );
            userReservation.add(reservation);
          });
        }
        print('User Reservations: $userReservation');
      } catch (e) {
        print('Error fetching reservations: $e');
      }
    }

    return userReservation;
  }

  Future<List<Reservation>> getAllReservations() async {
    List<Reservation> allReservations = [];

    try {
      QuerySnapshot snapshot = await _reservationsCollection.get();

      if (snapshot.docs.isNotEmpty) {
        snapshot.docs.forEach((document) {
          Reservation reservation = Reservation(
            name: document['name'],
            numbphone: document['numbphone'],
            location: document['location'],
            radioValue: document['radioValue'],
            email: document['email'],
            selectedDate: (document['selectedDate'] as Timestamp).toDate(),
          );
          allReservations.add(reservation);
        });
      }
    } catch (e) {
      print('Error fetching all reservations: $e');
    }

    return allReservations;
  }



  // baru
  Future<List<Reservation>> getReservationsUser() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String userEmail = user.email ?? '';
      
      try {
        QuerySnapshot querySnapshot = await _reservationsCollection
            .where('email', isEqualTo: userEmail)
            .get();

        List<Reservation> reservations = querySnapshot.docs.map((doc) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

          return Reservation(
            name: data['name'],
            numbphone: data['numbphone'],
            location: data['location'],
            radioValue: data['radioValue'],
            email: data['email'],
            selectedDate: data['selectedDate'].toDate(),
          );
        }).toList();

        return reservations;
      } catch (e) {
        print('Error getting reservations: $e');
        return [];
      }
    } else {
      return [];
    }
  }
}

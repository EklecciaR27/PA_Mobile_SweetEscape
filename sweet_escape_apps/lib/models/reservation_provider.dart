import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
}
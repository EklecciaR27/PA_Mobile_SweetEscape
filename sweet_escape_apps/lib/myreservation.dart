import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sweet_escape_apps/models/reservation.dart';
import 'package:sweet_escape_apps/models/reservation_provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class MyReservation extends StatelessWidget {
  const MyReservation({Key? key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('data_reservasi')
            .where('email', isEqualTo: user.email)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Menampilkan loading jika data masih diambil
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Text(
                'ANDA BELUM MELAKUKAN RESERVASI'); // Tampilkan pesan jika tidak ada data
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10, left: 16),
                child: Text(
                  'My Reservation',
                  style: TextStyle(
                    color: Color(0xFF35656F),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var reservation = snapshot.data!.docs[index];
                  return Card(
                    elevation: 10,
                    color: Color(0xFF8AB7BA),
                    margin: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${reservation['selectedDate'] != null ? DateFormat('dd - MMMM - yyyy').format(reservation['selectedDate'].toDate()) : 'Belum dipilih'}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Full Name : ${reservation['name']}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              'Number Phone : ${reservation['numbphone']}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              'Location : ${reservation['location']}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              'Concept : ${reservation['radioValue']}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              'Email : ${reservation['email']}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
      );
    } else {
      return Text('Tidak ada pengguna yang login');
    }
  }
}


// class MyReservation extends StatelessWidget {
//   const MyReservation({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(16.0),
//       child: ListView.builder(
//         //itemCount: userReservations.length,
//         itemBuilder: (context, index) {
//           return const Card(
//             elevation: 3,
//             margin: EdgeInsets.symmetric(vertical: 8.0),
//             child: Padding(
//               padding: EdgeInsets.all(12.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'NAME',
//                     style: TextStyle(color: Colors.black),
//                   ),
//                   Text(
//                     'NUMBPHONE',
//                     style: TextStyle(color: Colors.black),
//                   ),
//                   Text(
//                     'LOCATION',
//                     style: TextStyle(color: Colors.black),
//                   ),
//                   Text(
//                     'RADIOVALUE',
//                     style: TextStyle(color: Colors.black),
//                   ),
//                   Text(
//                     'EMAIL',
//                     style: TextStyle(color: Colors.black),
//                   ),
//                   Text(
//                     'DATE',
//                     style: TextStyle(color: Colors.black),
//                   ),
//                   // Text(
                  
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

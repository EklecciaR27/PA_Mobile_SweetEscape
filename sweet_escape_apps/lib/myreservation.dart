import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sweet_escape_apps/models/reservation.dart';
import 'package:sweet_escape_apps/models/reservation_provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'theme.dart';

class MyReservation extends StatelessWidget {
  const MyReservation({Key? key});

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;
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
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Text(
                'ANDA BELUM MELAKUKAN RESERVASI'); // Tampilkan pesan jika tidak ada data
          }

          return ListView(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10, left: 16),
                child: Text(
                  'My Reservation',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var reservation = snapshot.data!.docs[index];
                  return Card(
                    elevation: 10,
                    color: const Color(0xFF8AB7BA),
                    margin: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '${reservation['selectedDate'] != null ? DateFormat('dd - MMMM - yyyy').format(reservation['selectedDate'].toDate()) : 'Belum dipilih'}',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          margin:
                                              EdgeInsets.fromLTRB(50, 0, 0, 0),
                                          // padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                                          child: GestureDetector(
                                            onTap: () {
                                              if (reservation != null) {
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      title: const Text(
                                                          'Konfirmasi'),
                                                      content: const Text(
                                                          'Apakah Anda yakin ingin menghapus data ini?'),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: const Text(
                                                              'Batal'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () {
                                                            // Hapus data di Firestore
                                                            FirebaseFirestore
                                                                .instance
                                                                .collection(
                                                                    'data_reservasi')
                                                                .doc(reservation
                                                                    .id)
                                                                .delete()
                                                                .then((value) =>
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop())
                                                                .catchError(
                                                                    (error) =>
                                                                        print(
                                                                            "Gagal menghapus data: $error"));
                                                          },
                                                          child: const Text(
                                                              'Hapus'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              }

                                              //print("CIAAA DISINI YA TAP NYA");
                                            },
                                            child: Icon(
                                              Icons.delete_forever_outlined,
                                              color: const Color.fromARGB(
                                                  255, 241, 213, 189),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Full Name : ${reservation['name']}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  'Number Phone : ${reservation['numbphone']}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  'Location : ${reservation['location']}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  'Concept : ${reservation['radioValue']}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  'Email : ${reservation['email']}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            // Column(
                            //   //mainAxisAlignment: MainAxisAlignment.end,
                            //   crossAxisAlignment: CrossAxisAlignment.end,
                            //   children: [

                            //   ],
                            // )
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
      return const Text('Tidak ada pengguna yang login');
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
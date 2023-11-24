class Reservation {
  final String name;
  final String numbphone;
  final String location;
  final String radioValue;
  final String email;
  final DateTime selectedDate;

  Reservation({
    required this.name,
    required this.numbphone,
    required this.location,
    required this.radioValue,
    required this.email,
    required this.selectedDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'numbphone': numbphone,
      'location': location,
      'radioValue': radioValue,
      'email': email,
      'selectedDate': selectedDate,
    };
  }
}
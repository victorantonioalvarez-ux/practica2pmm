class Persona {
  String firstName;
  String lastName;
  String email;
  String password;
  DateTime birthdate;

  Persona({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.birthdate,
  });

  String get birthdateFormatted {
    String year = birthdate.year.toString();
    String month = birthdate.month.toString().padLeft(2, "0");
    String day = birthdate.day.toString().padLeft(2, "0");
    return "$day-$month-$year";
  }

  String get fullName => "$firstName $lastName";
}

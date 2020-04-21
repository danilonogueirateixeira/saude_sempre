class User {
  String uid;
  String name;
  String email;
  String photo;

  User(
    this.uid,
    this.name,
    this.email,
    this.photo,
  );

  // factory User.fromJson(dynamic json) {
  //   return Medicamento(json['uidUser'] as String, json['name'] as String,
  //       json['frequency'] as String, json['description'] as String);
  // }

  // @override
  // String toString() {
  //   return '{ ${this.uidUser},${this.name}, ${this.frequency},${this.description} }';
  // }
}

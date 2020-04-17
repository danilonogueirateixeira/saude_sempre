class Medicamento {
  String uidUser;
  String name;
  String frequency;
  String description;

  Medicamento(
    this.uidUser,
    this.name,
    this.frequency,
    this.description,
  );

  factory Medicamento.fromJson(dynamic json) {
    return Medicamento(json['uidUser'] as String, json['name'] as String,
        json['frequency'] as String, json['description'] as String);
  }

  @override
  String toString() {
    return '{ ${this.uidUser},${this.name}, ${this.frequency},${this.description} }';
  }
}

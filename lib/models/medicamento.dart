class Medicamento {
  String id;

  String uidUser;
  String name;
  String frequency;
  String description;

  Medicamento(
    this.id,
    this.uidUser,
    this.name,
    this.frequency,
    this.description,
  );

  factory Medicamento.fromJson(dynamic json) {
    return Medicamento(
        json['id'] as String,
        json['uidUser'] as String,
        json['name'] as String,
        json['frequency'] as String,
        json['description'] as String);
  }

  @override
  String toString() {
    return '{ ${this.id},${this.uidUser},${this.name}, ${this.frequency},${this.description} }';
  }
}

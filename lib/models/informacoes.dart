class Informacoes {
  String id;

  String uidUser;
  String titulo;
  String descricao;
  String data;

  Informacoes(
    this.id,
    this.uidUser,
    this.titulo,
    this.descricao,
    this.data,
  );

  factory Informacoes.fromJson(dynamic json) {
    return Informacoes(
        json['id'] as String,
        json['uidUser'] as String,
        json['titulo'] as String,
        json['descricao'] as String,
        json['data'] as String);
  }

  @override
  String toString() {
    return '{ ${this.id},${this.uidUser},${this.titulo}, ${this.descricao},${this.data} }';
  }
}

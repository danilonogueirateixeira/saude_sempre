class UserApi {
  String email;
  int id;
  String nome;
  String urlFoto;

  UserApi({this.email, this.id, this.nome, this.urlFoto});

  UserApi.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    id = json['id'];
    nome = json['nome'];
    urlFoto = json['urlFoto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['urlFoto'] = this.urlFoto;
    return data;
  }
}

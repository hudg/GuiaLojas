import 'package:flutter/cupertino.dart';

class Loja {
  int idLoja;
  String descricao;
  String endereco;
  String telefone;
  String email;
  String whatsapp;
  String url;
  String localizacao;
  bool favorito;
  String retorno;
  int posicao;
  int tipoContato;

  Loja(
      {this.idLoja = 0,
      this.descricao = "",
      this.endereco = "",
      this.telefone = "",
      this.email = "",
      this.whatsapp = "",
      this.url = "",
      this.localizacao = "",
      this.favorito = true,
      this.retorno = "",
      this.posicao = 0,
      this.tipoContato = 0});

  factory Loja.fromMap(Map map) {
    Loja obj = Loja();
    obj.idLoja = map['idLoja'];
    obj.descricao = map['descricao'];
    obj.endereco = map['endereco'];
    obj.telefone = map['telefone'];
    obj.email = map['email'];
    obj.url = map['url'];
    obj.localizacao = map['localizacao'];
    //obj.favorito = (map['favorito'] == 1 ? true : false);
    //obj.retorno = map['retorno'];

    return obj;
  }

  Loja.fromJson(Map<String, Object?> json)
      : this(
          idLoja: json['idLoja']! as int,
          //descricao: (json['descricao']! as List).cast<String>(),
          descricao: json['descricao']! as String,
          endereco: json['endereco']! as String,
          telefone: json['telefone']! as String,
          email: json['email']! as String,
          url: json['url']! as String,
          localizacao: json['localizacao']! as String,
        );

  Map<String, Object?> toJson() {
    return {
      'idLoja': idLoja,
      'descricao': descricao,
      'endereco': endereco,
      'telefone': telefone,
      'email': email,
      'url': url,
      'localizacao': localizacao,
    };
  }
}

class Loja {
  int idLoja;
  String titulo;
  String endereco;
  String telefone;
  String email;
  String whats;
  String site;
  String localizacao;
  bool favorito;
  String retorno;

  Loja(
      {this.idLoja = 0,
      this.titulo = "",
      this.endereco = "",
      this.telefone = "",
      this.email = "",
      this.whats = "",
      this.site = "",
      this.localizacao = "",
      this.favorito = true,
      this.retorno = ""});

  factory Loja.fromMap(Map map) {
    Loja obj = Loja();
    obj.idLoja = map['idLoja'];
    obj.titulo = map['titulo'];
    obj.favorito = (map['favorito'] == 1 ? true : false);
    obj.retorno = map['retorno'];

    return obj;
  }
}

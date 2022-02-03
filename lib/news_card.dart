import 'package:flutter/material.dart';
import 'constants.dart';
import 'models/loja.dart';

List<Loja> lsContato = [];

class NewsCard extends StatelessWidget {
  const NewsCard({
    Key? key,
    required this.loja,
  }) : super(key: key);

  final Loja loja;

  final double _height = 26;
  final double _width = 26;

  @override
  Widget build(BuildContext context) {
    _ordenacaoContatos(loja);
    return Column(
      children: [
        Row(
          children: [
            /* SizedBox(
              height: 60,
              width: 60,
              child: Image.asset(image),
            ), */
            const SizedBox(width: defaultPadding),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: defaultPadding / 2),
                    child: Text(
                      loja.titulo,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: defaultPadding / 2),
                    child: Text(
                      loja.endereco,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Row(children: [
                    _linha(lsContato[0].retorno, lsContato[0].tipoContato),
                    _linha(lsContato[1].retorno, lsContato[1].tipoContato),
                    _linha(lsContato[2].retorno, lsContato[2].tipoContato),
                    _linha(lsContato[3].retorno, lsContato[3].tipoContato),
                    _linha(lsContato[4].retorno, lsContato[4].tipoContato)
                  ])
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _ordenacaoContatos(Loja loja) {
    lsContato = [
      Loja(retorno: loja.telefone, tipoContato: 1),
      Loja(retorno: loja.whats, tipoContato: 2),
      Loja(retorno: loja.email, tipoContato: 3),
      Loja(retorno: loja.site, tipoContato: 4),
      Loja(retorno: loja.localizacao, tipoContato: 5)
    ];
    lsContato.sort((a, b) => a.retorno.compareTo(b.retorno));

    int pos = 5;
    for (var item in lsContato) {
      item.posicao = pos--;
    }

    lsContato.sort((a, b) => a.posicao.compareTo(b.posicao));
  }

  Row _linha(String icon, int tipoContato) {
    String pathImage = "assets/images/";
    if (tipoContato == 1) {
      pathImage += icon.isEmpty ? "branco.png" : "phone.png";
    } else if (tipoContato == 2) {
      pathImage += icon.isEmpty ? "branco.png" : "whatsapp.png";
    } else if (tipoContato == 3) {
      pathImage += icon.isEmpty ? "branco.png" : "email.png";
    } else if (tipoContato == 4) {
      pathImage += icon.isEmpty ? "branco.png" : "site.png";
    } else if (tipoContato == 5) {
      pathImage += icon.isEmpty ? "branco.png" : "location.png";
    } else {
      pathImage += "branco.png";
    }
    return Row(children: [
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        child: CircleAvatar(
          radius: 5,
          backgroundColor: Colors.transparent,
        ),
      ),
      SizedBox(height: _height, width: _width, child: Image.asset(pathImage))
      //child: Text(icon)),
    ]);
  }
}

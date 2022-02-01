import 'package:flutter/material.dart';
import 'constants.dart';
import 'models/loja.dart';

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
                  Row(
                    children: [
                      Row(children: [
                        _linha(1, loja.telefone),
                        _linha(2, loja.whats),
                        _linha(3, loja.email),
                        _linha(4, loja.site),
                        _linha(5, loja.localizacao),
                      ])
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Row _linha(int tipo, String icon) {
    String pathImage = "assets/images/";
    if (tipo == 1) {
      pathImage += icon.isEmpty ? "branco.png" : "phone.png";
    } else if (tipo == 2) {
      pathImage += icon.isEmpty ? "branco.png" : "whatsapp.png";
    } else if (tipo == 3) {
      pathImage += icon.isEmpty ? "branco.png" : "email.png";
    } else if (tipo == 4) {
      pathImage += icon.isEmpty ? "branco.png" : "site.png";
    } else if (tipo == 5) {
      pathImage += icon.isEmpty ? "branco.png" : "location.png";
    }

    return Row(children: [
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        child: CircleAvatar(
          radius: 5,
          backgroundColor: Colors.transparent,
        ),
      ),
      SizedBox(
        height: _height,
        width: _width,
        child: Image.asset(pathImage),
      ),
    ]);
  }
}

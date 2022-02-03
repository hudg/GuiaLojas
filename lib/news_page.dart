import 'package:flutter/material.dart';
import 'package:guialojas/constants.dart';
import 'package:guialojas/skeleton.dart';

import 'models/loja.dart';
import 'news_card.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late bool _isLoading;

  @override
  void initState() {
    _isLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  List<Loja> lojas = [
    Loja(
        idLoja: 1,
        titulo: "Loja 1",
        endereco: "endereco 1",
        telefone: "telefone 1",
        whats: "whats 1",
        email: "email@1",
        site: "site1",
        localizacao: "gps1"),
    Loja(
        idLoja: 2,
        titulo: "Loja 2",
        endereco: "endereco 2",
        telefone: "telefone 2",
        whats: "whats 2",
        email: "email@2",
        site: "site2",
        localizacao: ""),
    Loja(idLoja: 3, titulo: "Loja 3", endereco: "endereco 3", email: "hugo@3"),
    Loja(idLoja: 4, titulo: "Loja 4", endereco: "endereco 4", whats: "4444"),
    Loja(
        idLoja: 5,
        titulo: "Loja 5",
        endereco: "endereco 5",
        whats: "whats5",
        site: "W5"),
    Loja(
      idLoja: 6,
      titulo: "Loja 6",
      endereco: "endereco 6",
      whats: "W6",
      localizacao: "gps6",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Acesse as melhores lojas online",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: _isLoading
            ? ListView.separated(
                itemCount: 5,
                itemBuilder: (context, index) => const NewsCardSkelton(),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: defaultPadding),
              )
            : ListView.separated(
                itemCount: lojas.length,
                itemBuilder: (context, index) => NewsCard(loja: lojas[index]),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: defaultPadding),
              ),
      ),
    );
  }
}

class NewsCardSkelton extends StatelessWidget {
  const NewsCardSkelton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Skeleton(height: 120, width: 120),
        const SizedBox(width: defaultPadding),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Skeleton(width: 80),
              const SizedBox(height: defaultPadding / 2),
              const Skeleton(),
              const SizedBox(height: defaultPadding / 2),
              const Skeleton(),
              const SizedBox(height: defaultPadding / 2),
              Row(
                children: const [
                  Expanded(
                    child: Skeleton(),
                  ),
                  SizedBox(width: defaultPadding),
                  Expanded(
                    child: Skeleton(),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

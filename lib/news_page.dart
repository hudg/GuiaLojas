import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:guialojas/constants.dart';
import 'package:guialojas/skeleton.dart';
import 'models/loja.dart';
import 'news_card.dart';

late bool _isLoading = false;
List<Loja> lojas = [];

Future<List<Loja>> _buscarLojaFireBase() async {
  List<Loja> lista = [];
  await Firebase.initializeApp();
  FirebaseFirestore.instance
      .collection('loja')
      .get()
      .then((QuerySnapshot querySnapshot) {
    for (var doc in querySnapshot.docs) {
      //var idDoc = doc.id;
      //var idLoja = doc.get("idLoja");
      var descricao = doc.get("descricao");
      var endereco = doc.get("endereco");
      var telefone = "123";
      //doc.get("telefone");
      var whatsapp = doc.get("whatsapp");
      var email = doc.get("email");
      var url = "url";
      //doc.get("url");

      Loja obj = Loja(
        //idLoja: int.parse(idLoja),
        descricao: descricao,
        endereco: endereco,
        telefone: telefone,
        whatsapp: whatsapp,
        email: email,
        url: url,
      );

      lojas.add(obj);
      //lojas = lista;
    }
  }).whenComplete(() => _isLoading = false);

  return lojas;
}

Future<String> _buscarLojaFireBase2() async {
  List<Loja> lista = [];
  await Firebase.initializeApp();
  FirebaseFirestore.instance
      .collection('loja')
      .get()
      .then((QuerySnapshot querySnapshot) {
    //return querySnapshot.docs;

    for (var doc in querySnapshot.docs) {
      //var idDoc = doc.id;
      //var idLoja = doc.get("idLoja");
      var descricao = doc.get("descricao");
      var endereco = doc.get("endereco");
      var telefone = "123";
      //doc.get("telefone");
      var whatsapp = doc.get("whatsapp");
      var email = doc.get("email");
      var url = "url";
      //doc.get("url");

      Loja obj = Loja(
        //idLoja: int.parse(idLoja),
        descricao: descricao,
        endereco: endereco,
        telefone: telefone,
        whatsapp: whatsapp,
        email: email,
        url: url,
      );

      lista.add(obj);
    }
  }).whenComplete(() => _isLoading = false);

  var array = json.encode(lista);
  return array;
}
/* void _dadosLojas() {
  Loja obj = Loja(
    //idLoja: int.parse(idLoja),
    descricao: "123456",
    endereco: "endereco",
    telefone: "telefone",
    whatsapp: "whatsapp",
    email: "email",
    url: "url",
  );
  lojas.add(obj);
} */

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder<List<Loja>>(
            future: _buscarLojaFireBase(),
            builder: (BuildContext context, AsyncSnapshot<List<Loja>> lojas) {
              //var array = json.decode(dados.data.);

              if (_isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return _MyScaffold(context, lojas);
            }
            //builder: (context, snapshot) {
            /* builder: (BuildContext context, snapshot) {
            List<Loja> lsLoja = [];

            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(
                  child: Text("none"),
                );
                break;
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
                break;
              case ConnectionState.active:
                return Center(
                  child: Text("active"),
                );
                break;
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Center(
                    child: Text("Problema com a conexão de internet..."),
                  );
                } else {
                  var array = json.decode(snapshot.data);

                  for (var doc in array) {
                    var descricao = doc.get("descricao");
                    var endereco = doc.get("endereco");
                    var telefone = "123";
                    var whatsapp = doc.get("whatsapp");
                    var email = doc.get("email");
                    var url = "url";

                    Loja obj = Loja(
                      descricao: descricao,
                      endereco: endereco,
                      telefone: telefone,
                      whatsapp: whatsapp,
                      email: email,
                      url: url,
                    );

                    lsLoja.add(obj);
                  }
                }

                break;
            }

            return _MyScaffold(context, lsLoja);
          }, */
            ),
      ),
    );
  }
}

Scaffold _MyScaffold(context, lista) {
  return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      backgroundColor: Colors.purple,
      elevation: 0,
      /* title: const Text(
          "Acesse as melhores lojas online",
          style: TextStyle(color: Colors.black),
        ), */
      title: Image.asset(
        'assets/images/icone.png',
        height: 50,
        width: 80,
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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:guialojas/constants.dart';
import 'package:guialojas/skeleton.dart';
import 'models/loja.dart';
import 'news_card.dart';

List<Loja> lojas = [];

Future<List<Loja>> _buscarLojaFireBase() async {
  //lojas = <Loja>[];
  await Firebase.initializeApp();

  List<Loja> lojas2 = [];

  FirebaseFirestore.instance
      .collection('loja')
      .get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      //var idDoc = doc.id;
      var idLoja = doc.get("idLoja");
      var descricao = doc.get("descricao");
      var endereco = doc.get("endereco");
      var telefone = "123";
      //doc.get("telefone");
      var whatsapp = doc.get("whatsapp");
      var email = doc.get("email");
      var url = "url";
      //doc.get("url");

      Loja obj = Loja(
        idLoja: int.parse(idLoja),
        descricao: descricao,
        endereco: endereco,
        telefone: telefone,
        whatsapp: whatsapp,
        email: email,
        url: url,
      );

      lojas.add(obj);
    });
  });

  /* QuerySnapshot querySnapshot = await db.collection("produto").getDocuments();

  for (DocumentSnapshot loja in querySnapshot.documents) {
    var item = loja.data;
    Loja obj = Loja(
      idLoja: int.parse(item["idLoja"].toString()),
      descricao: item["descricao"].toString(),
      endereco: item["endereco"].toString(),
      telefone: item["telefone"].toString(),
      whatsapp: item["whatsapp"].toString(),
      email: item["email"].toString(),
      url: item["url"].toString(),
    );

    lojas.add(obj);

    lojas.add(Loja.fromMap(item));
  } */

  return lojas;
}

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late bool _isLoading;

  @override
  void initState() async {
    await _buscarLojaFireBase();
    _isLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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

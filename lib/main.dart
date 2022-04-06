import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:guialojas/news_page.dart';

import 'models/loja.dart';

List<Loja> lojas = [];

Future<List<Loja>> _buscarLojaFireBase() async {
  await Firebase.initializeApp();

  List<Loja> lista = [];
  FirebaseFirestore.instance
      .collection('loja')
      .get()
      .then((QuerySnapshot querySnapshot) async {
    for (var doc in querySnapshot.docs) {
      //var idLoja = doc.get("idLoja");
      var descricao = doc.get("descricao");
      var endereco = doc.get("endereco");
      var telefone = "123";
      var whatsapp = doc.get("whatsapp");
      var email = doc.get("email");
      var url = "url";

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

    return lista;
  });

  return lojas;
}

void main() {
  //Configuração Firebase
  //WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /*  late bool _isLoading;
  @override
  void initState() {
    _isLoading = true;

    setState(() {
      //var teste = _buscarLojaFireBase();
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  } */

  @override
  Widget build(BuildContext context) {
    //_buscarLojaFireBase();
    /* var lojas2 = lojas;
    Future.delayed(const Duration(seconds: 10), () async {
      lojas2 = await _buscarLojaFireBase();
    });
 */
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const NewsPage(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: const [Locale('pt', 'BR')],
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

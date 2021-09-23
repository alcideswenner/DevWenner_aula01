import 'package:aula_01/model/user.dart';
import 'package:aula_01/utils/config.dart';
import 'package:aula_01/utils/request.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<User>> request() async {
    var response =
        await Dio().get(URL_BASE + "/sellers"); //e=={"id":1,"name":"Logan"}
    List data = response.data; //map
    return data
        .map((e) => User.fromJson(e))
        .toList(); /////conveter para obj e add na list
  }

  late Future<List<User>> listaFuture;
  void inicializa() async {
    await request().then((value) {
      listaFuture = request();
    });
  }

  @override
  Widget build(BuildContext context) {
    inicializa();
    return Scaffold(
      appBar: AppBar(
        title: Text(name_app),
      ),
      body: FutureBuilder<List<User>>(
        future: request(),
        builder: (context, snap) {
        
        switch (snap.connectionState) {
          case ConnectionState.waiting:
            return CircularProgressIndicator();
          case ConnectionState.done:
            return Text("Tudo ok");

          default:
          return Text(snap.data![1].name.toString());
        }
      }),
      bottomSheet: Container(
        height: 50,
      ),
    );
  }
}

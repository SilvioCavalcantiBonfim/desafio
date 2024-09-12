import 'package:flutter/material.dart';
import 'second_screen.dart';
import 'terceira_screen.dart';
import 'dart:io';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

  class _HomeScreenState extends State<HomeScreen> {
    String _homeTitle = "";

    void _updateTitle(){
      setState(() {
        _homeTitle = "Boas-Vindas";
      });
    }

  //Components
  Widget _titleSideBar() {
    return const DrawerHeader(
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
      child: Text(
        'Drawer Header',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),
      ),
    );
  }

  ListTile _listItem(String text, Icon icon, void Function()? action){
    return ListTile(
              title: Text(text),
              leading: icon,
              onTap: action
            );
  }
  //builder
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela Inicial'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _titleSideBar(),
            _listItem("Página Inicial", const Icon(Icons.home), () {
                _updateTitle();
                Navigator.pop(context);
              }),
              _listItem("Segunda Tela", const Icon((Icons.arrow_forward)), () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen()));
              })
              ,
              _listItem("Terceira Tela", const Icon((Icons.arrow_forward)), () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TerceiraScreen()));
              })
          ],
        ),
      ),
      body: Center(
        child: Text(
        _homeTitle,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    final client = super.createHttpClient(context);
    client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    return client;
  }
}
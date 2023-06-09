import 'package:flutter/material.dart';
import 'package:iotproject/provider/block_provider.dart';
import 'package:iotproject/settings.dart';
import 'package:web_socket_channel/io.dart';

import 'home.dart';
import 'info.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const PetFeederController(),
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
      ),
    );
  }
}

class PetFeederController extends StatefulWidget {
  const PetFeederController({super.key});

  @override
  State<StatefulWidget> createState() {
    return _WebSocketLed();
  }
}

class _WebSocketLed extends State<PetFeederController> {
  int _selectedIndex = 0;

  final List<Widget> _widgets = [
    const Home(),
    const Info(),
    const Settings(),
  ];

  final List<String> _titles = [
    "Home",
    "Info",
    "Settings",
  ];

  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles.elementAt(_selectedIndex)),
        backgroundColor: Colors.amber[800],
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _widgets.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

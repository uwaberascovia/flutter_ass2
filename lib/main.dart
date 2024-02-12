import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_ass2/calc.dart';
import 'package:flutter_ass2/contact.dart';
import 'package:flutter_ass2/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPage = 0;
  int selectedDrawerIndex = 0;
  List<Widget> pages = [
    const HomePage(),
    CalculatorPage(),
    const Contact(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Assigments 2',
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.amber[50],
        child: ListView(children: [
          UserAccountsDrawerHeader(
            accountName: const Text(
              'UWABERA Ange Scovia',
              //style: TextStyle(color: Colors.green),
            ),
            accountEmail: const Text(
              'uwaberaange143@gmail.com',
              //style: TextStyle(color: Colors.green),
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'images/image1.jpg',
                ),
              ),
            ),
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                'images/image2.jpg',
              ),
              fit: BoxFit.cover,
              opacity: 100,
            )),
          ),
          // const ListTile(
          //   title: Text('Home'),
          //   leading: Icon(Icons.home),
          // ),
          // const ListTile(
          //   title: Text('Calculator'),
          //   leading: Icon(Icons.calculate),
          // ),
          // const ListTile(
          //   title: Text('Contacts'),
          //   leading: Icon(Icons.person),
          // ),
          buildDrawerItem(0, 'Home', Icons.home),
          buildDrawerItem(1, 'Calculator', Icons.calculate),
          buildDrawerItem(2, 'Contacts', Icons.person),
        ]),
      ),
      body: pages[currentPage],
      bottomNavigationBar: NavigationBar(
        destinations: [
          const NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          const NavigationDestination(
              icon: Icon(Icons.calculate), label: 'Calculator'),
          const NavigationDestination(
              icon: Icon(Icons.person), label: 'Contact'),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }

  ListTile buildDrawerItem(int index, String title, IconData icon) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      onTap: () {
        // Navigate to the corresponding page and update the selected index
        Navigator.pop(context); // Close the drawer
        setState(() {
          currentPage = index;
          selectedDrawerIndex = index;
        });
      },
      selected: selectedDrawerIndex == index, // Highlight the selected item
    );
  }
}

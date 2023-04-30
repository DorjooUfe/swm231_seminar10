import 'package:flutter/material.dart';
import 'package:seminar10/team.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const Seminar10(title: 'Семинар 10'),
    );
  }
}

class Seminar10 extends StatefulWidget {
  const Seminar10({super.key, required this.title});

  final String title;

  @override
  State<Seminar10> createState() => _Seminar10State();
}

class _Seminar10State extends State<Seminar10> {
  final List<Team> teams = [
    Team(
      name: 'Basketball teams',
      subMenu: [
        SubMenu(name: 'Lakers'),
        SubMenu(name: "Golden state"),
        SubMenu(name: 'Boston'),
      ],
    ),
    Team(
      name: 'Football teams',
      subMenu: [
        SubMenu(name: 'German'),
        SubMenu(name: "Brazil"),
        SubMenu(name: 'Italy'),
        SubMenu(name: 'Spain'),
        SubMenu(name: 'Netherlands'),
      ],
    ),
    Team(
      name: 'Dota 2 teams',
      subMenu: [
        SubMenu(name: 'PSG.Lgd'),
        SubMenu(name: "Team Liquid"),
        SubMenu(name: 'Team Spirit'),
        SubMenu(name: 'Gaimin Gladiators'),
        SubMenu(name: 'Team Aster'),
        SubMenu(name: 'Shopify Rebellion'),
        SubMenu(name: 'Talon Esports'),
        SubMenu(name: 'Xtreme Gaming'),
        SubMenu(name: 'Team SMG'),
        SubMenu(name: 'Invictus Gaming'),
        SubMenu(name: 'Tundra Esports'),
        SubMenu(name: 'beastcoast'),
        SubMenu(name: 'BetBoom'),
        SubMenu(name: 'TSM'),
        SubMenu(name: 'Execration'),
        SubMenu(name: 'Evil Geniuses'),
        SubMenu(name: 'IHC'),
        SubMenu(name: 'Team Tough'),
        SubMenu(name: 'Geek Slate'),
        SubMenu(name: 'Boom Esports'),
      ],
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          if (teams[index].subMenu!.isEmpty) {
            return ListTile(title: Text(teams[index].name!));
          }
          return ExpansionTile(
              onExpansionChanged: (value) {
                if (value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(teams[index].name!)));
                }
              },
              key: PageStorageKey(teams[index]),
              title: Text(teams[index].name!),
              children: teams[index]
                  .subMenu!
                  .map((e) => GestureDetector(
                        onTap: () => ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(e.name!))),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          child: Text(e.name!),
                        ),
                      ))
                  .toList());
        },
        itemCount: teams.length,
      ),
    );
  }
}

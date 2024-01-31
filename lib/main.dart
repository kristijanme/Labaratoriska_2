import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class Clothing {
  String name;

  Clothing(this.name);
}

class MyHomePage extends StatefulWidget {
  @overridegit commit -m "Initial commit"
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Clothing> clothes = [
    Clothing("T-Shirt"),
    Clothing("Jeans"),
    Clothing("Sweater"),
  ];

  TextEditingController clothingController = TextEditingController();
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("201118"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: clothes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    clothes[index].name,
                    style: TextStyle(color: Colors.blue),
                  ),
                  tileColor: index == selectedIndex ? Colors.grey[300] : null,
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _editClothing(index);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                        ),
                        child: Text(
                          "Измени",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          _deleteClothing(index);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                        ),
                        child: Text(
                          "Избриши",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                _addClothing();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              child: Text(
                "Додади",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _addClothing() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Додади облека"),
          content: TextField(
            controller: clothingController,
            decoration: InputDecoration(labelText: "Внесете име на облека"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Откажи"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  clothes.add(Clothing(clothingController.text));
                });
                Navigator.pop(context);
              },
              child: Text("Додади"),
            ),
          ],
        );
      },
    );
  }

  void _editClothing(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        clothingController.text = clothes[index].name;
        return AlertDialog(
          title: Text("Едитирај облека"),
          content: TextField(
            controller: clothingController,
            decoration: InputDecoration(labelText: "Измени име на облека"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Откажи"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  clothes[index].name = clothingController.text;
                });
                Navigator.pop(context);
              },
              child: Text("Зачувај"),
            ),
          ],
        );
      },
    );
  }

  void _deleteClothing(int index) {
    setState(() {
      clothes.removeAt(index);
      if (selectedIndex == index) {
        selectedIndex = -1;
      }
    });
  }
}

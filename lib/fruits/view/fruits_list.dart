import 'package:flutter/material.dart';
import '../data/fruits_data.dart';

class FruitsList extends StatefulWidget {
  const FruitsList({Key? key}) : super(key: key);

  @override
  State<FruitsList> createState() => _FruitsListState();
}

class _FruitsListState extends State<FruitsList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: fruits.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Dismissible(
                background: Container(
                  color: Colors.red,
                ),
                onDismissed: (DismissDirection direction) {
                  setState(() {
                    fruits.removeAt(index);
                  });
                },
                key: UniqueKey(),
                child: Card(
                  child: ListTile(
                    title: Text(fruits[index].title),
                    tileColor: const Color(0xffE5F4E7),
                    onTap: () {
                      _dialogBuilder(
                          fruits[index].title, fruits[index].description);
                    },
                    onLongPress: () {
                      _dialogChangeItem(index);
                    },
                  ),
                )),
          );
        },
      ),
    );
  }

  void _dialogBuilder(titleFruit, fruitDes) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(titleFruit),
            content: Text(fruitDes),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    _dismissDialog();
                  },
                  child: const Text('Close')),
            ],
          );
        });
  }

  void _dialogChangeItem(index) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Edit fruit',
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        fruits[index].title = value;
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Edit description',
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        fruits[index].description = value;
                        return null;
                      },
                    ),
                  ],
                )),
            // content: Text(fruitDes),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      _dismissDialog();
                      setState(() {});
                    }
                  },
                  child: const Text('Edit')),
            ],
          );
        });
  }

  _dismissDialog() {
    Navigator.pop(context);
  }
}

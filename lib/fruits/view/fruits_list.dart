import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FruitsList extends StatefulWidget {
  const FruitsList({Key? key}) : super(key: key);

  @override
  State<FruitsList> createState() => _FruitsListState();
}

class _FruitsListState extends State<FruitsList> {
  List<String> fruits = [
    "Яблоко",
    "Банан",
    "Апельсин",
    "Груша",
    "Ананас",
    "Манго",
    "Киви",
    "Персик",
    "Виноград",
    "Клубника",
    "Черника",
    "Малина",
    "Голубика",
    "Арбуз",
    "Дыня",
    "Гранат",
    "Лимон",
    "Лайм"
  ];
  List<String> fruitsDes = [
    "Яблоко - круглый или овальный плод сочного сладкого или кислого вкуса, с тонкой кожицей и сочной мякотью, обычно зеленого, желтого или красного цвета.",
    "Банан - длинный и изогнутый плод, покрытый желтой кожурой, содержащий мягкую и сладкую мякоть, богатую калием",
    "Апельсин - круглый или овальный плод с тонкой кожицей, имеющий сочную мякоть, богатую витамином С, и сладкий или кислый вкус.",
    "Груша - овальный плод с тонкой кожурой и сочной мякотью, сладкой или кислой на вкус, часто зеленого или желтого цвета.",
    "Ананас - крупный, колючий плод с жесткой внешней оболочкой, содержащий сочную, сладкую и ароматную мякоть",
    "Манго - фрукт с желтой кожурой и сочной оранжевой мякотью. Имеет сладкий вкус и используется в кулинарии, а также в приготовлении десертов и соков.",
    "Киви - маленький фрукт с коричневой кожурой и ярко-зеленой мякотью, которая имеет кисло-сладкий вкус. Часто употребляется в свежем виде или в приготовлении десертов и салатов.",
    "Персик - округлый фрукт с пушистой кожурой и сочной мякотью. Имеет сладкий вкус и используется в кулинарии, а также в приготовлении десертов и консервов.",
    "Виноград - круглые ягоды на коротких стебельках, которые имеют сладкий и сочный вкус. Часто употребляются в свежем виде, но также используются",
    "Клубника - маленькие ягоды с ярко-красной окраской и сладким вкусом. Часто употребляются в свежем виде, а также используются в приготовлении десертов, варенья и соусов.",
    "Черника маленькие ягоды с голубой окраской и сладким вкусом. Часто употребляются в свежем виде, а также используются в приготовлении десертов, варенья и соусов.",
    "Малина - маленькие ягоды с ярко-красной окраской и сладко-кислым вкусом.",
    "Голубика - маленькие ягоды с голубой окраской и сладким вкусом. ",
    "Арбуз - крупный ягодный фрукт с толстой зеленой кожурой и красной сочной мякотью, которая имеет сладкий вкус. Часто употребляется в свежем виде, особенно в жаркие летние дни.",
    "Дыня - большой и округлый фрукт с желтой или зеленой кожурой и сочной сладкой мякотью, которая часто содержит много воды. ",
    "Гранат - круглый фрукт с красной кожурой и рубиновыми зернами внутри, которые содержат сочный и кисло-сладкий сок.",
    "Лимон - маленький цитрусовый фрукт с ярко-желтой кожурой и кислой мякотью. ",
    "Лайм - маленький цитрусовый фрукт с ярко-зеленой кожурой и кисло-сладкой мякотью"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: fruits.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
              onDismissed: (DismissDirection direction) {
                setState(() {
                  fruits.removeAt(index);
                });
              },
              key: UniqueKey(),
              child: ListTile(
                title: Text(fruits[index]),
                onTap: () {
                  _dialogBuilder(fruits[index], fruitsDes[index]);
                },
                onLongPress: () {
                  _dialogChangeItem(index);
                },
              ));
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
                      fruits[index] = value;
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
                      fruitsDes[index] = value;
                      return null;
                    },
                  ),
                ],
              )
            ),
            // content: Text(fruitDes),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      _dismissDialog();
                      setState(() {});
                    }
                  },
                  child: const Text('Edit')
              ),
            ],
          );
        });
  }

  _dismissDialog() {
    Navigator.pop(context);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import 'displayPg.dart';

class IntegerListProvider extends ChangeNotifier {
  List<int> _integerList = [];

  List<int> get integerList => _integerList;

  void setIntegerList(List<int> integerList) {
    _integerList = integerList;
    notifyListeners();
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<int> intgs = [];
    final TextEditingController no = TextEditingController();
    IntegerListProvider integerListProvider = IntegerListProvider();
    return Scaffold(
      appBar: AppBar(
        title: const Text('TestApp'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DisplayNos()),
              );
            },
          ),
        ],
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        TextField(
          controller: no,
          decoration: InputDecoration(
            labelText: 'Enter Number',
            hintText: "Enter Number",
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.grey, width: 2),
            ),
          ),
        ),
        FloatingActionButton(
          onPressed: () {
            intgs.add(int.parse(no.text));
            Provider.of<IntegerListProvider>(context, listen: false)
                .setIntegerList(intgs);
            //integerListProvider.setIntegerList(intgs);
          },
          child: Text('Submit'),
        )
      ]),
    );
  }
}

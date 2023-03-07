import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:venture_test/homepage.dart';

import 'listwidget.dart';

class DisplayNos extends StatefulWidget {
  const DisplayNos({super.key});

  @override
  State<DisplayNos> createState() => _DisplayNosState();
}

class _DisplayNosState extends State<DisplayNos> {
  @override
  Widget build(BuildContext context) {
    return Consumer<IntegerListProvider>(
      builder: (context, integerListProvider, _) {
        print(integerListProvider.integerList.length);
        return Scaffold(
          appBar: AppBar(
            title: Text('Integer List'),
          ),
          body: ListView.builder(
            itemCount: integerListProvider.integerList.length,
            itemBuilder: (context, index) {
              int intg = integerListProvider.integerList[index];
              return ListWidget(
                intg: intg,
              );
            },
          ),
        );
      },
    );
  }
}

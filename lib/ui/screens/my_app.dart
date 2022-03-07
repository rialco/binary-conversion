import 'package:flutter/material.dart';

import '../widgets/binary_decimal.dart';
import '../widgets/decimal_binary.dart';

class Converter extends StatefulWidget {
  const Converter({Key? key}) : super(key: key);

  @override
  _ConverterState createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {

  int _converterType = 0;
  String _converterText = "Binary -> Decimal";


  void _changeConverter() {
    int tempType = 0; 
    String tempText = "Binary -> Decimal";
    if(_converterType == 0) tempType = 1;

    if (tempType == 1) tempText = "Decimal -> Binary";

    setState(() {
      _converterType = tempType;
      _converterText = tempText;
    }); 

  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Converter',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Converter')
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextButton(
                        key: const Key('switch'),
                        child: Text(_converterText),
                        onPressed: _changeConverter,
                      ),
                    )
                ),
                Expanded(child: _converterType == 0 ? const BinaryToDecimal() : const DecimalToBinary()),
              ],
            )));
  }
}

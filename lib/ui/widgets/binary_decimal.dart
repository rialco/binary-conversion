import 'package:flutter/material.dart';

class BinaryToDecimal extends StatefulWidget {
  const BinaryToDecimal({Key? key}) : super(key: key);

  @override
  _BinaryToDecimalState createState() => _BinaryToDecimalState();
}

class _BinaryToDecimalState extends State<BinaryToDecimal> {
  String _binary = "";
  String _decimal = "0"; 
  // _decimal = int.parse(_binary, radix: 2).toRadixString(10);

  void _onPressed(input) {
    String tempBin = _binary;
    tempBin += input.toString();
    if (input == 2) {
      tempBin = "";
    }
    setState(() {
      _binary = tempBin;
      _decimal = "0";
      if(tempBin != "") {
        _decimal = int.parse(tempBin, radix: 2).toRadixString(10);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0), 
                child: Text(_binary, style: const TextStyle(
                  color: Colors.blueGrey, 
                  fontSize: 30, 
                  fontWeight: FontWeight.w600
                  ),
                )
              )
            ],
          )
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0), 
                child: Text(_decimal, style: const TextStyle(
                  color: Colors.lightGreen, 
                  fontSize: 50, 
                  fontWeight: FontWeight.w600
                  ),
                )
              )
            ],
          )
        ),
        Expanded(
          flex: 3,
          child: Row(
            children: [
              Expanded(
                child: keyNumber(0)
              ),
              Expanded(
                child: keyNumber(1)
              )
            ],
          )
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () => _onPressed(2),
              child: const Text("Clear", style: TextStyle(fontSize: 20),),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                primary: Colors.blueGrey
              ),
            )
          )
        )
      ]
    );
  }

  Widget keyNumber(number) {
    return 
    Padding(
      padding:const EdgeInsets.all(20), 
      child: ElevatedButton(
        onPressed: () => _onPressed(number),
        child: Text(number.toString(), style: const TextStyle(fontSize: 40),),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(200)
        )
      )
    );
  }
}

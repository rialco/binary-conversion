import 'package:flutter/material.dart';

class DecimalToBinary extends StatefulWidget {
  const DecimalToBinary({Key? key}) : super(key: key);

  @override
  _DecimalToBinaryState createState() => _DecimalToBinaryState();
}

class _DecimalToBinaryState extends State<DecimalToBinary> {
  String _binary = "0";
  String _decimal = ""; 
  // _decimal = int.parse(_binary, radix: 2).toRadixString(10);
 
  void _onPressed(input) {
    String tempDecimal = _decimal;
    tempDecimal += input.toString();

    if (input == -1) {
      tempDecimal = "";
    }
    setState(() {
      _decimal = tempDecimal;
      _binary = "0";
      if(tempDecimal != "") {
        _binary = int.parse(tempDecimal, radix: 10).toRadixString(2);
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
                child: Text(_decimal, style: const TextStyle(
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
                child: Text(_binary, style: const TextStyle(
                  color: Colors.lightGreen, 
                  fontSize: 40, 
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
            children: [
              Expanded(
                child: keyNumber(1)
              ),
              Expanded(
                child: keyNumber(2)
              ),
              Expanded(
                child: keyNumber(3)
              )
            ],
          )
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Expanded(
                child: keyNumber(4)
              ),
              Expanded(
                child: keyNumber(5)
              ),
              Expanded(
                child: keyNumber(6)
              )
            ],
          )
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Expanded(
                child: keyNumber(7)
              ),
              Expanded(
                child: keyNumber(8)
              ),
              Expanded(
                child: keyNumber(9)
              )
            ],
          )
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Expanded(
                child: 
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () => _onPressed(-1),
                    child: const Text("Clear", style: TextStyle(fontSize: 20),),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(200),
                      primary: Colors.blueGrey
                    ),
                  )
                )
              ),
              Expanded(
                child: keyNumber(0)
              )
            ],
          )
        )
      ]
    );
  }

  Widget keyNumber(number) {
    return 
    Padding(
      padding:const EdgeInsets.all(10), 
      child: ElevatedButton(
        onPressed: () => _onPressed(number),
        child: Text(number.toString(), style: const TextStyle(fontSize: 30),),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(200)
        )
      )
    );
  }
}

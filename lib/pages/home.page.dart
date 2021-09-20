import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:semanda2flutter1/widgets/botones.widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> operation = [];
  // String operation = "";
  String result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora"),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 3,
              child: Container(
                child: Row(
                  children: [
                    Text(result),
                  ],
                ),
                color: Colors.grey.shade900,
              )),
          Expanded(
              flex: 1,
              child: Container(
                child: Row(
                  children: [
                    Text(operation.join("")),
                  ],
                ),
                // color: Colors.red,
              )),
          Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: _listaBotonesFila1Prueba()),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: _listaBotonesFila2()),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: _listaBotonesFila3()),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: _listaBotonesFila4()),
                  ],
                ),
                // color: Colors.green,
              )),
        ],
      ),
    );
  }

  _listaBotonesFila1Prueba() {
    return [
      pintarBoton(
          metodo: () {
            setState(() {
              operation.add("7");
            });
          },
          compoente: Text("7")),
      pintarBoton(
          metodo: () {
            setState(() {
              operation.add("8");
            });
          },
          compoente: Text("8")),
      pintarBoton(
          metodo: () {
            setState(() {
              operation.add("9");
            });
          },
          compoente: Text("9")),
      pintarBoton(
          metodo: () {
            setState(() {
              operation.add("÷");
            });
          },
          compoente: Text("÷")),
      pintarBoton(
          metodo: () {
            setState(() {
              if (operation.isNotEmpty) {
                operation.removeLast();
              }
            });
          },
          compoente: Icon(Icons.backspace)),
      pintarBoton(
          metodo: () {
            setState(() {
              operation = [];
            });
          },
          compoente: Text("C")),
    ];
  }

  _listaBotonesFila2() {
    return [
      pintarBoton(
          metodo: () {
            setState(() {
              operation.add("4");
            });
          },
          compoente: Text("4")),
      pintarBoton(
          metodo: () {
            setState(() {
              operation.add("5");
            });
          },
          compoente: Text("5")),
      pintarBoton(
          metodo: () {
            setState(() {
              operation.add("6");
            });
          },
          compoente: Text("6")),
      pintarBoton(
          metodo: () {
            setState(() {
              operation.add("*");
            });
          },
          compoente: Text("x")),
      pintarBoton(
          metodo: () {
            setState(() {
              operation.add("(");
            });
          },
          compoente: Text("(")),
      pintarBoton(
          metodo: () {
            setState(() {
              operation.add(")");
            });
          },
          compoente: Text(")")),
    ];
  }

  _listaBotonesFila3() {
    return [
      pintarBoton(
          metodo: () {
            setState(() {
              operation.add("1");
            });
          },
          compoente: Text("1")),
      pintarBoton(
          metodo: () {
            setState(() {
              operation.add("2");
            });
          },
          compoente: Text("2")),
      pintarBoton(
          metodo: () {
            setState(() {
              operation.add("3");
            });
          },
          compoente: Text("3")),
      pintarBoton(
          metodo: () {
            setState(() {
              operation.add("-");
            });
          },
          compoente: Text("-")),
      pintarBoton(
          metodo: () {
            setState(() {
              operation.add("²");
            });
          },
          compoente: Text("x²")),
      pintarBoton(
          metodo: () {
            setState(() {
              operation.add("√(");
            });
          },
          compoente: Text("√")),
    ];
  }

  _listaBotonesFila4() {
    return [
      pintarBoton(
          metodo: () {
            setState(() {
              operation.add("0");
            });
          },
          compoente: Text("0")),
      pintarBoton(
          metodo: () {
            setState(() {
              operation.add(",");
            });
          },
          compoente: Text(",")),
      pintarBoton(
          metodo: () {
            setState(() {
              operation.add("%");
            });
          },
          compoente: Text("%")),
      pintarBoton(
          metodo: () {
            setState(() {
              operation.add("+");
            });
          },
          compoente: Text("+")),
      pintarBoton(
          metodo: () {
            setState(() {
              String oper = operation.join("");
              try {
                String clean_oper = oper
                    .replaceAll("√", "sqrt")
                    .replaceAll("²", "^2")
                    .replaceAll("÷", "/")
                    .replaceAll(",", ".");
                Parser p = Parser();
                Expression exp = p.parse(clean_oper);
                ContextModel cm = ContextModel();
                final resultStr =
                    exp.evaluate(EvaluationType.REAL, cm).toString();
                result = "${result} \n${oper}=${resultStr}  ";
                operation = [];
              } catch (e) {
                result = "${result} \n${oper} :${e.toString().split(":")[1]}";
              }
            });
          },
          valorFlex: 2,
          compoente: Text("="),
          colorBoton: Colors.green),
    ];
  }
}

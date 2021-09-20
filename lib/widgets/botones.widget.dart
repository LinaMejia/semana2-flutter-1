import 'package:flutter/material.dart';

Widget pintarBoton(
    {required dynamic metodo,
    int valorFlex = 1,
    required Widget compoente,
    dynamic colorBoton}) {
  return Expanded(
      flex: valorFlex,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: colorBoton != null
                      ? colorBoton
                      : ThemeData.dark().backgroundColor),
              onPressed: metodo,
              child: compoente),
        ),
      ));
}

import 'package:flutter/material.dart';
import 'package:flutter_money_manager/core/provider/keyboard_provider.dart';
import 'package:provider/provider.dart';

class CustomKeyboardWidgets extends StatelessWidget {
  const CustomKeyboardWidgets({super.key, required this.onKeyTap});

  final Function(String) onKeyTap;

  @override
  Widget build(BuildContext context) {
    final keys = [
      ['+', '-', '×', '÷'],
      ['7', '8', '9', '='],
      ['4', '5', '6', '.'],
      ['1', '2', '3', Icons.backspace],
      ['0', 'OK'],
    ];
    return Container(
      color: Colors.black87,
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: keys.expand((e) => e).length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        itemBuilder: (context, index) {
          var key = keys.expand((e) => e).toList()[index];

          Color buttonColor;
          if (key is String) {
            if (key == "OK") {
              buttonColor = Colors.redAccent;
            } else if (["+", "-", "×", "÷", "="].contains(key)) {
              buttonColor = Colors.orangeAccent;
            } else {
              buttonColor = Colors.black54;
            }
          } else {
            buttonColor = Colors.grey;
          }

          return GestureDetector(
            onTap: () {
              if (key is String) {
                onKeyTap(key);
              } else if (key == Icons.backspace) {
                Provider.of<KeyboardProvider>(
                  context,
                  listen: false,
                ).removeCharacter();
              }
            },
            child: Container(
              margin: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: buttonColor,
              ),
              child: Center(
                child:
                    key is IconData
                        ? Icon(key, color: Colors.white)
                        : Text(
                          key.toString(),
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                        ),
              ),
            ),
          );
        },
      ),
    );
  }
}

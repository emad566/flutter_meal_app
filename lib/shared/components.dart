import 'package:flutter/material.dart';

Widget myText(String text, {TextStyle style}){
  return Text(
    text, style: style != null? style.copyWith(fontSize: 26) : const TextStyle(fontSize: 26),
  );
}

void navigateTo(BuildContext context, Widget screen){
  Navigator.of(context).push(
    MaterialPageRoute(builder: (_) {
      return screen;
    }),
  );
}

void navigateReplaceTo(BuildContext context, Widget screen){
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (_) {
      return screen;
    }),
  );
}
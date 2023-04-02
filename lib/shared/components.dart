import 'package:flutter/cupertino.dart';

Widget myText(String text, {TextStyle style}){
  return Text(
    text, style: style != null? style.copyWith(fontSize: 26) : const TextStyle(fontSize: 26),
  );
}
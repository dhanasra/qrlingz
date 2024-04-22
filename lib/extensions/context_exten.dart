import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  goto(String path){
    Navigator.pushNamed(this, path);
  }
}
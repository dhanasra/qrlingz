import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  goto(String path, {Object? args}){
    Navigator.pushNamed(this, path, arguments: args);
  }
}
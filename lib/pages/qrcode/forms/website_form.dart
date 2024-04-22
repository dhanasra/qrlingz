import 'package:flutter/material.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';

class WebsiteForm extends StatelessWidget {
  const WebsiteForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Website".ts(context),
        8.h(),
        TextFormField(
          style: Theme.of(context).textTheme.titleMedium,
        ),
        8.h(),
        
      ],
    );
  }
}
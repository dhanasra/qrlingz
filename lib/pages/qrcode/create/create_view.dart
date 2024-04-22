import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:qrlingz_app/pages/qrcode/forms/website_form.dart';

class CreateView extends StatefulWidget {
  final String type;
  const CreateView({super.key, required this.type});

  @override
  State<CreateView> createState() => _CreateViewState();
}

class _CreateViewState extends State<CreateView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Generate QR Code"),
        centerTitle: false,
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            WebsiteForm()
          ],
        ),
      ),
    );
  }
}
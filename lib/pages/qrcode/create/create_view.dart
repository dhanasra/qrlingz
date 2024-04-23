import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:qrlingz_app/pages/qrcode/forms/contact_form.dart';
import 'package:qrlingz_app/pages/qrcode/forms/email_form.dart';
import 'package:qrlingz_app/pages/qrcode/forms/event_form.dart';
import 'package:qrlingz_app/pages/qrcode/forms/phone_form.dart';
import 'package:qrlingz_app/pages/qrcode/forms/sms_form.dart';
import 'package:qrlingz_app/pages/qrcode/forms/text_form.dart';
import 'package:qrlingz_app/pages/qrcode/forms/vcard_form.dart';
import 'package:qrlingz_app/pages/qrcode/forms/website_form.dart';
import 'package:qrlingz_app/pages/qrcode/forms/wifi_form.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            if(widget.type=="Text")
              const TextForm()
            else if(widget.type=="Website")
              const WebsiteForm()
            else if(widget.type=="Wifi")
              const WifiForm()
            else if(widget.type=="Phone")
              const PhoneForm()
            else if(widget.type=="Email")
              const EmailForm()
            else if(widget.type=="SMS")
              const SmsForm()
            else if(widget.type=="Contact")
              const ContactForm()
            else if(widget.type=="Event")
              const EventForm()
            else if(widget.type=="VCard")
              const VcardForm()
          ],
        ),
      ),
    );
  }
}
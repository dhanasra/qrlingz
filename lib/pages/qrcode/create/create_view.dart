import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:qrlingz_app/constants/string_const.dart';
import 'package:qrlingz_app/pages/qrcode/create/create_viewmodel.dart';
import 'package:qrlingz_app/pages/qrcode/forms/contact_form.dart';
import 'package:qrlingz_app/pages/qrcode/forms/crypto_form.dart';
import 'package:qrlingz_app/pages/qrcode/forms/email_form.dart';
import 'package:qrlingz_app/pages/qrcode/forms/event_form.dart';
import 'package:qrlingz_app/pages/qrcode/forms/facebook_form.dart';
import 'package:qrlingz_app/pages/qrcode/forms/inter_number_form.dart';
import 'package:qrlingz_app/pages/qrcode/forms/phone_form.dart';
import 'package:qrlingz_app/pages/qrcode/forms/sms_form.dart';
import 'package:qrlingz_app/pages/qrcode/forms/social_form.dart';
import 'package:qrlingz_app/pages/qrcode/forms/spotify_form.dart';
import 'package:qrlingz_app/pages/qrcode/forms/text_form.dart';
import 'package:qrlingz_app/pages/qrcode/forms/vcard_form.dart';
import 'package:qrlingz_app/pages/qrcode/forms/website_form.dart';
import 'package:qrlingz_app/pages/qrcode/forms/wifi_form.dart';
import 'package:qrlingz_app/pages/qrcode/forms/youtube_form.dart';

class CreateView extends StatefulWidget {
  final String type;
  const CreateView({super.key, required this.type});

  @override
  State<CreateView> createState() => _CreateViewState();
}

class _CreateViewState extends State<CreateView> {
  late CreateViewModel _viewModel;

  @override
  void initState() {
    _viewModel = CreateViewModel();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConst.genrateQRCode).tr(),
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
            else if(widget.type=="Youtube")
              const YoutubeForm()
            else if(widget.type=="Facebook")
              const FacebookForm()
            else if(widget.type=="Spotify")
              const SpotifyForm()
            else if(widget.type=="Crypto")
              const CryptoForm()
            else if(widget.type=="Pinterest")
              SocialForm(
                type: "username", name: "Pinterest", image: _viewModel.getImagePath("Pinterest"),
              )
            else if(widget.type=="Line")
              SocialForm(
                type: "link", name: "Line", image: _viewModel.getImagePath("Line"),
              )
            else if(widget.type=="Wechat")
              SocialForm(
                type: "link", name: "Wechat", image: _viewModel.getImagePath("Wechat"),
              )
            else if(widget.type=="Paypal")
              SocialForm(
                type: "username", name: "Paypal", image: _viewModel.getImagePath("Paypal"),
              )
            else if(widget.type=="Snapchat")
              SocialForm(
                type: "username", name: "Snapchat", image: _viewModel.getImagePath("Snapchat"),
              )
            else if(widget.type=="Linkedin")
              SocialForm(
                type: "link", name: "Linkedin", image: _viewModel.getImagePath("Linkedin"),
              )
            else if(widget.type=="TikTok")
              SocialForm(
                type: "link", name: "TikTok", image: _viewModel.getImagePath("TikTok"),
              )
            else if(widget.type=="X")
              SocialForm(
                type: "username", name: "X", image: _viewModel.getImagePath("X"),
              )
            else if(widget.type=="Instagram")
              SocialForm(
                type: "username", name: "Instagram", image: _viewModel.getImagePath("Instagram"),
              )
            else if(widget.type=="Whatsapp")
              InterNumberForm(
                name: "Whatsapp", image: _viewModel.getImagePath("Whatsapp"),
              )
            else if(widget.type=="Viber")
              InterNumberForm(
                name: "Viber", image: _viewModel.getImagePath("Viber"),
              )
          ],
        ),
      ),
    );
  }
}
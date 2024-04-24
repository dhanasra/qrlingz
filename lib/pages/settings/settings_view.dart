import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrlingz_app/common/theme/theme_cubit.dart';
import 'package:qrlingz_app/constants/color_const.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/pages/settings/settings_viewmodel.dart';
import 'package:qrlingz_app/utils/global.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  late SettingsViewModel _viewModel;

  @override
  void initState() {
    _viewModel = SettingsViewModel();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [

          "GENERAL".ts(context),

          8.h(),

          ListTile(
            onTap: (){},
            leading: const Icon(Icons.language_outlined, size: 20),
            contentPadding: const EdgeInsets.only(left: 16, right: 16),
            title: const Text("Language"),
            trailing: const Text("English")
          ),
          ListTile(
            onTap: ()=>_viewModel.openThemeSheet(context),
            leading: const Icon(Icons.color_lens_outlined, size: 20),
            contentPadding: const EdgeInsets.only(left: 16, right: 16),
            title: const Text("Theme"),
            trailing: (context.read<ThemeCubit>().state.name.toUpperCase()).ts(context, color: ColorConst.primary)
          ),
          ListTile(
            leading: const Icon(Icons.history_outlined, size: 20),
            title: const Text("Add Scans To History"),
            contentPadding: const EdgeInsets.only(left: 16),
            trailing: Checkbox(value: Global.addScanToHistory, onChanged: (v){
              _viewModel.updateSettings("addScanToHistory", v);
              setState(() {});
            }),
          ),

          16.h(),

          "SCANNER".ts(context),

          8.h(),

          ListTile(
            leading: const Icon(Icons.vibration_outlined, size: 20),
            title: const Text("Vibrate"),
            contentPadding: const EdgeInsets.only(left: 16),
            trailing: Checkbox(
              value: Global.vibrateOnScan, 
              onChanged: (v){
                _viewModel.updateSettings("vibrate", v);
                setState(() {});
              }),
          ),
          ListTile(
            leading: const Icon(Icons.volume_up_outlined, size: 20),
            title: const Text("Sound"),
            contentPadding: const EdgeInsets.only(left: 16),
            trailing: Checkbox(value: Global.soundOnScan, 
            onChanged: (v){
              _viewModel.updateSettings("sound", v);
              setState(() {});
            }),
          ),
          ListTile(
            leading: const Icon(Icons.open_in_new_outlined, size: 20),
            title: const Text("Auto Open Websites"),
            contentPadding: const EdgeInsets.only(left: 16),
            trailing: Checkbox(value: Global.openLinkOnScan, 
            onChanged: (v){
              _viewModel.updateSettings("autoOpen", v);
              setState(() {});
            }),
          ),

          16.h(),   

          "FEEDBACK".ts(context),

          8.h(),

          ListTile(
            onTap: ()=>_viewModel.recommendApp(),
            leading: const Icon(Icons.thumb_up_alt_outlined, size: 20),
            title: const Text("Recommend This App"),
          ),
          ListTile(
            onTap: (){},
            leading: const Icon(Icons.star_border, size: 20),
            title: const Text("Rate This App"),
          ),
          ListTile(
            onTap: ()=>_viewModel.sendReportOrFeedback("Report"),
            leading: const Icon(Icons.flag_outlined, size: 20),
            title: const Text("Report An Issue"),
          ),
          ListTile(
            onTap: ()=>_viewModel.sendReportOrFeedback("Feedback"),
            leading: const Icon(Icons.message_outlined, size: 20),
            title: const Text("Give Feedback"),
          ),

        ],
      ),
    );
  }
}
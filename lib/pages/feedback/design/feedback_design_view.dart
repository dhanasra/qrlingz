import 'package:flutter/material.dart';
import 'package:qrlingz_app/extensions/context_exten.dart';
import 'package:qrlingz_app/pages/feedback/design/feedback_design_viewmodel.dart';
import 'package:qrlingz_app/pages/feedback/design/fragments/content_fragment.dart';
import 'package:qrlingz_app/pages/feedback/preview/feedback_preview.dart';
import 'package:qrlingz_app/network/models/feedback_data.dart';

import 'fragments/theme_fragment.dart';

class FeedbackDesignView extends StatefulWidget {
  final FeedbackData data;
  const FeedbackDesignView({super.key, required this.data});

  @override
  State<FeedbackDesignView> createState() => _FeedbackDesignViewState();
}

class _FeedbackDesignViewState extends State<FeedbackDesignView> {
  late FeedbackDesignViewModel _viewModel;

  @override
  void initState() {
    _viewModel = FeedbackDesignViewModel(widget.data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: Column(
            children: [
              Expanded(
                flex: 6,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () => context.back(),
                        icon: const Icon(Icons.arrow_back)),
                    Expanded(
                      child: ListView(
                        children: [
                          ValueListenableBuilder(
                              valueListenable: _viewModel.data,
                              builder: (_, val, __) {
                                return FeebackPreview(
                                  data: val
                                );
                              })
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () => {},
                        icon: const Icon(Icons.check))
                  ],
                ),
              ),
              const TabBar(tabs: [
                Tab(text: "Theme"),
                Tab(text: "Content")
              ]),
              Expanded(
                flex: 4,
                child: TabBarView(children: [
                  ThemeFragment(vm: _viewModel),
                  ContentFragment(vm: _viewModel)
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
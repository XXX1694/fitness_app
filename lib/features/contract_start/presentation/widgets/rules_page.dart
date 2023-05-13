import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class RulesPage extends StatefulWidget {
  const RulesPage({super.key});

  @override
  State<RulesPage> createState() => _RulesPageState();
}

class _RulesPageState extends State<RulesPage> {
  late WebViewPlusController _controller;
  double _height = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: _height,
            child: WebViewPlus(
              onWebViewCreated: (controller) {
                _controller = controller;
                controller.loadUrl(
                    'https://www.termsfeed.com/live/95fc9c9b-6755-4239-a932-d384e1cce0da');
              },
              onPageFinished: (url) {
                _controller.getHeight().then((double height) {
                  if (kDebugMode) {
                    print("Height:  $height");
                  }
                  setState(() {
                    _height = height;
                  });
                });
              },
              javascriptMode: JavascriptMode.unrestricted,
            ),
          )
        ],
      ),
    );
  }
}

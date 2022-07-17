import 'dart:io';

import 'package:flutter/material.dart';
import 'package:one1/model/trailers_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ViewTrailers extends StatefulWidget {
ViewTrailers({this.keyId});
final String keyId;
  @override
  _ViewTrailersState createState() => _ViewTrailersState();
}

class _ViewTrailersState extends State<ViewTrailers> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();

  }
  TrailersResults trailersResults;
  @override
  Widget build(BuildContext context) {
    return
      SafeArea(child: Scaffold(
          body:
          WebView(
            javascriptMode: JavascriptMode.unrestricted,

            initialUrl: 'https://www.youtube.com/embed/${widget.keyId}',
          )
      ));

  }
}

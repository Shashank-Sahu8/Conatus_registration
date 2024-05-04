import 'package:flutter/material.dart';
import 'dart:ui_web' as ui;
import 'dart:html' as html;

class recaptcha extends StatefulWidget {
  final Function(String) onTokenReceived;
   recaptcha({super.key,required this.onTokenReceived});

  @override
  State<recaptcha> createState() => _recaptchaState();
}

class _recaptchaState extends State<recaptcha> {

  String createdViewId = 'recaptcha_element';
  String _token='empty';
  @override
  void initState() {
    ui.platformViewRegistry.registerViewFactory(
      createdViewId,
          (int viewId) => html.IFrameElement()
        ..style.height = '100%'
        ..style.width = '100%'
        ..src = '/assets/recaptcha.html'
        ..style.border = 'none',
    );
    html.window.onMessage.listen((msg) {
      String token = msg.data;
      print("----"+token+"----");
      setState(() {
        _token=token;
      });
      widget.onTokenReceived(token);
      //Navigator.of(context).pop(token);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width * 0.5,
        child: HtmlElementView(viewType: createdViewId),
      ),
    );
  }
}

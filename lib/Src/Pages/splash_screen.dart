import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';import 'package:flutter/material.dart';
import 'dart:io';
import 'description.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  StreamSubscription<ConnectivityResult>? _connectivitySubscription;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _connectivitySubscription = Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> event) {
  //     if (event.contains(ConnectivityResult.none)) {
  //       Navigator.of(context).pushReplacement(
  //         MaterialPageRoute(builder: (context) => NoInternetScreen()),
  //       );
  //     }
  //   });
  // }
  //
  // @override
  // void dispose() {
  //   _connectivitySubscription?.cancel();
  //   super.dispose();
  // }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator()
      ),
    );
  }
}

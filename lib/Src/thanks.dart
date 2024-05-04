import 'package:flutter/material.dart';

class thanks extends StatefulWidget {
  const thanks({super.key});

  @override
  State<thanks> createState() => _thanksState();
}

class _thanksState extends State<thanks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Thank You , registration success"),
      ),
    );
  }
}

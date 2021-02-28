import 'package:flutter/material.dart';

class DetallePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle page'),
      ),
      body: Center(
        child: Text('El mensaje es $arg'),
      ),
    );
  }
}

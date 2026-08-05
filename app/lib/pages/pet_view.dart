import 'package:flutter/material.dart';

class PetViewPage extends StatefulWidget {
  final int? id;

  const PetViewPage({super.key, this.id});

  @override
  State<PetViewPage> createState() => _PetViewPageState();
}

class _PetViewPageState extends State<PetViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animal')),
      body: Placeholder(),
    );
  }
}

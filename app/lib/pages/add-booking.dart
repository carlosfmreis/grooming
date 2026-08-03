import 'package:flutter/material.dart';

class AddBookingPage extends StatefulWidget {
  const AddBookingPage({super.key});

  @override
  State<AddBookingPage> createState() => _AddBookingPageState();
}

class _AddBookingPageState extends State<AddBookingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nova Marcação')),
      body: Placeholder(),
    );
  }
}

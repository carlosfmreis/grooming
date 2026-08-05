import 'package:flutter/material.dart';

class BookingFormPage extends StatefulWidget {
  final int? id;

  const BookingFormPage({super.key, this.id});

  @override
  State<BookingFormPage> createState() => _BookingFormPageState();
}

class _BookingFormPageState extends State<BookingFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Marcação')),
      body: Center(child: Text('Marcação')),
    );
  }
}

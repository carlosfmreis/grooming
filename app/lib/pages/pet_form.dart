import 'package:app/config/styles.dart';
import 'package:flutter/material.dart';

class PetFormPage extends StatefulWidget {
  final int? id;

  const PetFormPage({super.key, this.id});

  @override
  State<PetFormPage> createState() => _PetFormPageState();
}

class _PetFormPageState extends State<PetFormPage> {
  @override
  void initState() {
    // TODO: get animal
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Animal'),
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.pink,
            tabs: [
              Tab(icon: Icon(Icons.pets)),
              Tab(icon: Icon(Icons.person)),
              Tab(icon: Icon(Icons.health_and_safety)),
              Tab(icon: Icon(Icons.warning)),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Animal')),
            Center(child: Text('Tutor')),
            Center(child: Text('Saúde')),
            Center(child: Text('Comportamento')),
          ],
        ),
        floatingActionButton: IconButton(
          onPressed: () {},
          icon: Icon(Icons.save, color: Colors.white),
          style: AppStyles.floatingActionButton,
        ),
      ),
    );
  }
}

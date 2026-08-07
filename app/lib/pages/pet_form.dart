import 'package:app/config/styles.dart';
import 'package:app/widgets/animal_form.dart';
import 'package:app/widgets/tutor_form.dart';
import 'package:flutter/material.dart';

class PetFormPage extends StatefulWidget {
  final int? id;

  const PetFormPage({super.key, this.id});

  @override
  State<PetFormPage> createState() => _PetFormPageState();
}

class _PetFormPageState extends State<PetFormPage> {
  final _animalFormKey = GlobalKey<FormState>();
  final _tutorFormKey = GlobalKey<FormState>();

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
        body: TabBarView(
          children: [
            AnimalForm(formKey: _animalFormKey),
            TutorForm(formKey: _tutorFormKey),
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

import 'package:app/config/styles.dart';
import 'package:app/models/animal.dart';
import 'package:app/models/behaviour.dart';
import 'package:app/models/health.dart';
import 'package:app/models/owner.dart';
import 'package:app/widgets/animal_form.dart';
import 'package:app/widgets/behaviour_form.dart';
import 'package:app/widgets/health_form.dart';
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
  final _healthFormKey = GlobalKey<FormState>();
  final _behaviourFormKey = GlobalKey<FormState>();

  late final Animal _animal;
  late final Owner _owner;
  late final Behaviour _behaviour;
  late final Health _health;

  @override
  void initState() {
    _animal = Animal();
    _owner = Owner();
    _behaviour = Behaviour();
    _health = Health();
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
            AnimalForm(formKey: _animalFormKey, data: _animal),
            TutorForm(formKey: _tutorFormKey, data: _owner),
            HealthForm(formKey: _healthFormKey, data: _health),
            BehaviourForm(formKey: _behaviourFormKey, data: _behaviour),
          ],
        ),
        floatingActionButton: IconButton(
          onPressed: () {
            final isValid =
                (_animalFormKey.currentState?.validate() ?? false) &&
                (_tutorFormKey.currentState?.validate() ?? false) &&
                (_healthFormKey.currentState?.validate() ?? false) &&
                (_behaviourFormKey.currentState?.validate() ?? false);
            if (isValid) {
              _animal.owner = _owner;
              _animal.behaviour = _behaviour;
              _animal.health = _health;
              print(_animal.name ?? 'error');
            } else {
              print('form is not valid');
            }
          },
          icon: Icon(Icons.save, color: Colors.white),
          style: AppStyles.floatingActionButton,
        ),
      ),
    );
  }
}

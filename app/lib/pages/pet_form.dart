import 'package:app/config/api_client.dart';
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
  final _apiClient = ApiClient();

  final _animalFormKey = GlobalKey<FormState>();
  final _tutorFormKey = GlobalKey<FormState>();
  final _healthFormKey = GlobalKey<FormState>();
  final _behaviourFormKey = GlobalKey<FormState>();

  late final Animal _animal;
  late final Owner _owner;
  late final Behaviour _behaviour;
  late final Health _health;

  bool _isSaving = false;

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
          onPressed: _isSaving
              ? null
              : () {
                  final isAnimalValid =
                      _animalFormKey.currentState?.validate() ?? false;
                  final isTutorValid =
                      _tutorFormKey.currentState?.validate() ?? false;
                  final isHealthValid =
                      _healthFormKey.currentState?.validate() ?? false;
                  final isBehaviourValid =
                      _behaviourFormKey.currentState?.validate() ?? false;
                  if (isAnimalValid &&
                      isTutorValid &&
                      isHealthValid &&
                      isBehaviourValid) {
                    setState(() {
                      _isSaving = true;
                    });
                    _animal.owner = _owner;
                    _animal.behaviour = _behaviour;
                    _animal.health = _health;

                    _apiClient
                        .post('/animals', data: _animal.toMap())
                        .then((response) {
                          setState(() {
                            _isSaving = false;
                          });
                        })
                        .catchError((error) {
                          setState(() {
                            _isSaving = false;
                          });
                        });
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => const AlertDialog(
                        icon: Icon(Icons.warning, color: Colors.red),
                        content: Text(
                          'Exitem erros no formulário.',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }
                },
          icon: _isSaving
              ? CircularProgressIndicator.adaptive()
              : Icon(Icons.save, color: Colors.white),
          style: AppStyles.floatingActionButton,
        ),
      ),
    );
  }
}

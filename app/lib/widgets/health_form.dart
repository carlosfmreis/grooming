import 'package:app/models/health.dart';
import 'package:flutter/material.dart';

class HealthForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final Health? data;

  const HealthForm({super.key, required this.formKey, this.data});

  @override
  State<HealthForm> createState() => _HealthFormState();
}

class _HealthFormState extends State<HealthForm> {
  late TextEditingController _vetController;
  late TextEditingController _clinicContactController;
  late TextEditingController _diseasesController;
  late TextEditingController _allergiesController;
  late TextEditingController _restrictionsController;

  late bool _vaccinated;
  late bool _internalDeworming;
  late bool _externalDeworming;
  late bool _heartProblems;
  late bool _respiratoryProblems;
  late bool _jointProblems;
  late bool _skinProblems;
  late bool _earProblems;
  late bool _sightProblems;
  late bool _deaf;
  late bool _blind;

  @override
  void initState() {
    _vetController = TextEditingController(text: widget.data?.usualVet ?? '');
    _clinicContactController = TextEditingController(
      text: widget.data?.vetClinic ?? '',
    );
    _diseasesController = TextEditingController(
      text: widget.data?.knownDiseases ?? '',
    );
    _allergiesController = TextEditingController(
      text: widget.data?.allergies ?? '',
    );
    _restrictionsController = TextEditingController(
      text: widget.data?.medicalRestrictions ?? '',
    );
    _vaccinated = widget.data?.vaccinated ?? false;
    _internalDeworming = widget.data?.internalDeworming ?? false;
    _externalDeworming = widget.data?.externalDeworming ?? false;
    _heartProblems = widget.data?.heartProblems ?? false;
    _respiratoryProblems = widget.data?.respiratoryProblems ?? false;
    _jointProblems = widget.data?.jointProblems ?? false;
    _skinProblems = widget.data?.skinProblems ?? false;
    _earProblems = widget.data?.earProblems ?? false;
    _sightProblems = widget.data?.sightProblems ?? false;
    _deaf = widget.data?.deaf ?? false;
    _blind = widget.data?.blind ?? false;
    super.initState();
  }

  @override
  void dispose() {
    _vetController.dispose();
    _clinicContactController.dispose();
    _diseasesController.dispose();
    _allergiesController.dispose();
    _restrictionsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: _vetController,
              decoration: const InputDecoration(
                labelText: 'Veterinário habitual',
              ),
            ),

            const SizedBox(height: 12),

            TextFormField(
              controller: _vetController,
              decoration: const InputDecoration(labelText: 'Clínica habitual'),
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Vacinado'),
              value: _vaccinated,
              onChanged: (value) {
                setState(() => _vaccinated = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Desparasitação interna'),
              value: _internalDeworming,
              onChanged: (value) {
                setState(() => _internalDeworming = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Desparasitação externa'),
              value: _externalDeworming,
              onChanged: (value) {
                setState(() => _externalDeworming = value);
              },
            ),

            TextFormField(
              controller: _diseasesController,
              decoration: const InputDecoration(
                labelText: 'Doenças conhecidas',
              ),
            ),

            const SizedBox(height: 12),

            TextFormField(
              controller: _allergiesController,
              decoration: const InputDecoration(labelText: 'Alergias'),
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Problemas cardíacos'),
              value: _heartProblems,
              onChanged: (value) {
                setState(() => _heartProblems = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Problemas respiratórios'),
              value: _respiratoryProblems,
              onChanged: (value) {
                setState(() => _respiratoryProblems = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Problemas articulares'),
              value: _jointProblems,
              onChanged: (value) {
                setState(() => _jointProblems = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Problemas de pele'),
              value: _skinProblems,
              onChanged: (value) {
                setState(() => _skinProblems = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Problemas auditivos'),
              value: _earProblems,
              onChanged: (value) {
                setState(() => _earProblems = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Problemas oculares'),
              value: _sightProblems,
              onChanged: (value) {
                setState(() => _sightProblems = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Surdez'),
              value: _deaf,
              onChanged: (value) {
                setState(() => _deaf = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Cegueira'),
              value: _blind,
              onChanged: (value) {
                setState(() => _blind = value);
              },
            ),

            TextFormField(
              controller: _restrictionsController,
              decoration: const InputDecoration(
                labelText: 'Restrições médicas',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

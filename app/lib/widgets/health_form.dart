import 'package:app/models/health.dart';
import 'package:flutter/material.dart';

class HealthForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final Health? data;

  const HealthForm({super.key, required this.formKey, this.data});

  @override
  State<HealthForm> createState() => _HealthFormState();
}

class _HealthFormState extends State<HealthForm>
    with AutomaticKeepAliveClientMixin {
  late TextEditingController _vetController;
  late TextEditingController _clinicContactController;
  late TextEditingController _diseasesController;
  late TextEditingController _allergiesController;
  late TextEditingController _restrictionsController;

  @override
  bool get wantKeepAlive => true;

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
    super.build(context);
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
              onChanged: (value) {
                widget.data?.usualVet = value;
              },
            ),

            const SizedBox(height: 12),

            TextFormField(
              controller: _vetController,
              decoration: const InputDecoration(labelText: 'Clínica habitual'),
              onChanged: (value) {
                widget.data?.vetClinic = value;
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Vacinado'),
              value: widget.data?.vaccinated ?? false,
              onChanged: (value) {
                setState(() => widget.data?.vaccinated = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Desparasitação interna'),
              value: widget.data?.internalDeworming ?? false,
              onChanged: (value) {
                setState(() => widget.data?.internalDeworming = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Desparasitação externa'),
              value: widget.data?.externalDeworming ?? false,
              onChanged: (value) {
                setState(() => widget.data?.externalDeworming = value);
              },
            ),

            TextFormField(
              controller: _diseasesController,
              decoration: const InputDecoration(
                labelText: 'Doenças conhecidas',
              ),
              onChanged: (value) {
                widget.data?.knownDiseases = value;
              },
            ),

            const SizedBox(height: 12),

            TextFormField(
              controller: _allergiesController,
              decoration: const InputDecoration(labelText: 'Alergias'),
              onChanged: (value) {
                widget.data?.allergies = value;
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Problemas cardíacos'),
              value: widget.data?.heartProblems ?? false,
              onChanged: (value) {
                setState(() => widget.data?.heartProblems = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Problemas respiratórios'),
              value: widget.data?.respiratoryProblems ?? false,
              onChanged: (value) {
                setState(() => widget.data?.respiratoryProblems = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Problemas articulares'),
              value: widget.data?.jointProblems ?? false,
              onChanged: (value) {
                setState(() => widget.data?.jointProblems = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Problemas de pele'),
              value: widget.data?.skinProblems ?? false,
              onChanged: (value) {
                setState(() => widget.data?.skinProblems = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Problemas auditivos'),
              value: widget.data?.earProblems ?? false,
              onChanged: (value) {
                setState(() => widget.data?.earProblems = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Problemas oculares'),
              value: widget.data?.sightProblems ?? false,
              onChanged: (value) {
                setState(() => widget.data?.sightProblems = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Surdez'),
              value: widget.data?.deaf ?? false,
              onChanged: (value) {
                setState(() => widget.data?.deaf = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Cegueira'),
              value: widget.data?.blind ?? false,
              onChanged: (value) {
                setState(() => widget.data?.blind = value);
              },
            ),

            TextFormField(
              controller: _restrictionsController,
              decoration: const InputDecoration(
                labelText: 'Restrições médicas',
              ),
              onChanged: (value) {
                widget.data?.medicalRestrictions = value;
              },
            ),

            const SizedBox(height: 44),
          ],
        ),
      ),
    );
  }
}

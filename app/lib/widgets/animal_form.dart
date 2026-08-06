import 'dart:typed_data';

import 'package:app/models/animal.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class AnimalForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final Animal? animal;

  const AnimalForm({super.key, required this.formKey, this.animal});

  @override
  State<AnimalForm> createState() => _AnimalFormState();
}

class _AnimalFormState extends State<AnimalForm> {
  late TextEditingController _nameController;
  late TextEditingController _speciesController;
  late TextEditingController _breedController;
  late TextEditingController _colorController;
  late TextEditingController _eyeColorController;
  late TextEditingController _weightController;
  late TextEditingController _previousWeightController;
  late TextEditingController _microchipController;
  late TextEditingController _notesController;

  String _gender = 'Macho';
  bool _isNeutered = false;
  CoatType _coatType = CoatType.short;
  DateTime _birthDate = DateTime.now();
  Uint8List? _photoBytes;
  String? _photoName;

  @override
  void initState() {
    super.initState();

    final animal = widget.animal;

    _nameController = TextEditingController(text: animal?.name ?? '');
    _speciesController = TextEditingController(text: animal?.species ?? '');
    _breedController = TextEditingController(text: animal?.breed ?? '');
    _colorController = TextEditingController(text: animal?.color ?? '');
    _eyeColorController = TextEditingController(text: animal?.eyeColor ?? '');
    _weightController = TextEditingController(
      text: animal?.currentWeight.toString() ?? '',
    );
    _previousWeightController = TextEditingController(
      text: animal?.previousWeight?.toString() ?? '',
    );
    _microchipController = TextEditingController(text: animal?.microchip ?? '');
    _notesController = TextEditingController(text: animal?.notes ?? '');

    _gender = animal?.gender ?? 'Macho';
    _isNeutered = animal?.isNeutered ?? false;
    _coatType = animal?.coatType ?? CoatType.short;
    _birthDate = animal?.birthDate ?? DateTime.now();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _speciesController.dispose();
    _breedController.dispose();
    _colorController.dispose();
    _eyeColorController.dispose();
    _weightController.dispose();
    _previousWeightController.dispose();
    _microchipController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _selectBirthDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _birthDate,
      firstDate: DateTime.now().subtract(const Duration(days: 365 * 100)),
      lastDate: DateTime.now(),
    );
    if (date != null) {
      setState(() => _birthDate = date);
    }
  }

  Future<void> _pickPhoto() async {
    final result = await FilePicker.pickFiles(
      type: FileType.image,
      withData: true,
    );
    if (result != null) {
      setState(() {
        _photoBytes = result.files.single.bytes;
        _photoName = result.files.single.name;
      });
    }
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
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Nome'),
              validator: (value) => value!.isEmpty ? 'Obrigatório' : null,
            ),

            const SizedBox(height: 12),

            TextFormField(
              controller: _speciesController,
              decoration: const InputDecoration(labelText: 'Espécie'),
              validator: (value) => value!.isEmpty ? 'Obrigatório' : null,
            ),

            const SizedBox(height: 12),

            TextFormField(
              controller: _breedController,
              decoration: const InputDecoration(labelText: 'Raça'),
              validator: (value) => value!.isEmpty ? 'Obrigatório' : null,
            ),

            const SizedBox(height: 12),

            DropdownButtonFormField<String>(
              initialValue: _gender,
              decoration: const InputDecoration(labelText: 'Sexo'),
              items: const [
                DropdownMenuItem(value: 'Macho', child: Text('Macho')),
                DropdownMenuItem(value: 'Fêmea', child: Text('Fêmea')),
              ],
              onChanged: (value) {
                setState(() => _gender = value!);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Esterilizado'),
              value: _isNeutered,
              onChanged: (value) {
                setState(() => _isNeutered = value);
              },
            ),

            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Data de nascimento'),
              subtitle: Text(
                '${_birthDate.day}/${_birthDate.month}/${_birthDate.year}',
              ),
              trailing: const Icon(Icons.calendar_month),
              onTap: _selectBirthDate,
            ),

            TextFormField(
              controller: _colorController,
              decoration: const InputDecoration(labelText: 'Cor'),
              validator: (value) => value!.isEmpty ? 'Obrigatório' : null,
            ),

            const SizedBox(height: 12),

            DropdownButtonFormField<CoatType>(
              initialValue: _coatType,
              decoration: const InputDecoration(labelText: 'Tipo de pelagem'),
              items: CoatType.values
                  .map(
                    (coat) => DropdownMenuItem(
                      value: coat,
                      child: Text(coat.displayName),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() => _coatType = value!);
              },
            ),

            const SizedBox(height: 12),

            TextFormField(
              controller: _eyeColorController,
              decoration: const InputDecoration(labelText: 'Cor dos olhos'),
              validator: (value) => value!.isEmpty ? 'Obrigatório' : null,
            ),

            const SizedBox(height: 12),

            TextFormField(
              controller: _weightController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(labelText: 'Peso atual (kg)'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Obrigatório';
                }

                if (double.tryParse(value) == null) {
                  return 'Peso inválido';
                }

                return null;
              },
            ),

            const SizedBox(height: 12),

            TextFormField(
              controller: _previousWeightController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Peso anterior (kg)',
              ),
            ),

            const SizedBox(height: 12),

            TextFormField(
              controller: _microchipController,
              decoration: const InputDecoration(labelText: 'Microchip'),
            ),

            const SizedBox(height: 12),

            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Foto'),
              trailing: (_photoBytes != null)
                  ? GestureDetector(
                      onTap: _pickPhoto,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.memory(_photoBytes!, fit: BoxFit.cover),
                      ),
                    )
                  : OutlinedButton.icon(
                      onPressed: _pickPhoto,
                      icon: const Icon(Icons.upload_file),
                      label: Text(_photoName ?? 'Selecionar Foto'),
                    ),
            ),

            TextFormField(
              controller: _notesController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Notas',
                alignLabelWithHint: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

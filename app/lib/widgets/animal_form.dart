import 'dart:typed_data';

import 'package:app/models/animal.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class AnimalForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final Animal? data;

  const AnimalForm({super.key, required this.formKey, this.data});

  @override
  State<AnimalForm> createState() => _AnimalFormState();
}

class _AnimalFormState extends State<AnimalForm> {
  late TextEditingController _nameController;
  late TextEditingController _speciesController;
  late TextEditingController _breedController;
  late TextEditingController _weightController;
  late TextEditingController _previousWeightController;
  late TextEditingController _microchipController;
  late TextEditingController _notesController;

  AnimalGender _gender = AnimalGender.male;
  AnimalColor _color = AnimalColor.black;
  AnimalEyeColor _eyeColor = AnimalEyeColor.brown;
  bool _isNeutered = false;
  CoatType _coatType = CoatType.short;
  DateTime? _birthDate;
  Uint8List? _photoBytes;
  String? _photoName;

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController(text: widget.data?.name ?? '');
    _speciesController = TextEditingController(
      text: widget.data?.species ?? '',
    );
    _breedController = TextEditingController(text: widget.data?.breed ?? '');
    _weightController = TextEditingController(
      text: widget.data?.currentWeight.toString() ?? '',
    );
    _previousWeightController = TextEditingController(
      text: widget.data?.previousWeight?.toString() ?? '',
    );
    _microchipController = TextEditingController(
      text: widget.data?.microchip ?? '',
    );
    _notesController = TextEditingController(text: widget.data?.notes ?? '');
    _gender = widget.data?.gender ?? AnimalGender.male;
    _color = widget.data?.color ?? AnimalColor.black;
    _eyeColor = widget.data?.eyeColor ?? AnimalEyeColor.brown;
    _isNeutered = widget.data?.isNeutered ?? false;
    _coatType = widget.data?.coatType ?? CoatType.short;
    _birthDate = widget.data?.birthDate;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _speciesController.dispose();
    _breedController.dispose();
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
              decoration: const InputDecoration(labelText: 'Nome *'),
              validator: (value) => value!.isEmpty ? 'Obrigatório' : null,
            ),

            const SizedBox(height: 12),

            TextFormField(
              controller: _speciesController,
              decoration: const InputDecoration(labelText: 'Espécie *'),
              validator: (value) => value!.isEmpty ? 'Obrigatório' : null,
            ),

            const SizedBox(height: 12),

            TextFormField(
              controller: _breedController,
              decoration: const InputDecoration(labelText: 'Raça *'),
              validator: (value) => value!.isEmpty ? 'Obrigatório' : null,
            ),

            const SizedBox(height: 12),

            DropdownButtonFormField<AnimalGender>(
              initialValue: _gender,
              decoration: const InputDecoration(labelText: 'Sexo *'),
              items: AnimalGender.values
                  .map(
                    (gender) => DropdownMenuItem(
                      value: gender,
                      child: Text(gender.displayName),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() => _gender = value!);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Esterilizado *'),
              value: _isNeutered,
              onChanged: (value) {
                setState(() => _isNeutered = value);
              },
            ),

            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Data de nascimento'),
              subtitle: _birthDate != null
                  ? Text(
                      '${_birthDate?.day}/${_birthDate?.month}/${_birthDate?.year}',
                    )
                  : null,
              trailing: const Icon(Icons.calendar_month),
              onTap: _selectBirthDate,
            ),

            DropdownButtonFormField<AnimalColor>(
              initialValue: _color,
              decoration: const InputDecoration(labelText: 'Cor *'),
              items: AnimalColor.values
                  .map(
                    (color) => DropdownMenuItem(
                      value: color,
                      child: Text(color.displayName),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() => _color = value!);
              },
            ),

            const SizedBox(height: 12),

            DropdownButtonFormField<CoatType>(
              initialValue: _coatType,
              decoration: const InputDecoration(labelText: 'Tipo de pelagem *'),
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

            DropdownButtonFormField<AnimalEyeColor>(
              initialValue: _eyeColor,
              decoration: const InputDecoration(labelText: 'Cor dos olhos'),
              items: AnimalEyeColor.values
                  .map(
                    (color) => DropdownMenuItem(
                      value: color,
                      child: Text(color.displayName),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() => _eyeColor = value!);
              },
            ),

            const SizedBox(height: 12),

            TextFormField(
              controller: _weightController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(labelText: 'Peso atual (kg)'),
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

            const SizedBox(height: 44),
          ],
        ),
      ),
    );
  }
}

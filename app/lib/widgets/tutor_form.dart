import 'package:app/models/owner.dart';
import 'package:flutter/material.dart';

class TutorForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final Owner? owner;

  const TutorForm({super.key, required this.formKey, this.owner});

  @override
  State<TutorForm> createState() => _TutorFormState();
}

class _TutorFormState extends State<TutorForm> {
  late TextEditingController _nameController;
  late TextEditingController _mainContactController;
  late TextEditingController _secondaryContactController;
  late TextEditingController _emailController;
  late TextEditingController _addressController;
  late TextEditingController _namesController;

  final List<String> _names = [];

  @override
  void initState() {
    _nameController = TextEditingController(text: widget.owner?.name ?? '');
    _mainContactController = TextEditingController(
      text: widget.owner?.mainContact ?? '',
    );
    _secondaryContactController = TextEditingController(
      text: widget.owner?.secondaryContact ?? '',
    );
    _emailController = TextEditingController(text: widget.owner?.email ?? '');
    _addressController = TextEditingController(
      text: widget.owner?.address ?? '',
    );
    _namesController = TextEditingController(text: '');
    if (widget.owner?.authorizedPersons != null) {
      _names.addAll(widget.owner!.authorizedPersons!);
    }
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _mainContactController.dispose();
    _secondaryContactController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _namesController.dispose();
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
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Nome *'),
              validator: (value) => value!.isEmpty ? 'Obrigatório' : null,
            ),

            const SizedBox(height: 12),

            TextFormField(
              controller: _mainContactController,
              decoration: const InputDecoration(
                labelText: 'Contato Principal *',
              ),
              validator: (value) => value!.isEmpty ? 'Obrigatório' : null,
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 12),

            TextFormField(
              controller: _secondaryContactController,
              decoration: const InputDecoration(
                labelText: 'Contato Secundário',
              ),
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 12),

            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'E-mail'),
              keyboardType: TextInputType.emailAddress,
            ),

            const SizedBox(height: 12),

            TextFormField(
              controller: _addressController,
              decoration: const InputDecoration(labelText: 'Morada'),
              keyboardType: TextInputType.streetAddress,
            ),

            const SizedBox(height: 12),

            TextField(
              controller: _namesController,
              decoration: const InputDecoration(
                labelText: 'Pessoas Autorizadas',
              ),
              onSubmitted: (value) {
                setState(() {
                  _names.add(value.trim());
                });
                _namesController.clear();
              },
            ),

            const SizedBox(height: 12),

            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: _names
                  .map(
                    (name) => Chip(
                      label: Text(name),
                      onDeleted: () {
                        setState(() {
                          _names.remove(name);
                        });
                      },
                    ),
                  )
                  .toList(),
            ),

            const SizedBox(height: 44),
          ],
        ),
      ),
    );
  }
}

import 'package:app/models/owner.dart';
import 'package:flutter/material.dart';

class TutorForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final Owner? data;

  const TutorForm({super.key, required this.formKey, this.data});

  @override
  State<TutorForm> createState() => _TutorFormState();
}

class _TutorFormState extends State<TutorForm>
    with AutomaticKeepAliveClientMixin {
  late TextEditingController _nameController;
  late TextEditingController _mainContactController;
  late TextEditingController _secondaryContactController;
  late TextEditingController _emailController;
  late TextEditingController _addressController;
  late TextEditingController _namesController;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    _nameController = TextEditingController(text: widget.data?.name ?? '');
    _mainContactController = TextEditingController(
      text: widget.data?.mainContact ?? '',
    );
    _secondaryContactController = TextEditingController(
      text: widget.data?.secondaryContact ?? '',
    );
    _emailController = TextEditingController(text: widget.data?.email ?? '');
    _addressController = TextEditingController(
      text: widget.data?.address ?? '',
    );
    _namesController = TextEditingController(text: '');
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
    super.build(context);
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
              onChanged: (value) => widget.data?.name = value,
            ),

            const SizedBox(height: 12),

            TextFormField(
              controller: _mainContactController,
              decoration: const InputDecoration(
                labelText: 'Contato Principal *',
              ),
              validator: (value) => value!.isEmpty ? 'Obrigatório' : null,
              keyboardType: TextInputType.number,
              onChanged: (value) => widget.data?.mainContact = value,
            ),

            const SizedBox(height: 12),

            TextFormField(
              controller: _secondaryContactController,
              decoration: const InputDecoration(
                labelText: 'Contato Secundário',
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) => widget.data?.secondaryContact = value,
            ),

            const SizedBox(height: 12),

            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'E-mail'),
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) => widget.data?.email = value,
            ),

            const SizedBox(height: 12),

            TextFormField(
              controller: _addressController,
              decoration: const InputDecoration(labelText: 'Morada'),
              keyboardType: TextInputType.streetAddress,
              onChanged: (value) => widget.data?.address = value,
            ),

            const SizedBox(height: 12),

            TextField(
              controller: _namesController,
              decoration: const InputDecoration(
                labelText: 'Pessoas Autorizadas',
              ),
              onSubmitted: (value) {
                setState(() {
                  widget.data?.authorizedPersons?.add(value.trim());
                });
              },
            ),

            const SizedBox(height: 12),

            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: (widget.data?.authorizedPersons ?? [])
                  .map(
                    (name) => Chip(
                      label: Text(name),
                      onDeleted: () {
                        setState(() {
                          widget.data?.authorizedPersons?.remove(name);
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

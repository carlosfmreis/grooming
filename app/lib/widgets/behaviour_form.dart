import 'package:app/models/behaviour.dart';
import 'package:flutter/material.dart';

class BehaviourForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final Behaviour? data;

  const BehaviourForm({super.key, required this.formKey, this.data});

  @override
  State<BehaviourForm> createState() => _BehaviourFormState();
}

class _BehaviourFormState extends State<BehaviourForm> {
  late Behaviour _behaviour;

  @override
  void initState() {
    _behaviour = widget.data ?? Behaviour();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Sociável'),
              value: _behaviour.sociable,
              onChanged: (value) {
                setState(() => _behaviour.sociable = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Medroso'),
              value: _behaviour.scared,
              onChanged: (value) {
                setState(() => _behaviour.scared = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Ansioso'),
              value: _behaviour.anxious,
              onChanged: (value) {
                setState(() => _behaviour.anxious = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Nervoso'),
              value: _behaviour.nervous,
              onChanged: (value) {
                setState(() => _behaviour.nervous = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Muito energético'),
              value: _behaviour.energetic,
              onChanged: (value) {
                setState(() => _behaviour.energetic = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Morde'),
              value: _behaviour.bites,
              onChanged: (value) {
                setState(() => _behaviour.bites = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Rosna'),
              value: _behaviour.growls,
              onChanged: (value) {
                setState(() => _behaviour.growls = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Tenta fugir'),
              value: _behaviour.runs,
              onChanged: (value) {
                setState(() => _behaviour.runs = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Não gosta de secador'),
              value: _behaviour.noDryer,
              onChanged: (value) {
                setState(() => _behaviour.noDryer = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Não gosta de máquina'),
              value: _behaviour.noMachine,
              onChanged: (value) {
                setState(() => _behaviour.noMachine = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Não gosta de tesoura'),
              value: _behaviour.noScissors,
              onChanged: (value) {
                setState(() => _behaviour.noScissors = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Não gosta de cortar unhas'),
              value: _behaviour.noNailClipper,
              onChanged: (value) {
                setState(() => _behaviour.noNailClipper = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Não gosta de limpar ouvidos'),
              value: _behaviour.noEarCleaner,
              onChanged: (value) {
                setState(() => _behaviour.noEarCleaner = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Não gosta de escovagem'),
              value: _behaviour.noBrushing,
              onChanged: (value) {
                setState(() => _behaviour.noBrushing = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Necessita açaime'),
              value: _behaviour.needsMuzzle,
              onChanged: (value) {
                setState(() => _behaviour.needsMuzzle = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Necessita duas pessoas'),
              value: _behaviour.needsTwoPersons,
              onChanged: (value) {
                setState(() => _behaviour.needsTwoPersons = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Já tentou morder funcionários'),
              value: _behaviour.hasServiceBiteHistory,
              onChanged: (value) {
                setState(() => _behaviour.hasServiceBiteHistory = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Reage a outros animais'),
              value: _behaviour.reactsToOtherAnimals,
              onChanged: (value) {
                setState(() => _behaviour.reactsToOtherAnimals = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Reage a homens'),
              value: _behaviour.reactsToMen,
              onChanged: (value) {
                setState(() => _behaviour.reactsToMen = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Reage a mulheres'),
              value: _behaviour.reactsToWomen,
              onChanged: (value) {
                setState(() => _behaviour.reactsToWomen = value);
              },
            ),

            const SizedBox(height: 44),
          ],
        ),
      ),
    );
  }
}

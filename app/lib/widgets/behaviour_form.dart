import 'package:app/models/behaviour.dart';
import 'package:flutter/material.dart';

class BehaviourForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final Behaviour? data;

  const BehaviourForm({super.key, required this.formKey, this.data});

  @override
  State<BehaviourForm> createState() => BehaviourFormState();
}

class BehaviourFormState extends State<BehaviourForm>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Form(
      key: widget.formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Sociável'),
              value: widget.data?.sociable ?? false,
              onChanged: (value) {
                setState(() => widget.data?.sociable = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Medroso'),
              value: widget.data?.scared ?? false,
              onChanged: (value) {
                setState(() => widget.data?.scared = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Ansioso'),
              value: widget.data?.anxious ?? false,
              onChanged: (value) {
                setState(() => widget.data?.anxious = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Nervoso'),
              value: widget.data?.nervous ?? false,
              onChanged: (value) {
                setState(() => widget.data?.nervous = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Muito energético'),
              value: widget.data?.energetic ?? false,
              onChanged: (value) {
                setState(() => widget.data?.energetic = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Morde'),
              value: widget.data?.bites ?? false,
              onChanged: (value) {
                setState(() => widget.data?.bites = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Rosna'),
              value: widget.data?.growls ?? false,
              onChanged: (value) {
                setState(() => widget.data?.growls = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Tenta fugir'),
              value: widget.data?.runs ?? false,
              onChanged: (value) {
                setState(() => widget.data?.runs = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Não gosta de secador'),
              value: widget.data?.noDryer ?? false,
              onChanged: (value) {
                setState(() => widget.data?.noDryer = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Não gosta de máquina'),
              value: widget.data?.noMachine ?? false,
              onChanged: (value) {
                setState(() => widget.data?.noMachine = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Não gosta de tesoura'),
              value: widget.data?.noScissors ?? false,
              onChanged: (value) {
                setState(() => widget.data?.noScissors = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Não gosta de cortar unhas'),
              value: widget.data?.noNailClipper ?? false,
              onChanged: (value) {
                setState(() => widget.data?.noNailClipper = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Não gosta de limpar ouvidos'),
              value: widget.data?.noEarCleaner ?? false,
              onChanged: (value) {
                setState(() => widget.data?.noEarCleaner = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Não gosta de escovagem'),
              value: widget.data?.noBrushing ?? false,
              onChanged: (value) {
                setState(() => widget.data?.noBrushing = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Necessita açaime'),
              value: widget.data?.needsMuzzle ?? false,
              onChanged: (value) {
                setState(() => widget.data?.needsMuzzle = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Necessita duas pessoas'),
              value: widget.data?.needsTwoPersons ?? false,
              onChanged: (value) {
                setState(() => widget.data?.needsTwoPersons = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Já tentou morder funcionários'),
              value: widget.data?.hasServiceBiteHistory ?? false,
              onChanged: (value) {
                setState(() => widget.data?.hasServiceBiteHistory = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Reage a outros animais'),
              value: widget.data?.reactsToOtherAnimals ?? false,
              onChanged: (value) {
                setState(() => widget.data?.reactsToOtherAnimals = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Reage a homens'),
              value: widget.data?.reactsToMen ?? false,
              onChanged: (value) {
                setState(() => widget.data?.reactsToMen = value);
              },
            ),

            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Reage a mulheres'),
              value: widget.data?.reactsToWomen ?? false,
              onChanged: (value) {
                setState(() => widget.data?.reactsToWomen = value);
              },
            ),

            const SizedBox(height: 44),
          ],
        ),
      ),
    );
  }
}

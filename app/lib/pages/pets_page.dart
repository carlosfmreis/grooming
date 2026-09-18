import 'package:app/config/api_client.dart';
import 'package:app/models/animal.dart';
import 'package:flutter/material.dart';

class PetsPage extends StatefulWidget {
  const PetsPage({super.key});

  @override
  State<PetsPage> createState() => _PetsPageState();
}

class _PetsPageState extends State<PetsPage> {
  final ApiClient _apiClient = ApiClient();
  final List<Animal> _pets = [];

  bool _isLoading = true;

  void _loadPets() {
    setState(() {
      _isLoading = true;
    });

    _apiClient
        .get('/animals')
        .then((response) {
          final List pets = response.data as List;
          _pets.addAll(
            pets.map((pet) => Animal.fromMap(pet as Map<String, dynamic>)),
          );
          setState(() {
            _isLoading = false;
          });
        })
        .catchError((error) {
          setState(() {
            _isLoading = false;
          });
        });
  }

  @override
  void initState() {
    super.initState();
    _loadPets();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(child: CircularProgressIndicator.adaptive())
        : _pets.isNotEmpty
        ? ListView.builder(
            itemCount: _pets.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: _pets[index].photo != null
                    ? CircleAvatar(
                        backgroundImage: NetworkImage(_pets[index].photo!),
                      )
                    : Icon(
                        Icons.pets,
                        color: _pets[index].gender == AnimalGender.female
                            ? Colors.pink
                            : Colors.blue,
                      ),
                title: Text(_pets[index].name ?? ''),
                subtitle: Text(_pets[index].owner?.name ?? ''),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: _pets[index].gender == AnimalGender.female
                      ? Colors.pink
                      : Colors.blue,
                ),
                onTap: () {},
              );
            },
          )
        : const Center(child: Text('Sem animais cadastrados.'));
  }
}

import 'package:app/models/health.dart';
import 'package:app/models/owner.dart';

enum CoatType {
  short,
  medium,
  long,
  double,
  wiry,
  curly;

  String get displayName {
    switch (this) {
      case CoatType.short:
        return 'Curto';
      case CoatType.medium:
        return 'Médio';
      case CoatType.long:
        return 'Comprido';
      case CoatType.double:
        return 'Duplo';
      case CoatType.wiry:
        return 'Cerdoso';
      case CoatType.curly:
        return 'Encaracolado';
    }
  }
}

class Animal {
  final String id;
  final String name;
  final String species;
  final String breed;
  final String gender;
  final bool isNeutered;
  final DateTime birthDate;
  final String color;
  final CoatType coatType;
  final String eyeColor;
  final double currentWeight;
  final double? previousWeight;
  final String? microchip;
  final String? photo;
  final String? notes;
  final Owner owner;
  final Health? health;

  Animal({
    required this.id,
    required this.name,
    required this.species,
    required this.breed,
    required this.gender,
    required this.isNeutered,
    required this.birthDate,
    required this.color,
    required this.coatType,
    required this.eyeColor,
    required this.currentWeight,
    this.previousWeight,
    this.microchip,
    this.photo,
    this.notes,
    required this.owner,
    this.health,
  });

  String get age {
    final today = DateTime.now();
    int years = today.year - birthDate.year;
    int months = today.month - birthDate.month;

    if (months < 0) {
      years--;
      months += 12;
    }
    if (today.day < birthDate.day) {
      months--;
      if (months < 0) {
        years--;
        months += 11;
      }
    }

    if (years == 0) {
      return '$months ${months == 1 ? "mês" : "meses"}';
    }
    return '$years ${years == 1 ? "ano" : "anos"} e $months ${months == 1 ? "mês" : "meses"}';
  }

  factory Animal.fromMap(Map<String, dynamic> map) {
    return Animal(
      id: map['id'] as String,
      name: map['name'] as String,
      species: map['species'] as String,
      breed: map['breed'] as String,
      gender: map['gender'] as String,
      isNeutered: map['isNeutered'] is int
          ? (map['isNeutered'] == 1)
          : map['isNeutered'] as bool,
      birthDate: DateTime.parse(map['birthDate'] as String),
      color: map['color'] as String,
      coatType: CoatType.values.firstWhere(
        (e) => e.toString().split('.').last == map['coatType'],
        orElse: () => CoatType.short,
      ),
      eyeColor: map['eyeColor'] as String,
      currentWeight: (map['currentWeight'] as num).toDouble(),
      previousWeight: map['previousWeight'] != null
          ? (map['previousWeight'] as num).toDouble()
          : null,
      microchip: map['microchip'] as String?,
      photo: map['photo'] as String?,
      notes: map['notes'] as String?,
      owner: Owner.fromMap(map['owner']),
      health: map['health'] != null ? Health.fromMap(map['health']) : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'species': species,
      'breed': breed,
      'gender': gender,
      'isNeutered': isNeutered,
      'birthDate': birthDate.toIso8601String(),
      'color': color,
      'coatType': coatType.toString().split('.').last,
      'eyeColor': eyeColor,
      'currentWeight': currentWeight,
      'previousWeight': previousWeight,
      'microchip': microchip,
      'photo': photo,
      'notes': notes,
      'owner': owner.toMap(),
      'health': health?.toMap(),
    };
  }
}

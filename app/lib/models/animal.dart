import 'package:app/models/behaviour.dart';
import 'package:app/models/health.dart';
import 'package:app/models/owner.dart';

enum AnimalGender {
  male('Macho'),
  female('Fêmea');

  const AnimalGender(this.displayName);

  final String displayName;
}

enum AnimalColor {
  black('Preto'),
  white('Branco'),
  brown('Castanho'),
  gray('Cinza'),
  golden('Dourado'),
  caramel('Caramelo'),
  beige('Bege'),
  orange('Laranja'),
  spotted('Malhado'),
  striped('Tigrado');

  const AnimalColor(this.displayName);

  final String displayName;
}

enum AnimalEyeColor {
  brown('Castanho'),
  darkBrown('Castanho Escuro'),
  amber('Âmbar'),
  yellow('Amarelo'),
  hazel('Avelã'),
  green('Verde'),
  blue('Azul'),
  gray('Cinza'),
  black('Preto'),
  oddEyed('Heterocromia');

  const AnimalEyeColor(this.displayName);

  final String displayName;
}

enum CoatType {
  short('Curto'),
  medium('Médio'),
  long('Comprido'),
  double('Duplo'),
  wiry('Cerdoso'),
  curly('Encaracolado');

  const CoatType(this.displayName);

  final String displayName;
}

class Animal {
  final int? id;
  final String name;
  final String species;
  final String breed;
  final AnimalGender gender;
  final bool isNeutered;
  final DateTime? birthDate;
  final AnimalColor color;
  final CoatType coatType;
  final AnimalEyeColor? eyeColor;
  final double? currentWeight;
  final double? previousWeight;
  final String? microchip;
  final String? photo;
  final String? notes;
  final Owner? owner;
  final Health? health;
  final Behaviour? behaviour;

  Animal({
    this.id,
    required this.name,
    required this.species,
    required this.breed,
    required this.gender,
    required this.isNeutered,
    this.birthDate,
    required this.color,
    required this.coatType,
    this.eyeColor,
    this.currentWeight,
    this.previousWeight,
    this.microchip,
    this.photo,
    this.notes,
    this.owner,
    this.health,
    this.behaviour,
  });

  factory Animal.fromMap(Map<String, dynamic> map) {
    return Animal(
      id: map['id'] as int?,
      name: map['name'] as String,
      species: map['species'] as String,
      breed: map['breed'] as String,
      gender: map['gender'] as AnimalGender,
      isNeutered: map['isNeutered'] is int
          ? (map['isNeutered'] == 1)
          : map['isNeutered'] as bool,
      birthDate: map['birthDate'] != null
          ? DateTime.parse(map['birthDate'] as String)
          : null,
      color: map['color'] as AnimalColor,
      coatType: map['coatType'] as CoatType,
      eyeColor: map['eyeColor'] as AnimalEyeColor?,
      currentWeight: map['currentWeight'] != null
          ? (map['currentWeight'] as num).toDouble()
          : null,
      previousWeight: map['previousWeight'] != null
          ? (map['previousWeight'] as num).toDouble()
          : null,
      microchip: map['microchip'] as String?,
      photo: map['photo'] as String?,
      notes: map['notes'] as String?,
      owner: map['owner'] != null ? Owner.fromMap(map['owner']) : null,
      health: map['health'] != null ? Health.fromMap(map['health']) : null,
      behaviour: map['behaviour'] != null
          ? Behaviour.fromMap(map['behaviour'])
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'species': species,
      'breed': breed,
      'gender': gender.toString().split('.').last,
      'isNeutered': isNeutered,
      'birthDate': birthDate?.toIso8601String(),
      'color': color.toString().split('.').last,
      'coatType': coatType.toString().split('.').last,
      'eyeColor': eyeColor?.toString().split('.').last,
      'currentWeight': currentWeight,
      'previousWeight': previousWeight,
      'microchip': microchip,
      'photo': photo,
      'notes': notes,
      'owner': owner?.toMap(),
      'health': health?.toMap(),
      'behaviour': behaviour?.toMap(),
    };
  }
}

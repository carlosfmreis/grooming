import 'package:app/models/behaviour.dart';
import 'package:app/models/health.dart';
import 'package:app/models/owner.dart';
import 'package:dio/dio.dart';

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
  int? id;
  String? name;
  String? species;
  String? breed;
  AnimalGender? gender;
  bool? isNeutered;
  DateTime? birthDate;
  AnimalColor? color;
  CoatType? coatType;
  AnimalEyeColor? eyeColor;
  double? currentWeight;
  double? previousWeight;
  String? microchip;
  String? photo;
  MultipartFile? photoFile;
  String? notes;
  int? ownerId;
  Owner? owner;
  int? healthId;
  Health? health;
  int? behaviourId;
  Behaviour? behaviour;

  Animal({
    this.id,
    this.name,
    this.species,
    this.breed,
    this.gender,
    this.isNeutered = false,
    this.birthDate,
    this.color,
    this.coatType,
    this.eyeColor,
    this.currentWeight,
    this.previousWeight,
    this.microchip,
    this.photo,
    this.photoFile,
    this.notes,
    this.ownerId,
    this.owner,
    this.healthId,
    this.health,
    this.behaviourId,
    this.behaviour,
  });

  factory Animal.fromMap(Map<String, dynamic> map) {
    return Animal(
      id: map['id'] as int?,
      name: map['name'] as String,
      species: map['species'] as String,
      breed: map['breed'] as String,
      gender: AnimalGender.values.byName(map['gender'] as String),
      isNeutered: map['isNeutered'] as bool?,
      birthDate: map['birthDate'] != null
          ? DateTime.parse(map['birthDate'] as String)
          : null,
      color: AnimalColor.values.byName(map['color'] as String),
      coatType: CoatType.values.byName(map['coatType'] as String),
      eyeColor: map['eyeColor'] != null
          ? AnimalEyeColor.values.byName(map['eyeColor'] as String)
          : null,
      currentWeight: map['currentWeight'] != null
          ? (map['currentWeight'] as num).toDouble()
          : null,
      previousWeight: map['previousWeight'] != null
          ? (map['previousWeight'] as num).toDouble()
          : null,
      microchip: map['microchip'] as String?,
      photo: map['photo'] as String?,
      notes: map['notes'] as String?,
      ownerId: map['ownerId'],
      healthId: map['healthId'],
      behaviourId: map['behaviourId'],
      owner: map['owner'] != null ? Owner.fromMap(map['owner']) : null,
      health: map['health'] != null ? Health.fromMap(map['health']) : null,
      behaviour: map['behaviour'] != null
          ? Behaviour.fromMap(map['behaviour'])
          : null,
    );
  }

  FormData toMap() {
    return FormData.fromMap({
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
      'photoFile': photoFile,
      'notes': notes,
      'ownerId': ownerId,
      'owner': owner?.toMap(),
      'healthId': healthId,
      'health': health?.toMap(),
      'behaviourId': behaviourId,
      'behaviour': behaviour?.toMap(),
    });
  }
}

class Health {
  final int id;
  final String? usualVet;
  final String? vetClinic;
  final bool vaccinated;
  final bool internalDeworming;
  final bool externalDeworming;
  final String? knownDiseases;
  final String? allergies;
  final bool heartProblems;
  final bool respiratoryProblems;
  final bool jointProblems;
  final bool skinProblems;
  final bool earProblems;
  final bool sightProblems;
  final bool deaf;
  final bool blind;
  final String? medicalRestrictions;

  Health({
    required this.id,
    this.usualVet,
    this.vetClinic,
    required this.vaccinated,
    required this.internalDeworming,
    required this.externalDeworming,
    this.knownDiseases,
    this.allergies,
    required this.heartProblems,
    required this.respiratoryProblems,
    required this.jointProblems,
    required this.skinProblems,
    required this.earProblems,
    required this.sightProblems,
    required this.deaf,
    required this.blind,
    this.medicalRestrictions,
  });

  factory Health.fromMap(Map<String, dynamic> json) {
    return Health(
      id: json['id'] as int,
      usualVet: json['usualVet'] as String?,
      vetClinic: json['vetClinic'] as String?,
      vaccinated: json['vaccinated'] as bool,
      internalDeworming: json['internalDeworming'] as bool,
      externalDeworming: json['externalDeworming'] as bool,
      knownDiseases: json['knownDiseases'] as String?,
      allergies: json['allergies'] as String?,
      heartProblems: json['heartProblems'] as bool,
      respiratoryProblems: json['respiratoryProblems'] as bool,
      jointProblems: json['jointProblems'] as bool,
      skinProblems: json['skinProblems'] as bool,
      earProblems: json['earProblems'] as bool,
      sightProblems: json['sightProblems'] as bool,
      deaf: json['deaf'] as bool,
      blind: json['blind'] as bool,
      medicalRestrictions: json['medicalRestrictions'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'usualVet': usualVet,
      'vetClinic': vetClinic,
      'vaccinated': vaccinated,
      'internalDeworming': internalDeworming,
      'externalDeworming': externalDeworming,
      'knownDiseases': knownDiseases,
      'allergies': allergies,
      'heartProblems': heartProblems,
      'respiratoryProblems': respiratoryProblems,
      'jointProblems': jointProblems,
      'skinProblems': skinProblems,
      'earProblems': earProblems,
      'sightProblems': sightProblems,
      'deaf': deaf,
      'blind': blind,
      'medicalRestrictions': medicalRestrictions,
    };
  }
}

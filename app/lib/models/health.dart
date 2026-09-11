class Health {
  int? id;
  String? usualVet;
  String? vetClinic;
  bool vaccinated;
  bool internalDeworming;
  bool externalDeworming;
  String? knownDiseases;
  String? allergies;
  bool heartProblems;
  bool respiratoryProblems;
  bool jointProblems;
  bool skinProblems;
  bool earProblems;
  bool sightProblems;
  bool deaf;
  bool blind;
  String? medicalRestrictions;

  Health({
    this.id,
    this.usualVet,
    this.vetClinic,
    this.vaccinated = false,
    this.internalDeworming = false,
    this.externalDeworming = false,
    this.knownDiseases,
    this.allergies,
    this.heartProblems = false,
    this.respiratoryProblems = false,
    this.jointProblems = false,
    this.skinProblems = false,
    this.earProblems = false,
    this.sightProblems = false,
    this.deaf = false,
    this.blind = false,
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

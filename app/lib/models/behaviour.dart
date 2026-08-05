class Behaviour {
  final bool sociable;
  final bool scared;
  final bool anxious;
  final bool nervous;
  final bool energetic;
  final bool bites;
  final bool growls;
  final bool runs;
  final bool noDryer;
  final bool noMachine;
  final bool noScissors;
  final bool noNailClipper;
  final bool noEarCleaner;
  final bool noBrushing;
  final bool needsMuzzle;
  final bool needsTwoPersons;
  final bool hasServiceBiteHistory;
  final bool reactsToOtherAnimals;
  final bool reactsToMen;
  final bool reactsToWomen;

  Behaviour({
    this.sociable = false,
    this.scared = false,
    this.anxious = false,
    this.nervous = false,
    this.energetic = false,
    this.bites = false,
    this.growls = false,
    this.runs = false,
    this.noDryer = false,
    this.noMachine = false,
    this.noScissors = false,
    this.noNailClipper = false,
    this.noEarCleaner = false,
    this.noBrushing = false,
    this.needsMuzzle = false,
    this.needsTwoPersons = false,
    this.hasServiceBiteHistory = false,
    this.reactsToOtherAnimals = false,
    this.reactsToMen = false,
    this.reactsToWomen = false,
  });

  factory Behaviour.fromMap(Map<String, dynamic> json) {
    return Behaviour(
      sociable: json['sociable'] as bool,
      scared: json['scared'] as bool,
      anxious: json['anxious'] as bool,
      nervous: json['nervous'] as bool,
      energetic: json['energetic'] as bool,
      bites: json['bites'] as bool,
      growls: json['growls'] as bool,
      runs: json['runs'] as bool,
      noDryer: json['noDryer'] as bool,
      noMachine: json['noMachine'] as bool,
      noScissors: json['noScissors'] as bool,
      noNailClipper: json['noNailClipper'] as bool,
      noEarCleaner: json['noEarCleaner'] as bool,
      noBrushing: json['noBrushing'] as bool,
      needsMuzzle: json['needsMuzzle'] as bool,
      needsTwoPersons: json['needsTwoPersons'] as bool,
      hasServiceBiteHistory: json['hasServiceBiteHistory'] as bool,
      reactsToOtherAnimals: json['reactsToOtherAnimals'] as bool,
      reactsToMen: json['reactsToMen'] as bool,
      reactsToWomen: json['reactsToWomen'] as bool,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sociable': sociable,
      'scared': scared,
      'anxious': anxious,
      'nervous': nervous,
      'energetic': energetic,
      'bites': bites,
      'growls': growls,
      'runs': runs,
      'noDryer': noDryer,
      'noMachine': noMachine,
      'noScissors': noScissors,
      'noNailClipper': noNailClipper,
      'noEarCleaner': noEarCleaner,
      'noBrushing': noBrushing,
      'needsMuzzle': needsMuzzle,
      'needsTwoPersons': needsTwoPersons,
      'hasServiceBiteHistory': hasServiceBiteHistory,
      'reactsToOtherAnimals': reactsToOtherAnimals,
      'reactsToMen': reactsToMen,
      'reactsToWomen': reactsToWomen,
    };
  }
}

class Owner {
  int id;
  String name;
  String mainContact;
  String? secondaryContact;
  String? email;
  String? address;
  List<String>? authorizedPersons;

  Owner({
    required this.id,
    required this.name,
    required this.mainContact,
    this.secondaryContact,
    this.email,
    this.address,
    this.authorizedPersons,
  });

  factory Owner.fromMap(Map<String, dynamic> json) {
    return Owner(
      id: json['id'] as int,
      name: json['name'] as String,
      mainContact: json['mainContact'] as String,
      secondaryContact: json['secondaryContact'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      authorizedPersons:
          json['authorizedPersons']?.split(',').toList() as List<String>?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'mainContact': mainContact,
      'secondaryContact': secondaryContact,
      'email': email,
      'address': address,
      'authorizedPersons': authorizedPersons?.join(','),
    };
  }
}

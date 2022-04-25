class InfoContactSchema {
  String? id;
  String email;
  String phoneNumber;
  String address;
  String codePost;
  String city;
  String idContact;

  InfoContactSchema({
    this.id,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.codePost,
    required this.city,
    required this.idContact,
  });

  factory InfoContactSchema.formMap(Map<String, dynamic> data, documentId) {
    String email = data['email'];
    String phoneNumber = data['phoneNumber'];
    String address = data['address'];
    String codePost = data['codePost'];
    String city = data['city'];
    String idContact = data['idContact'];

    return InfoContactSchema(
      id: documentId,
      email: email,
      phoneNumber: phoneNumber,
      address: address,
      codePost: codePost,
      city: city,
      idContact: idContact,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'phoneNumber': phoneNumber,
      'address': address,
      'codePost': codePost,
      'city': city,
      'idContact': idContact,
    };
  }
}

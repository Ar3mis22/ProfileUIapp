// ignore_for_file: non_constant_identifier_names, camel_case_types

class user {
  String name, DateOfBirth, Phone;

  user(this.name, this.DateOfBirth, this.Phone);

  user.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        DateOfBirth = json['DateOfBirth'],
        Phone = json['Phone'];

  Map<String, dynamic> toJson() =>
      {'name': name, 'DateOfBirth': DateOfBirth, 'Phone': Phone};
}

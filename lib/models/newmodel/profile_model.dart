// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_test__task/models/newmodel/catalog_model.dart';

class ProfileModel with ChangeNotifier {
  late AuthModel _auth;
  final List _userIds = [];
  

  AuthModel get auth => _auth;

  set auth(AuthModel newAuth) {
    _auth = newAuth;
    notifyListeners();
  }

  List<Profile> get users =>
      _userIds.map((id) => auth.getById(id)).toList();

  void add(Profile profile) {
    _userIds.add(profile.id);
    notifyListeners();
  }
}

class AuthModel {
  Profile getById(int id) => Profile(
        id: id,
        firstName: 'Артемий',
        secondName: 'Левушкин',
        image: 'assets/images/ellipse1.png',
      );

  Profile getByPosition(int position) {
    return getById(position);
  }
}

class Profile {
  final int id;
  final String firstName;
  final String secondName;
  final String image;

  Profile({
    required this.id,
    required this.firstName,
    required this.secondName,
    required this.image,
  });

  @override
  bool operator ==(covariant Profile other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.firstName == firstName &&
        other.secondName == secondName &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        firstName.hashCode ^
        secondName.hashCode ^
        image.hashCode;
  }
}

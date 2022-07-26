// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:flutter/material.dart';

class ProfileModel with ChangeNotifier {
  late AuthModel _auth;
  final List _profileIds = [];

  AuthModel get auth => _auth;

  set auth(AuthModel newAuth){
    _auth = newAuth;
    notifyListeners();
  }

  List<Profile> get profiles =>
      _profileIds.map((id) => auth.getById(id)).toList();

  void add(Profile profile) {
    _profileIds.add(profile.id);
    notifyListeners();
  }
}

class AuthModel {
  Profile getById(int id) => Profile(
        id: id,
        firstName: 'Василий',
        secondName: 'Синичкин',
        order: 12825,
        image: 'assets/images/ellipse1.png',
      );

  Profile getByPosition(int position) {
    return getById(position);
  }

  List<Profile> profile_model = [
    Profile(
        id: 1,
        firstName: 'Alexei',
        secondName: 'Petrov',
        order: 2005,
        image: 'assets/images/unsplash_SvhXD3kPSTY.png'),
  ];
}

class Profile {
  final int id;
  final String firstName;
  final String secondName;
  final int order;
  final String image;

  Profile({
    required this.id,
    required this.firstName,
    required this.secondName,
    required this.order,
    required this.image,
  });

  @override
  bool operator ==(covariant Profile other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.firstName == firstName &&
        other.secondName == secondName &&
        other.order == order &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        firstName.hashCode ^
        secondName.hashCode ^
        order.hashCode ^
        image.hashCode;
  }
}

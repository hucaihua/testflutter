import 'package:flutter/material.dart';
import 'package:testflutter/common/Global.dart';
import 'package:testflutter/model/profile_entity.dart';

///* @Author : Alex Hu
///* @Contact: hucaihua.lzu@gmail.com
///* @Date: on 2023-06-16 16:24
///* @Comment: ProfileModel
/// ```dart
///```
class ProfileModel extends ChangeNotifier{

  ProfileEntity? get profile => Global.profile;

  @override
  void notifyListeners() {
    Global.saveProfile();
    super.notifyListeners();
  }
}
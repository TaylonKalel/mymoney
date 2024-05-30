import 'package:mymoney/models/user_model.dart';
import 'package:mymoney/pages/authentication/validation_email_and_password.dart';
import 'package:mymoney/global/loading_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterUserService {
  final LoadingService loadingService = LoadingService();
  final ValidationEmailAndPassword _validationEmailAndPassword =
      ValidationEmailAndPassword();

  final UserModel _userModel = UserModel();

  String? nameErrorValidate;
  String? emailErrorValidate;
  String? passwordErrorValidate;

  bool hidePassword = true;

  changeHidePassword() {
    hidePassword = !hidePassword;
  }

  setName(String value) {
    _userModel.name = value;
    // print(_userModel.name);
  }

  setEmail(String value) => _userModel.email = value;
  setPassword(String value) => _userModel.password = value;
  setRole(String value) => _userModel.role = value;

  validateName() {
    // print('validate: ${_userModel.name}');
    if (_userModel.name == null || _userModel.name == "") {
      nameErrorValidate = "Campo nome é obrigatório";
    } else {
      nameErrorValidate = null;
    }
    return nameErrorValidate;
  }

  validateEmail() {
    emailErrorValidate =
        _validationEmailAndPassword.validateEmail(_userModel.email);
    return emailErrorValidate;
  }

  validatePassword() {
    passwordErrorValidate =
        _validationEmailAndPassword.validatePassword(_userModel.password);
    return passwordErrorValidate;
  }

  validate() {
    validateName();
    validateEmail();
    validatePassword();
  }

  UserModel getUserModel() {
    return _userModel;
  }

  Future<void> saveUserData() async {
    var r = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _userModel.email!, password: _userModel.password!);
    _userModel.id = r.user?.uid;

    await FirebaseFirestore.instance
        .collection('users')
        .doc(_userModel.id)
        .set({
      'name': _userModel.name,
      'email': _userModel.email,
      'permissions': 'user', // ou outro nível de permissão
    });
  }
}

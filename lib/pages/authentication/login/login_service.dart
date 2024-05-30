import 'package:mymoney/models/login_model.dart';
import 'package:mymoney/models/response.dart';
import 'package:mymoney/models/user_model.dart';
import 'package:mymoney/pages/authentication/validation_email_and_password.dart';
import 'package:mymoney/global/loading_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginService {
  final LoadingService loadingService = LoadingService();
  final ValidationEmailAndPassword _validationEmailAndPassword =
      ValidationEmailAndPassword();

  final LoginModel _loginModel = LoginModel();
  final UserModel _userModel = UserModel();

  String? emailErrorValidate;
  String? passwordErrorValidate;

  bool hidePassword = true;

  changeHidePassword() => hidePassword = !hidePassword;

  setEmail(String value) => _loginModel.email = value;
  setPassword(String value) => _loginModel.password = value;

  validateEmail() {
    emailErrorValidate =
        _validationEmailAndPassword.validateEmail(_loginModel.email);
    return emailErrorValidate;
  }

  validatePassword() {
    passwordErrorValidate =
        _validationEmailAndPassword.validatePassword(_loginModel.password);
    return passwordErrorValidate;
  }

  validate() {
    validateEmail();
    validatePassword();
  }

  Future<Response> login() async {
    try {
      UserCredential r = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _loginModel.email!,
        password: _loginModel.password!,
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(_userModel.id)
          .set({
        'name': r.user!.displayName ?? 'nome',
        'email': r.user!.email,
        'permissions': 'user', // ou outro nível de permissão
      });

      return Response(true, 'Login realizado com sucesso!');
    } on FirebaseAuthException catch (e) {
      String msg = '';
      if (e.code == 'user-not-found') {
        msg = 'Email não encontrado';
      } else if (e.code == "invalid-credential") {
        msg = 'Email ou senha incorretos';
      }
      return Response(false, msg);
    } catch (e) {
      return Response(false, e.toString());
    }
  }
}

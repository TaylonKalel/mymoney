class ValidationEmailAndPassword {
  String? validateEmail(String? email) {
    String? emailErrorValidate;
    final RegExp emailRegExp =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    if (email == null || email == "") {
      emailErrorValidate = "Campo email é obrigatório";
    } else if (!emailRegExp.hasMatch(email)) {
      emailErrorValidate = "Por favor, insira um email válido";
    } else {
      emailErrorValidate = null;
    }
    return emailErrorValidate;
  }

  validatePassword(String? password) {
    String? passwordErrorValidate;
    final RegExp passwordRegExp =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');
    if (password == null || password == "") {
      passwordErrorValidate = "Campo senha é obrigatório";
    } else if (!passwordRegExp.hasMatch(password)) {
      passwordErrorValidate =
          'A senha deve conter pelo menos 1 caractere especial, 1 letra maiúscula, 1 minuscula e 6 dígitos';
    } else {
      passwordErrorValidate = null;
    }
    return passwordErrorValidate;
  }
}

import 'package:mymoney/pages/authentication/register/register_user_page.dart';
import 'package:mymoney/pages/home_page.dart';
import 'package:mymoney/pages/authentication/login/login_page.dart';
import 'package:flutter/material.dart';

routes(BuildContext context) => {
      "/": (context) => const LoginPage(),
      "/home": (context) => const HomePage(title: 'My Money'),
      "/register_user": (context) => const RegisterUserPage(),
    };

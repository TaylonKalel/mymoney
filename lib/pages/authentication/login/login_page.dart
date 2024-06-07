import 'package:mymoney/pages/authentication/login/login_service.dart';
import 'package:mymoney/widgets/button_widget.dart';
import 'package:mymoney/widgets/divider_widget.dart';
import 'package:mymoney/widgets/link_widget.dart';
import 'package:mymoney/widgets/loading_widget.dart';
import 'package:mymoney/widgets/logo_widget.dart';
import 'package:mymoney/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginService = LoginService();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Scaffold(
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (Device.screenType == ScreenType.mobile) {
                return _form();
              } else {
                return body();
              }
            },
          ),
        )),
        Positioned.fill(
          child: Visibility(
            visible: _loginService.loadingService.isLoading,
            child: const LoadingWidget(),
          ),
        ),
      ],
    );
  }

  Widget body() {
    return Center(
      child: SizedBox(
        width: Device.screenType == ScreenType.mobile ? 80.w : 50.w,
        height: 48.w,
        child: Card(
          margin: const EdgeInsets.all(10),
          child: _form(),
        ),
      ),
    );
  }

  Widget _form() {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        child: Column(
          children: [
            titleCard(),
            const DividerWidget(),
            formCard(),
            DividerWidget(
              height: 3.h,
            ),
            footerCard()
          ],
        ),
      ),
    );
  }

  Widget titleCard() {
    return Column(
      children: [
        const LogoWidget(),
        const DividerWidget(),
        TextWidget(
          text: "Login",
          style: TextStyle(fontSize: 18.sp),
        ),
      ],
    );
  }

  Widget formCard() {
    return SizedBox(
      child: Form(
          key: _formKey,
          // autovalidateMode: AutovalidateMode.always,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Por favor, insira seu email',
                    errorText: _loginService.emailErrorValidate),
                onChanged: (value) => _loginService.setEmail(value),
                validator: (v) => _loginService.validateEmail(),
              ),
              const DividerWidget(),
              TextFormField(
                obscureText: _loginService.hidePassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Por favor, insira seu email',
                  errorText: _loginService.passwordErrorValidate,
                  errorMaxLines: 2,
                  suffixIcon: IconButton(
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      _loginService.hidePassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      // Update the state i.e. toogle the state of passwordVisible variable
                      setState(() {
                        _loginService.changeHidePassword();
                      });
                    },
                  ),
                ),
                onChanged: (value) => _loginService.setPassword(value),
                validator: (v) => _loginService.validatePassword(),
              ),
            ],
          )),
    );
  }

  Widget footerCard() {
    return Column(
      children: [
        ButtonWidget(
          onclick: () async {
            if (_formKey.currentState!.validate()) {
              setState(() {
                _loginService.loadingService.active();
              });
              var r = await _loginService.login();
              setState(() {
                _loginService.loadingService.deactive();
              });

              if (r.status) {
                if (mounted) {
                  Navigator.of(context).pushNamed('/home');
                }
              } else {
                _showToast(r.message);
              }
            }
          },
          title: 'Entrar',
        ),
        const DividerWidget(),
        LinkWidget(
          text: 'Cadastre-se',
          onclick: () => Navigator.of(context).pushNamed('/register_user'),
        )
      ],
    );
  }

  void _showToast(String? msg, {bool status = false}) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        showCloseIcon: true,
        closeIconColor: Colors.white,
        backgroundColor: status ? Colors.green : Colors.red,
        content: TextWidget(
          text: msg ?? '',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

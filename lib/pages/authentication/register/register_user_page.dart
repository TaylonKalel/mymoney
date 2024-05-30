import 'package:mymoney/pages/authentication/register/register_user_service.dart';
import 'package:mymoney/widgets/button_widget.dart';
import 'package:mymoney/widgets/divider_widget.dart';
import 'package:mymoney/widgets/link_widget.dart';
import 'package:mymoney/widgets/loading_widget.dart';
import 'package:mymoney/widgets/logo_widget.dart';
import 'package:mymoney/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RegisterUserPage extends StatefulWidget {
  const RegisterUserPage({super.key});

  @override
  State<RegisterUserPage> createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends State<RegisterUserPage> {
  final _registerUserService = RegisterUserService();
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
            visible: _registerUserService.loadingService.isLoading,
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
        height: 55.w,
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
          text: "Cadastrar",
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
                    labelText: 'Nome',
                    hintText: 'Por favor, insira seu email',
                    errorText: _registerUserService.nameErrorValidate),
                onChanged: (value) => _registerUserService.setName(value),
                validator: (v) => _registerUserService.validateName(),
              ),
              const DividerWidget(),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Por favor, insira seu email',
                    errorText: _registerUserService.emailErrorValidate),
                onChanged: (value) => _registerUserService.setEmail(value),
                validator: (v) => _registerUserService.validateEmail(),
              ),
              const DividerWidget(),
              TextFormField(
                obscureText: _registerUserService.hidePassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Por favor, insira seu email',
                  errorText: _registerUserService.passwordErrorValidate,
                  errorMaxLines: 2,
                  suffixIcon: IconButton(
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      _registerUserService.hidePassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      // Update the state i.e. toogle the state of passwordVisible variable
                      setState(() {
                        _registerUserService.changeHidePassword();
                      });
                    },
                  ),
                ),
                onChanged: (value) => _registerUserService.setPassword(value),
                validator: (v) => _registerUserService.validatePassword(),
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
                _registerUserService.loadingService.active();
              });
              await _registerUserService.saveUserData();
              setState(() {
                _registerUserService.loadingService.deactive();
              });
              if (mounted) {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/home', ModalRoute.withName("/"));
              }
            } else {
              setState(() {});
            }
          },
          title: 'Cadastrar',
        ),
        DividerWidget(
          height: 2.h,
        ),
        LinkWidget(
          text: 'Fazer login',
          onclick: () =>
              Navigator.of(context).popUntil(ModalRoute.withName("/")),
        )
        // Text("Login"),
      ],
    );
  }
}

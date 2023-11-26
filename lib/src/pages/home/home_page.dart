import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prova_flutter/src/core/helpers/size_extensions.dart';
import 'package:prova_flutter/src/core/shared/url_launcher.dart';
import 'package:prova_flutter/src/core/styles/colors_app.dart';
import 'package:prova_flutter/src/core/styles/text_styles.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _userController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LoadingAnimationWidget.dotsTriangle(
                color: context.colors.whiteAux,
                size: 60,
              ),
              SizedBox(
                height: context.percentHeight(.03),
              ),
              Text(
                "Loading",
                style: context.textStyles.textLight.copyWith(
                  color: context.colors.whiteAux,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        );
      },
    );
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pop(context);
    }).whenComplete(
      () => Navigator.pushNamed(
        context,
        '/informationPage',
      ),
    );
  }

   var urlLauncher = UrlLauncher();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            context.colors.backgroundLinearOne,
            context.colors.backgroundLinearTwo,
            context.colors.backgroundLinearThree,
          ],
        )),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          "Usuário",
                          style: context.textStyles.textLight.copyWith(
                            color: context.colors.whiteAux,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                        controller: _userController,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(20),
                        ],
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            size: 25,
                            color: context.colors.secondary,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'O campo usuário não pode estar vazio';
                          } else if (value != value.trim()) {
                            return 'O usuário não pode ter espaços no final';
                          }
                          return null;
                        }),
                    SizedBox(
                      height: context.percentHeight(.04),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          "Senha",
                          style: context.textStyles.textLight.copyWith(
                            color: context.colors.whiteAux,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _passwordController,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(20),
                      ],
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          size: 25,
                          color: context.colors.secondary,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'O campo senha não pode estar vazio';
                        } else if (value.length < 2) {
                          return 'O campo senha não pode ter menos que dois caracteres';
                        } else if (!RegExp(r'^[a-zA-Z0-9 ]+$').hasMatch(value)) {
                          return 'A senha deve conter apenas letras de A a Z e números de 0 a 9';
                        } else if (value != value.trim()) {
                          return 'A senha não pode ter espaços no final';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: context.percentHeight(.03),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: context.colors.greenAux,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        minimumSize: Size(
                          context.percentWidth(.4),
                          context.percentHeight(.06),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _onLoading();
                        }
                      },
                      child: Text(
                        "Entrar",
                        style: TextStyle(color: context.colors.whiteAux),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: GestureDetector(
                      onTap: () async {
                      await urlLauncher.launch(Uri.parse('https://www.google.com'));                    
                      },
                      child: Text(
                        "Política de Privacidade",
                        style: context.textStyles.textLight.copyWith(
                          color: context.colors.whiteAux,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

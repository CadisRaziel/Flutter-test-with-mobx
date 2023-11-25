import 'package:flutter/material.dart';
import 'package:prova_flutter/src/core/helpers/size_extensions.dart';
import 'package:prova_flutter/src/core/styles/colors_app.dart';
import 'package:prova_flutter/src/core/styles/text_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        "Usuário",
                        style: context.textStyles.textLight.copyWith(
                          color: context.colors.textAux,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        size: 25,
                        color: context.colors.secondary,
                      ),
                    ),
                  ),
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
                          color: context.colors.textAux,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        size: 25,
                        color: context.colors.secondary,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: context.percentHeight(.03),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.colors.buttonHomePage,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      minimumSize: Size(
                        context.percentWidth(.4),
                        context.percentHeight(.06),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Entrar",
                      style: TextStyle(color: context.colors.textAux),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: Text(
                      "Política de Privacidade",
                     style: context.textStyles.textLight.copyWith(
                          color: context.colors.textAux,
                          fontSize: 16,
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

##_Teste flutter_

![image](https://github.com/CadisRaziel/Flutter-test-with-mobx/assets/70340981/d412322c-9930-4926-b69b-365218a094e6)
> A tela deve conter:
- Um Campo de senha
- Um campo de texto para representar o Login
- Um Label descrito "PolíƟca de privacidade"

> Como tela deve se comportar
- Verificar e alertar se ambos os campos de Login e senha estão preenchidos. ( O campo senha não pode ter menos que dois caracteres. - O campo senha não pode ter caracteres especiais, sendo apenas possível informar 'a' até 'Z' e '0' até '9'.)
- Ambos os campos não podem ultrapassar 20 caracteres.
- Ambos os campos não podem terminar com o caractere de espaço no final.
- Se ambas as informações esƟveram preenchidas deve ir para a próxima tela.
- Ao tocar no label "politica de privacidade" uma página web direcionada para o
google.com.br deve ser aberta. 

![image](https://github.com/CadisRaziel/Flutter-test-with-mobx/assets/70340981/78bd63c6-b45f-4378-8416-bfb81b72084f)
> A tela deve conter
- Um card principal e central
- Um campo de texto 

> Como a tela deve se comportar
- O foco da digitação deve estar o tempo todo no campo de "Digite seu texto" e não pode
ser perdido ao interagir com a tela.
- Ao acionar o "enter" o campo tem que verificar se a informação foi preenchida.
- O Card principal deve receber a informação digitada do campo.
- As informações precisam ser salvas e lidas uƟlizando a biblioteca shared_ preferences
(https://pub.dev/packages/shared_preferences)
- O Icone de excluir deve abrir um pop-up confirmando a ação.
- Obrigatório a utilização do plugin MOBX para a construção da tela. 


Para executar:
```sh
flutter pub get
flutter run
```

Branch: Main

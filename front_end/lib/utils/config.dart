import 'package:flutter/material.dart';

class Config {
  // Três variáveis estáticas são declaradas para armazenar informações
  // relacionadas à configuração da tela. mediaQueryData armazena os dados
  // da consulta de mídia (MediaQuery), enquanto screenWidth e screenHeight
  // armazenam as dimensões da tela.

  // Em Dart, o operador ? é usado para indicar que uma variável pode aceitar o valor null.

  static MediaQueryData? mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;

  void int(BuildContext context) {
    // Neste trecho, o método init utiliza o MediaQuery para obter os dados de
    // mídia do contexto fornecido. Em seguida, ele extrai a largura (width) e
    // altura (height) da tela a partir desses dados e as atribui às variáveis
    // estáticas screenWidth e screenHeight, respectivamente.

    mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData!.size.width;
    screenHeight = mediaQueryData!.size.height;

    // O operador ! em Dart é chamado de operador de asserção de não nulidade
    // (non-null assertion operator). Ele é usado para indicar ao compilador que
    // você está confiante de que uma expressão não será nula durante o tempo de
    // execução, mesmo que o sistema de tipos pense que ela poderia ser nula.
  }

  static get widthSize {
    return screenWidth;
  }

  static get heightSize {
    return screenHeight;
  }

  // definido a altura do espaçamento
  static const spaceSmall = SizedBox(
    height: 25,
  );

  static final spaceMedium = SizedBox(
    height: screenHeight! * 0.05,
  );

  static final spaceBig = SizedBox(
    height: screenHeight! * 0.08,
  );

  // bordas e cores
  static const outlinedBorder =
      OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8)));

  static const focusBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(
        color: Colors.greenAccent,
      ));

  static const errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(
        color: Colors.red,
      ));

  static const primaryColor = Colors.greenAccent;
}

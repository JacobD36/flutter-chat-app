import 'dart:ui';

import 'package:chat/widgets/boton_azul_widget.dart';
import 'package:chat/widgets/custom_widget.dart';
import 'package:chat/widgets/labels_widget.dart';
import 'package:chat/widgets/logo_widget.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LogoWidget(titulo: 'Registro'),
                _Form(),
                LabelsWidget(ruta: 'login'),
                Text('Términos y condiciones de Uso', style: TextStyle(fontWeight: FontWeight.w200))
              ],
            ),
          ),
        ),
      ),
   );
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomImput(
            icon: Icons.perm_identity,
            placeholder: 'Nombre',
            keyboardType: TextInputType.emailAddress,
            textController: nameCtrl,
          ),
          CustomImput(
            icon: Icons.mail_outline,
            placeholder: 'Correo electrónico',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          CustomImput(
            icon: Icons.lock, 
            placeholder: 'Contraseña', 
            textController: passCtrl,
            isPassword: true,
          ),
          BotonAzulWidget(
            text: 'Ingrese',
            onPressed: () {
              print(emailCtrl.text);
              print(passCtrl.text);
            },
          )
        ],
      ),
    );
  }
}
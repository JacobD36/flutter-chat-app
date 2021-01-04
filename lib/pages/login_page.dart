import 'dart:ui';
import 'package:chat/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:chat/helpers/mostrar_alerta.dart';
import 'package:chat/services/auth_service.dart';
import 'package:chat/widgets/boton_azul_widget.dart';
import 'package:chat/widgets/custom_widget.dart';
import 'package:chat/widgets/labels_widget.dart';
import 'package:chat/widgets/logo_widget.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {

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
                LogoWidget(titulo: 'Messenger'),
                _Form(),
                LabelsWidget(ruta: 'register'),
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
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final socketService = Provider.of<SocketService>(context);

    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
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
            onPressed: authService.autenticando? null : () async {
              FocusScope.of(context).unfocus();
              final loginOk = await authService.login(emailCtrl.text.trim(), passCtrl.text.trim());
              if(loginOk) {
                socketService.connect();
                Navigator.pushReplacementNamed(context, 'usuarios');
              } else {
                mostrarAlerta(context, 'Login incorrecto', 'Revise sus credenciales');
              }
            },
          )
        ],
      ),
    );
  }
}
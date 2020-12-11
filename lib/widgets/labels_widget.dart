import 'package:flutter/material.dart';

class LabelsWidget extends StatelessWidget {
  final String ruta;

  const LabelsWidget({
    Key key, 
    @required this.ruta
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text((this.ruta == 'register')? '¿No tienes cuenta?' : '¿Ya tienes cuenta?', style: TextStyle(color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w300)),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, this.ruta);
            },
            child: Text((this.ruta != 'login') ? '¡Crea una ahora!' : 'Ingresa a tu cuenta', style: TextStyle(color: Colors.blue[600], fontSize: 18, fontWeight: FontWeight.bold))
          )
        ],
      ),
    );
  }
}
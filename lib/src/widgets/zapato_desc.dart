import 'package:flutter/material.dart';

class ZapatoDescripcion extends StatelessWidget {
  final String titulo;
  final String descripcion;

  const ZapatoDescripcion({Key? key, required this.titulo, required this.descripcion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20,),
          Text(titulo, style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),),
          Text(descripcion, style: TextStyle(color: Colors.black54, height: 1.6),),
        ],
      ),
    );
  }
}

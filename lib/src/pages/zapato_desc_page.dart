import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoesapp/src/helpers/helpers.dart';
import 'package:shoesapp/src/models/zapato_model.dart';
import 'package:shoesapp/src/widgets/custom_widgets.dart';

class ZapatoDescPage extends StatelessWidget {
  const ZapatoDescPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    cambiarStatusLight();
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: 'zapato-1',
                child: ZapatoSizePreview(fullScreen: true),
              ),
              Positioned(
                top: 80,
                child: FloatingActionButton(
                  child: Icon(Icons.chevron_left, color: Colors.white, size: 60,),
                  onPressed: (){
                    cambiarStatusDark();
                    Navigator.pop(context);
                  },
                  elevation: 0,
                  highlightElevation: 0,
                  backgroundColor: Colors.transparent,
                ),
              )
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  ZapatoDescripcion(
                    titulo: "Nike Air Max 720",
                    descripcion: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),
                  _MontoBuyNow(monto: 180,),
                  _ColoresYmas(),
                  _BotonesLikeCartSettings()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BotonesLikeCartSettings extends StatelessWidget {
  const _BotonesLikeCartSettings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _BotonSombreado(icon: Icon(Icons.star, color: Colors.red, size: 25,)),
          _BotonSombreado(icon: Icon(Icons.add_shopping_cart, color: Colors.grey.withOpacity(0.4), size: 25,)),
          _BotonSombreado(icon: Icon(Icons.settings, color: Colors.grey.withOpacity(0.4), size: 25,)),
        ],
      ),
    );
  }
}

class _BotonSombreado extends StatelessWidget {
  final Icon icon;
  const _BotonSombreado({
    Key? key,
    required this.icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: icon,
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: Colors.black12, spreadRadius: -5, blurRadius: 20, offset: Offset(0, 10))
        ]
      ),
    );
  }
}

class _ColoresYmas extends StatelessWidget {
  const _ColoresYmas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(left:90, child: _BotonColor(color: Color(0xff364d56), index: 4, urlImagen: 'assets/imgs/negro.png')),
                Positioned(left:60, child: _BotonColor(color: Color(0xff2099f1), index: 3, urlImagen: 'assets/imgs/azul.png')),
                Positioned(left:30, child: _BotonColor(color: Color(0xffffad29), index: 2, urlImagen: 'assets/imgs/amarillo.png')),
                _BotonColor(color: Color(0xffc6d642), index: 1, urlImagen: 'assets/imgs/verde.png'),
              ],
            )
          ),
          BotonNaranja(texto: 'More related items', alto: 30, ancho: 170, color: Color(0xffffc675),)
        ],
      ),
    );
  }
}

class _BotonColor extends StatelessWidget {
  final Color color;
  final int index;
  final String urlImagen;

  const _BotonColor({
    required this.color,
    required this.index,
    required this.urlImagen,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      delay: Duration(milliseconds: index*100),
      duration: Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () {
          final zapatoModel = Provider.of<ZapatoModel>(context, listen: false);
          zapatoModel.assetImage = urlImagen;
        },
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle
          ),
        ),
      )
    );
  }
}

class _MontoBuyNow extends StatelessWidget {
  final double monto;
  const _MontoBuyNow({
    Key? key,
    required this.monto
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
        child: Row(
          children: [
            Text('\$$monto', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
            Spacer(),
            Bounce(
              delay: Duration(seconds: 1),
              from: 8,
              child: BotonNaranja(texto: 'Buy now', ancho: 120, alto: 38,)
            ),
          ],
        ),
      ),
    );
  }
}

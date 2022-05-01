import 'package:flutter/material.dart';
import 'package:shoesapp/src/widgets/custom_widgets.dart';

class AgregarCarritoBoton extends StatelessWidget {
  final double monto;
  const AgregarCarritoBoton({Key? key, required this.monto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.10),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          children: [
            SizedBox(width: 20,),
            Text('\$$monto', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
            Spacer(),
            BotonNaranja(texto: 'Add to car'),
            SizedBox(width: 20,)
          ],
        ),
      ),
    );
  }
}

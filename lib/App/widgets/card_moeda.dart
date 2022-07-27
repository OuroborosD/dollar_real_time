import 'package:flutter/material.dart';

class Card_Moeda extends StatefulWidget {
  const Card_Moeda({super.key});

  @override
  State<Card_Moeda> createState() => _Card_MoedaState();
}

class _Card_MoedaState extends State<Card_Moeda> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Card(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2, 
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text('BRL',style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),),
                  )),
                Expanded(
                  // expanded
                  flex: 8,
                  child: TextField(
                    decoration: InputDecoration(
                     border: InputBorder.none
                    ) ,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                  ), // texto
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

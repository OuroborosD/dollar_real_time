import 'package:dollar_real_time/App/widgets/card_moeda.dart';
import 'package:flutter/material.dart';

import '../Controller/request.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Contação de moedas'),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.refresh))],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 3,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                child: Column(children: [
                  Text('contação atualizada em:'),
                ]),
              ),
            ),
            Flexible(
              flex: 7,
              child: Container(
                padding: EdgeInsets.only(top: 30.00),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(40), topLeft: Radius.circular(40))
                  ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child:ListView(// ====== aqui
                        shrinkWrap: true,
                        children: [
                         
                          Card_Moeda(),
                          Card_Moeda(),
                          Card_Moeda(),
                        ],
                      ),
                    ),
                    Container(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {}, child: Text('teste')))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

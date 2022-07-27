import 'package:dollar_real_time/App/Controller/db.dart';
import 'package:dollar_real_time/App/Controller/request.dart';
import 'package:dollar_real_time/App/Models/Money.dart';
import 'package:flutter/material.dart';

class db_request {
  Db_controller aux_db = Db_controller();
  List<Money> card_values = [];

  putData() async {
    getfinance().then((money_actual) async {
      print(money_actual);
      for (var i in money_actual['results']['currencies'].entries) {
        // vai percorrer  todo o map, e dizer o key e value
        if (i.value.runtimeType != String) {
          print('${i.key}  ---- ${i.value}');
          // verifica, se está retornando um mapa ou string, map, não tem muitos dados
          Money ressult_filtred = Money(
            date: DateTime.now(),
            name: i[i.key]['name'],
            sigla: i.key,
            value: i[i.key]['buy'],
          );
          print(ressult_filtred);
          await aux_db.insertMoney(ressult_filtred);
          await aux_db.getAll().then((list){
            print(list);
            print('================================================');
            card_values = list as List<Money>;
            print(card_values);
          });
        }
      }
    });
  }
}

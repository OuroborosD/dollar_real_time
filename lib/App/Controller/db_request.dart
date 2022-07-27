import 'package:dollar_real_time/App/Controller/db.dart';
import 'package:dollar_real_time/App/Controller/request.dart';
import 'package:dollar_real_time/App/Models/Money.dart';
import 'package:flutter/material.dart';

class db_request {
  Db_controller aux_db = Db_controller(); // cria um objeto da classe
  List<Money> card_values = [];
  int increment = 0;
  putData() async {
    getfinance().then((money_actual) async {
      if (await aux_db.getSize() == 0) {
        for (var i in money_actual.entries) {
          // vai percorrer  todo o map, e dizer o key e value
          if (i.value.runtimeType != String) {
            // verifica, se está retornando um mapa ou string, map, não tem muitos dados
            //print('${i.key}  ---- ${i.value}');
            Money result_filtred = Money(
              date: DateTime.now(),
              name: i.value['name'],
              sigla: i.key.toString(),
              value: i.value['buy'],
            );
            await aux_db.insertMoney(result_filtred);
          }
        }
      } else {
        // caso não esteja vazio, vai  atualizar
        for (var i in money_actual.entries) {
          // vai percorrer  todo o map, e dizer o key e value
          if (i.value.runtimeType != String) {
            // verifica, se está retornando um mapa ou string, map, não tem muitos dados
            //print('${i.key}  ---- ${i.value}');
            aux_db.getAll().then((list) async {
              print('${list.length}  count:$increment');
              Money result_filtred = Money(
                id: list[increment].id,
                date: DateTime.now(),
                name: i.value['name'],
                sigla: i.key.toString(),
                value: i.value['buy'],
              );
              if (increment <= list.length) {
                increment++;
              }
              print('entra no upgrade ${result_filtred.id}');
              await aux_db.updateMoney(result_filtred);
              
            });
          }
        }
        increment = 0;
      }
      await getAllData();
    });
  }

  getAllData() {
    aux_db.getAll().then((list) {
      card_values = list as List<Money>;
      print('-----------------------------');
      print(card_values);
    });
  }
}

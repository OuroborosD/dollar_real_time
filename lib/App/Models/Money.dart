class Money{
  Money({this.date,this.id,this.name,this.value,this.sigla});
  int? id;
  String? sigla;
  double? value;
  String? name;
  DateTime? date;

  Money.fromMap(Map map){
    id = map['id'];
    value = map['value'];
    name = map['name'];
    date = DateTime.parse(map['date']);
    sigla = map['sigla'];
  }

    Map<String, dynamic> toMap(){// transforma o objeto em mapa
   Map<String, dynamic> map = {// não tem id, pois é o banco de dados que vai gerar
    'id': id, // 
    'date': date.toString(),// converte a data para uma String 
    'value':value,
    'name':name,
    'sigla':sigla,
   };
   if( id != null){//
    map['id'] = id;
   }
   return map;
  }

    @override
 String toString(){// override, para mostrar otodos os dados de forma fácil
  return 'id: $id, Sigla: $sigla, price: $value ,data: $date';
 }
}
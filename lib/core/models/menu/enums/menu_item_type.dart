import 'package:json_annotation/json_annotation.dart';

@JsonEnum(alwaysCreate: true)
enum MenuItemType {
  none,
  profile,
  workflow,
  /*Formio ile çalışacak formları bu sayede tetikleyecek*/
  entity,
  /* Bir modele bağlı ise o modele gidecek. */
  group,
  /* Alt menüsü varsa bu eklenecek */
  divider,
  /* sadece ayırıcı */
  query
  /* sürekli bütün isteklere gereken queryleri ekler */
  ;
}

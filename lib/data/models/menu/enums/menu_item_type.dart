enum MenuItemType {
  none,
  profile,
  workflow,
  /*Formio ile çalışacak formları bu sayede tetikleyecek*/
  entity,
  /* Bir modele bağlı ise o modele gidecek. */
  group,
  /* Alt menüsü varsa bu eklenecek */
  divider; /* sadece ayırıcı */

  factory MenuItemType.fromMap(String value) {
    switch (value) {
      case "workflow":
        return MenuItemType.workflow;
      case "entity":
        return MenuItemType.entity;
      case "profile":
        return MenuItemType.profile;
      case "group":
        return MenuItemType.group;
      case "divider":
        return MenuItemType.divider;
      default:
        return MenuItemType.none;
    }
  }
  String toMap() => name;
}

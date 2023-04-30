class Team {
  String? name;
  List<SubMenu>? subMenu;

  Team({this.name, this.subMenu});

  Team.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['subMenu'] != null) {
      subMenu = <SubMenu>[];
      json['subMenu'].forEach((v) {
        subMenu!.add(SubMenu.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (subMenu != null) {
      data['subMenu'] = subMenu!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubMenu {
  String? name;

  SubMenu({this.name});

  SubMenu.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    return data;
  }
}

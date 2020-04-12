class ItemUnMed
{
  String id;
  String descr;

  ItemUnMed(this.id, this.descr);

  ItemUnMed.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descr = json['descr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['descr'] = this.descr;
    return data;
  }

}
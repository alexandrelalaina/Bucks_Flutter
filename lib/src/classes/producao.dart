
// import 'package:bucks/src/classes/producaoTipo.dart';

class Producao
{
  int id;
  // ProducaoTipo fkProducaoTispoId;
  int fkProducaoTipoId;
  String descr;
  String dtProducaoIni; // 2016-01-01 10:20:05.123 // YYYY-MM-DD HH:MM:SS.SSS
  String dtProducaoFim;
  String cdStatus;
  
  Producao(this.id,
           this.fkProducaoTipoId, 
           this.descr,
           this.dtProducaoIni,
           this.dtProducaoFim,
           this.cdStatus
     );

  Producao.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fkProducaoTipoId = json['fk_producao_tipo_id'];
    descr = json['descr'];
    dtProducaoIni = json['dt_producao_ini'];
    dtProducaoFim = json['dt_producao_fim'];
    cdStatus = json['cd_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fk_producao_tipo_id'] = this.fkProducaoTipoId;
    data['descr'] = this.descr;
    data['dt_producao_ini'] = this.dtProducaoIni;
    data['dt_producao_fim'] = this.dtProducaoFim;
    data['cd_status'] = this.cdStatus;
    return data;
  }

}
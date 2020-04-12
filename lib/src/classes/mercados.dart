class MercadosHelper {
  String indiceSgNome;
  String indiceSg;
  num acomp;

  MercadosHelper({this.indiceSgNome, this.indiceSg, this.acomp});

  factory MercadosHelper.fromJson(Map<String, dynamic> json) {
    return MercadosHelper(
      indiceSgNome: json['indiceSgNome'] as String,
      indiceSg: json['indiceSg'] as String,
      acomp: json['acomp'] as num,
    );
  }

  Map toMap() {
    Map<String, dynamic> map = {
      "indiceSgNome": indiceSgNome,
      "indiceSg": indiceSg,
      "acomp": acomp,
    };

    return map;
  }
}

class Mercados {
  String grupo;
  String indiceSgNome;
  String indiceSg;
  String dt;
  num vl;
  String vlPerc;
  num vlMin;
  num vlMax;
  num vlFechamento;
  num vlDiferenca;
  String sit;
  num qtdReg;
  num qtdHist;

  Mercados(
      {this.grupo,
      this.indiceSgNome,
      this.indiceSg,
      this.dt,
      this.vl,
      this.vlPerc,
      this.vlMin,
      this.vlMax,
      this.vlFechamento,
      this.vlDiferenca,
      this.sit,
      this.qtdReg,
      this.qtdHist});

  factory Mercados.fromJson(Map<String, dynamic> json) {
    return Mercados(
        grupo: json['grupo'] as String,
        indiceSgNome: json['indiceSgNome'] as String,
        indiceSg: json['indiceSg'] as String,
        dt: json['dt'] as String,
        vl: json['vl'] as num,
        vlPerc: json['vlPerc'] as String,
        vlMin: json['vlMin'] as num,
        vlMax: json['vlMax'] as num,
        vlFechamento: json['vlFechamento'] as num,
        vlDiferenca: json['vlDiferenca'] as num,
        sit: json['sit'] as String,
        qtdReg: json['qtdReg'] as num,
        qtdHist: json['qtdHist'] as num);
  }

  Map toMap() {
    Map<String, dynamic> map = {
      "grupo": grupo,
      "indiceSgNome": indiceSgNome,
      "indiceSg": indiceSg,
      "dt": dt,
      "vl": vl,
      "vlPerc": vlPerc,
      "vlMin": vlMin,
      "vlMax": vlMax,
      "vlFechamento": vlFechamento,
      "vlDiferenca": vlDiferenca,
      "sit": sit,
      "qtdReg": qtdReg,
      "qtdHist": qtdHist,
    };

    return map;
  }

  @override
  String toString() => this.indiceSg;
}

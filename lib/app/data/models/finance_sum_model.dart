class FinanceSum {
  int? pengeluaran;
  int? pemasukan;

  FinanceSum({this.pengeluaran, this.pemasukan});

  FinanceSum.fromJson(Map<String, dynamic> json) {
    pengeluaran = json['pengeluaran'];
    pemasukan = json['pemasukan'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['pengeluaran'] = pengeluaran;
    data['pemasukan'] = pemasukan;
    return data;
  }
}

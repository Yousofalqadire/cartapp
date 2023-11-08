class Item {
  final int id;
  final String name;
  final double price;
  final double rate;
  final String subTitle;
   int qty;
  double? offer;
  final String photo;
  final double chart;
  final double calury;
  Item({
    required this.id,
    required this.name,
    required this.subTitle,
    required this.price,
     this.qty = 0,
    required this.rate,
    required this.photo,
    required this.calury,
    required this.chart,
    this.offer,
  });
}

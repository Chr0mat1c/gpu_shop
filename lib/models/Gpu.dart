class Gpu {
  String imagePath;
  String name;
  String ram;
  String price;
  String typeRam;
  String rating;
  String description;

  Gpu({
    required this.imagePath,
    required this.name,
    required this.ram,
    required this.price,
    required this.typeRam,
    required this.rating,
    required this.description,
  });

  String get _imagePath => imagePath;
  String get _name => name;
  String get _ram => ram;
  String get _price => price;
  String get _typeRam => typeRam;
  String get _rating => rating;
  String get _description => description;
}

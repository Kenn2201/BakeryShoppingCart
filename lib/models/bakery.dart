class Bakery {
  final String name;
  final String open;
  final String close;
  final String distance;
  final String image;
  Bakery({
    required this.close,
    required this.distance,
    required this.image,
    required this.name,
    required this.open,
  });
}

List<Bakery> bakeryList = [
  Bakery(
    name: "Pig Bread",
    open: "09.00",
    close: "20.00",
    distance: "5.5",
    image: "assets/pig.jpg",
  ),
  Bakery(
    name: "Hotdog Bread",
    open: "09.00",
    close: "20.00",
    distance: "5.5",
    image: "assets/hotdog.jpg",
  ),
  Bakery(
    name: "Croissant",
    open: "09.00",
    close: "20.00",
    distance: "5.5",
    image: "assets/cross.jpg",
  ),

];

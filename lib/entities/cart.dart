class Cart {
  String? id;
  String? uid;
  String? name;
  int quantity;
  int price;
  String? image;

  Cart(
      { this.id,
        this.uid,
        this.name,
      required this.quantity,
      required this.price,
       this.image});
}

class Items
{
  int price;
  String name;
  String photo;

  Items({required this.name,required this.price,required this.photo});
  @override
  String toString() {

    return name;
  }

}

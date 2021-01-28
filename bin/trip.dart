class Trip{

  int id ,passengersLimit,daysNumber;
  DateTime tripDate;
  String whereTo, whereFrom;
  int price;
  int passengersCount = 0;
  int availablePlaces;
  int newPrice;
  List<int> passengerIds = <int>[];

  Trip({this.id,this.passengersLimit, this.daysNumber, this.tripDate,
      this.whereTo, this.whereFrom, this.price})
  {
    availablePlaces = passengersLimit;

    newPrice = discount(price);

  }

  int discount(int price)
  {
    if(price >= 10000)
    {
      return price - price*20~/100;
    }
    return null;
  }
}
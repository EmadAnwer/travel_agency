import 'dart:io';
import 'dart:math';

import 'passenger.dart';
import 'trip.dart';
import 'package:intl/intl.dart';
final String SPACE = '\t'*5;
class TripList {

  List<Trip> list = <Trip>[];
  List<Trip> spearList = <Trip>[];
  List<Passenger> passengers = <Passenger>[];

  void _tripTemplate({int id, int passengersLimit,
                      int daysNumber , DateTime tripDate,
                      String whereTo,String whereFrom,
                      int price , int availablePlaces , int passengersCount,int newPrice})
  {

    var _start = DateFormat('dd/MM/yyyy').format(tripDate).toString();
    var  _end =  DateFormat('dd/MM/yyyy').format(tripDate.add(Duration(days:daysNumber ))).toString();



    print(SPACE+'**'*20);
    print(SPACE+'id : $id \n'
        +SPACE+'Price : ${price} LE\n'
        +SPACE+'Limit : ${passengersLimit}\n'
        +SPACE+'From : $_start\t To : $_end\n'
        +SPACE+'Available Places : $availablePlaces\tPassengers Count : $passengersCount');

    if(newPrice != null)
    {

      print(SPACE+'Discount : (20 %) \tNew price: $newPrice');
    }

      print(SPACE+'**'*20);

  }

  void startValue()
  {
    var whereFrom= <String> ['Alex','cairo','aswan'];
    var whereTo= <String> ['tanta','giza','luxor'];
    var r = Random();
    for(var i = 0; i < 5; i++)
      {
        list.add(Trip(
          id : list.length + 1,
          price:2000 + r.nextInt(10000),
          tripDate: DateFormat('dd/MM/yyyy').parse('${r.nextInt(25)}/4/2021'),
          daysNumber: r.nextInt(5),
          passengersLimit: r.nextInt(20),
          whereFrom: whereFrom[r.nextInt(3)],
          whereTo: whereTo[r.nextInt(3)],

        ));
      }
  }




  void addTrip() {

    int passengersLimit,price,daysNumber;
    DateTime tripDate;
    String whereTo ,  whereFrom ;
    print("\x1B[2J\x1B[0;0H");
    print(SPACE+'-'*20 + 'Adding a trip' + '-'*20+'\n');

    //passing location
    stdout.write(SPACE+'-whereTo : ');
    whereTo = stdin.readLineSync();
    stdout.write(SPACE+'-Where From : ');
    whereFrom = stdin.readLineSync();

    // passing price
    do{
      stdout.write(SPACE+'-price : ');
      price =int.parse(stdin.readLineSync()) ;
    }while(price <= 0);

    // passengers Limit
    do{
      stdout.write(SPACE+'-passengers Limit : ');
      passengersLimit =int.parse(stdin.readLineSync()) ;
    }while(passengersLimit <= 0);

    // Days Number
    do{
      stdout.write(SPACE+'-Days Number : ');
      daysNumber = int.parse(stdin.readLineSync());
    }while(daysNumber <= 0);

    // Trip Date
    print(SPACE+'Trip Date');
    var day,month,year;
    do{
      stdout.write(SPACE+'*Day : ');
      day = int.parse(stdin.readLineSync()) ;
      stdout.write(SPACE+'*Month : ');
      month = int.parse(stdin.readLineSync()) ;
      stdout.write(SPACE+'*Year : ');
      year = int.parse(stdin.readLineSync()) ;
    }while(day <= 0 || year <= 0 || month <= 0);
    tripDate = DateFormat('dd/MM/yyyy').parse('$day/$month/$year');



    list.add(Trip(
      id : list.length + 1,
      price: price,
      tripDate:tripDate,
      daysNumber: daysNumber,
      passengersLimit: passengersLimit,
      whereFrom: whereFrom,
      whereTo: whereTo,
    ));
    print(SPACE+'trip ${list.last.id} has been added ');
  }
  void editTrip() {
    int tripId;
    stdout.write(SPACE+'-Trip ID : ');
    tripId =int.parse(stdin.readLineSync()) ;
    --tripId;
    if(tripId <= 0 || tripId > list.length)
      {
        print(SPACE+'invalid Trip ID');
        return;
      }
    
    String edit;

    print("\x1B[2J\x1B[0;0H");
    print(SPACE+'-'*20 + 'Adding a trip' + '-'*20+'\n');

    //passing location
    stdout.write(SPACE+'-whereTo : ');
    edit = stdin.readLineSync();
    list[tripId].whereTo = edit != ''? edit : list[tripId].whereTo;
    stdout.write(SPACE+'-Where From : ');
    edit = stdin.readLineSync();
    list[tripId].whereFrom = edit != ''? edit : list[tripId].whereFrom;

    // passing price
    do{
      stdout.write(SPACE+'-price : ');
      edit = stdin.readLineSync();
      list[tripId].price = edit != ''? int.parse(edit) : list[tripId].price;

    }while(list[tripId].price <= 0);

    // passengers Limit
    do{
      stdout.write(SPACE+'-passengers Limit : ');
      edit = stdin.readLineSync();
      list[tripId].passengersLimit = edit != ''? int.parse(edit) : list[tripId].passengersLimit;
    }while(list[tripId].passengersLimit <= 0);

    // Days Number
    do{
      stdout.write(SPACE+'-Days Number : ');
      edit = stdin.readLineSync();
      list[tripId].daysNumber = edit != ''? int.parse(edit) : list[tripId].daysNumber;
    }while(list[tripId].daysNumber <= 0);

    // Trip Date
    print(SPACE+'Trip Date');
    var day,month,year;
    do{
      stdout.write(SPACE+'*Day : ');
      day = int.parse(stdin.readLineSync()) ;
      stdout.write(SPACE+'*Month : ');
      month = int.parse(stdin.readLineSync()) ;
      stdout.write(SPACE+'*Year : ');
      year = int.parse(stdin.readLineSync()) ;
    }while(day <= 0 || year <= 0 || month <= 0);
    list[tripId].tripDate = DateFormat('dd/MM/yyyy').parse('$day/$month/$year');

    print(SPACE+'Trip with ID : ${tripId+1} has edited');
  }
  void viewTrips() {
    spearList.addAll(list);

    spearList.sort((a,b) {
      return a.tripDate.millisecondsSinceEpoch.compareTo(b.tripDate.millisecondsSinceEpoch);
    });

    spearList.forEach((trip) {
      _tripTemplate(
          tripDate: trip.tripDate,
          whereTo: trip.whereTo,
          whereFrom: trip.whereFrom,
          passengersLimit: trip.passengersLimit,
          daysNumber: trip.daysNumber,
          price: trip.price,
          availablePlaces: trip.availablePlaces,
          id: trip.id,
          passengersCount: trip.passengersCount,
          newPrice: trip.newPrice

      );
    });

    spearList.clear();
  }
  void deleteTrip() {
    print('\x1B[2J\x1B[0;0H');
    int id ;
    do{
      stdout.write(SPACE+'-Trip ID : ');
      id =int.parse(stdin.readLineSync()) ;
    }while(id <= 0);

    id--;
    if(id < 0 || id > list.length-1 )
      {
        print(SPACE+'invalid id');
        return;
      }

    // shift all trips after id by 1
    for(var i = id+1; i < list.length; i++)
      {
        list[i].id--;
      }

    list.removeAt(id);
    print(SPACE+'Trip with id :${id+1} has been removed');


  }
  void searchTrip() {

    int price;
    do{
      stdout.write(SPACE+'-Trip price : ');
      price =int.parse(stdin.readLineSync()) ;
    }while(price <= 0);

    String _start ,_end;
    var flag = false;
    list.forEach((trip) {
      
      if(trip.price == price)
       {
         flag = true;
         _start = DateFormat('dd/MM/yyyy').format(trip.tripDate).toString();
         _end =  DateFormat('dd/MM/yyyy').format(trip.tripDate.add(Duration(days:trip.daysNumber ))).toString();

         print(SPACE+'**'*20);
         print(SPACE+'id : ${trip.id} \n'+SPACE+'From : ${trip.whereFrom}\t To : ${trip.whereTo}');
         print(SPACE+'Price : ${trip.price} LE\n'+SPACE+'From : $_start\t To : $_end');

       }
    });
    
    if(!flag) {
      print(SPACE+'there is no trips in $price LE');
    }


    
  }
  void reserve() {

    int tripId;
    stdout.write(SPACE+'-Trip ID : ');
    tripId =int.parse(stdin.readLineSync()) ;
    --tripId;
    if(tripId < 0 || tripId > list.length)
    {
      print(SPACE+'invalid Trip ID');
      return;
    }

    stdout.write(SPACE+'-Name : ');
    String name =  stdin.readLineSync();
    stdout.write(SPACE+'-Phone : ');
    String phone =  stdin.readLineSync();


    //checking for available places
    if (list[tripId].availablePlaces == 0)
      {
        print(SPACE+'booking failed there is no available places in this trip');
        return;
      }

    // add the passenger to the list of passengers
    passengers.add(Passenger(
      id:passengers.length,
      name: name,
      phone: phone,
      tripId: tripId+1
    ));


    // add passenger id to the trip
    list[tripId].passengersCount++;
    list[tripId].availablePlaces--;

    print(SPACE+'trip has booked successfully');
  }
  void viewPassengers() {
    print('-'*50);
    passengers.forEach((passenger) {
      print(SPACE+'ID : ${passenger.id} \t Name : ${passenger.name}\t Phone : ${passenger.phone}\t tripId : ${passenger.tripId}');
      _tripTemplate(
          tripDate: list[passenger.tripId-1].tripDate,
          whereTo: list[passenger.tripId-1].whereTo,
          whereFrom: list[passenger.tripId-1].whereFrom,
          passengersLimit: list[passenger.tripId-1].passengersLimit,
          daysNumber: list[passenger.tripId-1].daysNumber,
          price: list[passenger.tripId-1].price,
          availablePlaces: list[passenger.tripId-1].availablePlaces,
          id: list[passenger.tripId-1].id,
          passengersCount: list[passenger.tripId-1].passengersCount,
          newPrice: list[passenger.tripId-1].newPrice

      );

    });
    print('-'*50);
  }
  void lastTrips() {

    var count = 0;

    for(var i = list.length-1; count != 10 && i >= 0;i--)
      {
        count++;

        _tripTemplate(
            tripDate: list[i].tripDate,
            whereTo: list[i].whereTo,
            whereFrom: list[i].whereFrom,
            passengersLimit: list[i].passengersLimit,
            daysNumber: list[i].daysNumber,
            price: list[i].price,
            availablePlaces: list[i].availablePlaces,
            id: list[i].id,
            passengersCount: list[i].passengersCount,
            newPrice:  list[i].newPrice
        );
      }

  }





}
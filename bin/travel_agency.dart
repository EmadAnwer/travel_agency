
import 'dart:io';

import 'TripList.dart';
final String SPACE = '\t'*5;
void main() {

   print('\x1B[2J\x1B[0;0H');
   start(TripList());




}


void start(TripList t)
{
  t.startValue();

  while(true)
    {
      print('\x1B[2J\x1B[0;0H');
      print(SPACE+'-'*20 + 'Travel Agency' + '-'*20+'\n\n');
      print(SPACE+'1-Add Trip' + '\t'*3+'5-Reserve');
      print(SPACE+'2-Edit Trip' + '\t'*3+'6-View Passengers');
      print(SPACE+'3-Delete Trip' + '\t'*3+'7-viewTrips');
      print(SPACE+'4-Search Trip'+ '\t'*3+'8-Last Trips\n');
      print(SPACE+'0-Exit\n');
      print(SPACE+'-'*54);
      stdout.write(SPACE+'Choose an option: ');
      var input = int.parse(stdin.readLineSync());




      switch(input){
        case 0:
          print(SPACE+'bye');
          return;
          break;
        case 1:
          t.addTrip();
          stdout.write(SPACE+'Do you want to add another trip ? (y) ');
          while(stdin.readLineSync() == 'y')
            {
              t.addTrip();
              stdout.write(SPACE+'Do you want to add another trip ? (y) ');
            }

          break;
        case 2:
          t.editTrip();
          stdout.write(SPACE+'Do you want to edit another trip ? (y) ');
          while(stdin.readLineSync() == 'y')
          {
            t.editTrip();
            stdout.write(SPACE+'Do you want to add another trip ? (y) ');
          }

          break;
        case 3:
          t.deleteTrip();
          stdout.write(SPACE+'Do you want to delete another trip ? (y) ');
          while(stdin.readLineSync() == 'y')
          {
            t.deleteTrip();
            stdout.write(SPACE+'Do you want to delete another trip ? (y) ');
          }
          break;
        case 4:
          t.searchTrip();
          stdout.write(SPACE+'Do you want to search another trip ? (y) ');
          while(stdin.readLineSync() == 'y')
          {
            t.searchTrip();
            stdout.write(SPACE+'Do you want to search another trip ? (y) ');
          }
          break;
        case 5:
          t.reserve();
          stdout.write(SPACE+'Do you want to delete another trip ? (y) ');
          while(stdin.readLineSync() == 'y')
          {
            t.reserve();
            stdout.write(SPACE+'Do you want to delete another trip ? (y) ');
          }
          break;
        case 6:
          t.viewPassengers();
          stdout.write(SPACE+'press any ENTER to back home');
          if (stdin.readLineSync() == '')
          {
            break;
          }
          break;
        case 7:
          t.viewTrips();
          stdout.write(SPACE+'press any ENTER to back home');
          if (stdin.readLineSync() == '')
          {
            break;
          }
          break;
        case 8:
          t.lastTrips();
          stdout.write(SPACE+'press any ENTER to back home');
          if (stdin.readLineSync() == '')
            {
              break;
            }
          break;

      }




  }









}



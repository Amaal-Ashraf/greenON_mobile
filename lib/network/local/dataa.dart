import '../../globalVariables.dart';

class SPone_data{
  late String power;
  late String temp;
  late String battery;

  SPone_data(this.power, this.temp, this.battery);

  SPone_data.fromJson(Map<String, dynamic> json){

    firstPower= json['power'];
    // firstPower= json['power'];
    // firstTemp= json['temp'];
    fBatteryLevel= json['battery'];
  }

}
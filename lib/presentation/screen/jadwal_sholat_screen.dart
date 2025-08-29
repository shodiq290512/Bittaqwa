import 'dart:convert';

import 'package:bittaqwa_1/presentation/widgets/time.dart';
import 'package:bittaqwa_1/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

class JadwalSholatScreen extends StatefulWidget {
  const JadwalSholatScreen({super.key});

  @override
  State<JadwalSholatScreen> createState() => _JadwalSholatScreenState();
}

class _JadwalSholatScreenState extends State<JadwalSholatScreen> {
  // variable untuk menyimpan data jadwal sholat
  List<dynamic>? _jadwalSholat;

  // variable untuk menyimpan data nama lokasi user
  String? _locationName;

  // variable untuk cek apakahdatanya berhasil di inisialisasi
  bool _isLoading = true;

  Future<List<dynamic>> fetchJadwalSholat(
    String city,
    String month,
    String year,
  ) async {
    final url = "https://raw.githubusercontent.com/lakuapik/jadwalsholatorg/master/adzan/$city/$year/$month.json";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200){
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load Jadwal Sholat');
    }
  }

  Future<void>fetchLocationAndJAdwalSholat()async{
    var status = await Permission .location.request();

    if (status.isGranted){
      try {
        Position position = await Geolocator.getCurrentPosition();
        List<Placemark> placemark = await placemarkFromCoordinates(position.latitude, position.longitude);
        Placemark place = placemark.first;

        String city = "bogor";
        String month = DateFormat("MM").format(DateTime.now());
        String year = DateFormat("yyyy").format(DateTime.now());

        List<dynamic> jadwalSholat = await fetchJadwalSholat(city, month, year);

        setState(() {
          _jadwalSholat = jadwalSholat;
          _locationName = "${place.administrativeArea}, ${place.locality}";
          _isLoading = false;
        });
      } catch (e) {
        setState(() {
          _isLoading = false;
        });
        print('Error fetching location or jadwal sholat: $e');
      }
    } else {
      print('Location permission not granted');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchLocationAndJAdwalSholat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.colorPrimary,
        title: Text(
          'Jadwal Sholat',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'PoppinsSemiBold',
          ),
        ),
        centerTitle: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: _isLoading
      ? Center(
        child: CircularProgressIndicator(),
      )
      : _jadwalSholat == null
      ? Center(
        child: CircularProgressIndicator(),
      )
      :
      Container(
        color: Colors.blue[50],
        child: Stack(
          children: [
            Image.asset('assets/images/bg_header_jadwal_sholat.png'),
            Column(
              children: [
                SizedBox(height: 41,),
                Text(
                  DateFormat(
                    'EEEE, d MMMM', 'id_ID'
                  ). format(DateTime.now()), 
                style: TextStyle(
                  fontFamily: 'PoppinsSemiBold',
                  fontSize: 25,
                  color: Colors.white,
                ),),
                SizedBox(height: 12,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on_sharp, color: Colors.red,),
                    Text(
                      _locationName ?? "",
                    style: TextStyle(
                      fontFamily: 'PoppinsMedium',
                      fontSize: 16,
                      color: Colors.white,
                    ),)
                  ],
                ),
                SizedBox(height: 74,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Time(pray: 'Subuh', time: _jadwalSholat![0]['shubuh'] ?? "-", image: 'assets/images/img_clock.png'),
                      SizedBox(height: 16,),
                      Container(
                        color: Color(0xffCBE5DD),
                        height: 2,
                      ),
                       SizedBox(height: 16,),
                      Time(pray: 'Dzuhur', time: _jadwalSholat![0]['dzuhur'] ?? "-", image: 'assets/images/img_clock.png'),
                      SizedBox(height: 16,),
                      Container(
                        color: Color(0xffCBE5DD),
                        height: 2,
                      ),
                       SizedBox(height: 16,),
                      Time(pray: 'Ashar', time: _jadwalSholat![0]['ashr'] ?? "-", image: 'assets/images/img_clock.png'),
                      SizedBox(height: 16,),
                      Container(
                        color: Color(0xffCBE5DD),
                        height: 2,
                      ),
                       SizedBox(height: 16,),
                      Time(pray: 'Maghrib', time: _jadwalSholat![0]['magrib'] ?? "-", image: 'assets/images/img_clock.png'),
                      SizedBox(height: 16,),
                      Container(
                        color: Color(0xffCBE5DD),
                        height: 2,
                      ),
                      SizedBox(height: 16,),
                      Time(pray: 'Isya', time: _jadwalSholat![0]['isya'] ?? "-", image: 'assets/images/img_clock.png'),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
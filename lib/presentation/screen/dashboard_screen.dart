import 'package:bittaqwa_1/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  String _location = "Mencari lokasi...";
  var time = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Cek apakah GPS aktif
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        _location = "GPS tidak aktif";
      });
      return;
    }

    // Cek izin lokasi
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          _location = "Izin lokasi ditolak";
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        _location = "Izin lokasi ditolak permanen";
      });
      return;
    }

    // Ambil posisi
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // Convert ke nama kota/kabupaten
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    if (placemarks.isNotEmpty) {
      final place = placemarks.first;
      setState(() {
        _location = "${place.subAdministrativeArea} ${place.administrativeArea}";
      });
    } else {
      setState(() {
        _location = "Lokasi tidak ditemukan";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        height: 250,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_header_dashboard_morning.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.all(12),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white,
                ),
                child: Text(
                  "Assalamu'alaikum akhi",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'PoppinsMedium',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              '${DateFormat('dd MMMM yyyy').format(time)}',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'PoppinsMedium'),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "${time.hour}:${time.minute}",
              style: TextStyle(
                  color: Colors.black, fontSize: 36, fontFamily: 'PoppinsBold'),
            ),
            SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on_rounded,
                  color: Colors.red,
                  size: 16,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  _location,
                  style: TextStyle(
                      color: Colors.black, fontFamily: 'PoppinsReguler'),
                ),
              ],
            )
          ],
        ),
      );
    }

    Widget cardMenus() {
      return Container(
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: ColorConstant.colorPrimary,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'doa');
                },
                child: Column(
                  children: [
                    Image.asset('assets/images/ic_menu_doa.png'),
                    Text(
                      "Doa - doa",
                      style: TextStyle(
                          fontFamily: 'PoppinsSemiBold', color: Colors.white),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 24,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'zakat');
                },
                child: Column(
                  children: [
                    Image.asset('assets/images/ic_menu_zakat.png'),
                    Text(
                      "Zakat",
                      style: TextStyle(
                          fontFamily: 'PoppinsSemiBold', color: Colors.white),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 24,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'dzikir1');
                },
                child: Column(
                  children: [
                    Image.asset('assets/images/ic_menu_dzikir.png'),
                    Text(
                      "Dzikir",
                      style: TextStyle(
                          fontFamily: 'PoppinsSemiBold', color: Colors.white),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 24,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'jadwal-sholat');
                },
                child: Column(
                  children: [
                    Image.asset('assets/images/ic_menu_jadwal_sholat.png'),
                    Text(
                      "Jadwal Sholat",
                      style: TextStyle(
                          fontFamily: 'PoppinsSemiBold', color: Colors.white),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 24,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'video-kajian');
                },
                child: Column(
                  children: [
                    Image.asset('assets/images/ic_menu_video_kajian.png'),
                    Text(
                      "Video Kajian",
                      style: TextStyle(
                          fontFamily: 'PoppinsSemiBold', color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget cardInspiration() {
      return Container(
        margin: EdgeInsets.all(16),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Inspirasi",
                style: TextStyle(
                  fontFamily: 'PoppinsSemiBold',
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Image.asset('assets/images/img_inspiration.png'),
            SizedBox(
              height: 8,
            ),
            Image.asset('assets/images/img_inspiration.png')
          ],
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [header(), cardMenus(), cardInspiration()],
        ),
      ),
    );
  }
}

// class DashboardScreen extends StatelessWidget {
//   const DashboardScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Widget header() {
//       return Container(
//         height: 250,
//         width: double.infinity,
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/images/bg_header_dashboard_morning.png'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Column(
//           children: [
//             Align(
//               alignment: Alignment.topLeft,
//               child: Container(
//                 margin: EdgeInsets.all(12),
//                 padding: EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(6),
//                   color: Colors.white,
//                 ),
//                 child: Text(
//                   "Assalamu'alaikum sodik",
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontFamily: 'PoppinsMedium',
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 18,
//             ),
//             Text(
//               "Dzuhur",
//               style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 16,
//                   fontFamily: 'PoppinsMedium'),
//             ),
//             SizedBox(
//               height: 4,
//             ),
//             Text(
//               "12.04",
//               style: TextStyle(
//                   color: Colors.black, fontSize: 36, fontFamily: 'PoppinsBold'),
//             ),
//             SizedBox(
//               height: 4,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(
//                   Icons.location_on_rounded,
//                   color: Colors.red,
//                   size: 16,
//                 ),
//                 SizedBox(
//                   width: 4,
//                 ),
//                 Text(
//                   "Kecamatan Jonggol",
//                   style: TextStyle(
//                       color: Colors.black, fontFamily: 'PoppinsReguler'),
//                 ),
//               ],
//             )
//           ],
//         ),
//       );
//     }

//     Widget cardMenus() {
//       return Container(
//         margin: EdgeInsets.all(16),
//         padding: EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(24),
//           color: ColorConstant.colorPrimary,
//         ),
//         child: SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   Navigator.pushNamed(context, 'doa');
//                 },
//                 child: Column(
//                   children: [
//                     Image.asset('assets/images/ic_menu_doa.png'),
//                     Text(
//                       "Doa - doa",
//                       style: TextStyle(
//                           fontFamily: 'PoppinsSemiBold', color: Colors.white),
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 width: 24,
//               ),
//               GestureDetector(
//                 onTap: () {
//                   Navigator.pushNamed(context, 'zakat');
//                 },
//                 child: Column(
//                   children: [
//                     Image.asset('assets/images/ic_menu_zakat.png'),
//                     Text(
//                       "Zakat",
//                       style: TextStyle(
//                           fontFamily: 'PoppinsSemiBold', color: Colors.white),
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 width: 24,
//               ),
//               GestureDetector(
//                 onTap: () {
//                   Navigator.pushNamed(context, 'dzikir1');
//                 },
//                 child: Column(
//                   children: [
//                     Image.asset('assets/images/ic_menu_dzikir.png'),
//                     Text(
//                       "Dzikir",
//                       style: TextStyle(
//                           fontFamily: 'PoppinsSemiBold', color: Colors.white),
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 width: 24,
//               ),
//               GestureDetector(
//                 onTap: () {
//                   Navigator.pushNamed(context, 'jadwal-sholat');
//                 },
//                 child: Column(
//                   children: [
//                     Image.asset('assets/images/ic_menu_jadwal_sholat.png'),
//                     Text(
//                       "Jadwal Sholat",
//                       style: TextStyle(
//                           fontFamily: 'PoppinsSemiBold', color: Colors.white),
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 width: 24,
//               ),
//               GestureDetector(
//                 onTap: () {
//                   Navigator.pushNamed(context, 'video-kajian');
//                 },
//                 child: Column(
//                   children: [
//                     Image.asset('assets/images/ic_menu_video_kajian.png'),
//                     Text(
//                       "Video Kajian",
//                       style: TextStyle(
//                           fontFamily: 'PoppinsSemiBold', color: Colors.white),
//                     )
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       );
//     }

//     Widget cardInspiration() {
//       return Container(
//         margin: EdgeInsets.all(16),
//         child: Column(
//           children: [
//             Align(
//               alignment: Alignment.topLeft,
//               child: Text(
//                 "Inspirasi",
//                 style: TextStyle(
//                   fontFamily: 'PoppinsSemiBold',
//                   fontSize: 20,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 8,
//             ),
//             Image.asset('assets/images/img_inspiration.png'),
//             SizedBox(
//               height: 8,
//             ),
//             Image.asset('assets/images/img_inspiration.png')
//           ],
//         ),
//       );
//     }

//     return Scaffold(
//       body: SafeArea(
//         child: ListView(
//           children: [header(), cardMenus(), cardInspiration()],
//         ),
//       ),
//     );
//   }
// }

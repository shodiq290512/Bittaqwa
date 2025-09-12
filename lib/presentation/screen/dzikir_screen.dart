import 'package:bittaqwa_1/presentation/screen/dzikir_bada_sholat_screen.dart';
import 'package:bittaqwa_1/presentation/screen/dzikir_pagi_screen.dart';
import 'package:bittaqwa_1/presentation/screen/dzikir_petang_screen.dart';
import 'package:bittaqwa_1/presentation/widgets/card_dzikir.dart';
import 'package:bittaqwa_1/utils/color_constant.dart';
import 'package:flutter/material.dart';

class DzikirScreen extends StatelessWidget {
  const DzikirScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.colorPrimary,
        title: Text(
          'Dzikir',
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
      body: Column(
        children: [
          Image.asset(
            'assets/images/bg_header_doa.png',
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(35),
              child: GridView.extent(
                maxCrossAxisExtent: 250,
                mainAxisSpacing: 40,
                crossAxisSpacing: 40,
                children: [
                  CardDzikir(
                    image: 'assets/images/ic_menu_jadwal_sholat.png',
                    title: "Ba'da Sholat",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DzikirBadaSholatScreen(),
                        ),
                      );
                    },
                  ),
                  CardDzikir(
                    image: 'assets/images/ic_doa_pagi_malam.png',
                    title: "Dzikir Pagi",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DzikirPagiScreen(),
                        ),
                      );
                    },
                  ),
                  CardDzikir(
                    image: 'assets/images/nature.png',
                    title: "Dzikir Petang",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DzikirPetangScreen(),
                        ),
                      );
                    },
                  ),
                  
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:bittaqwa_1/utils/color_constant.dart';
import 'package:flutter/material.dart';

class DzikirBadaSholatScreen extends StatelessWidget {
  const DzikirBadaSholatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.colorPrimary,
        title: Text(
          "Dzikir Ba'da Sholat",
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              Text(
                'Membaca Istighfar',
                style: TextStyle(fontFamily: 'PoppinsSemiBold', fontSize: 18),
              ),
              Container(
                alignment: Alignment.center,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: ColorConstant.colorPrimary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    "3x",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Text(
                "أستغفر الله",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              const Text(
                "Astaghfirullah",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const Text(
                "Aku memohon ampun kepada Allah.",
                style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 25),
              Text(
                'Membaca Pujian',
                style: TextStyle(fontFamily: 'PoppinsSemiBold', fontSize: 18),
              ),
              const SizedBox(height: 8),
              const Text(
                "اَللَّهُمَّ أَنْتَ السَّلاَمُ، وَمِنْكَ السَّلاَمُ، تَبَارَكْتَ يَا ذَا الْجَلاَلِ وَاْلإِكْرَامِ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              const Text(
                "Allahumma antas salaam wa minkas salaam tabaarokta yaa dzal jalaali wal ikrom",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              const Text(
                "Ya Allah, Engkau pemberi keselamatan, dan dariMu keselamatan, Maha Suci Engkau, wahai Tuhan Yang Pemilik Keagungan dan Kemuliaan.",
                style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                textAlign: TextAlign.justify,
                
              ),
              const SizedBox(height: 25),
              Text(
                'Membaca Tahlil 1',
                style: TextStyle(fontFamily: 'PoppinsSemiBold', fontSize: 18),
              ),
              const SizedBox(height: 8),
              const Text(
                "لاَ إِلَـهَ إِلاَّ اللهُ وَحْدَهُ لاَ شَرِيْكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيْرُ، اَللَّهُمَّ لاَ مَانِعَ لِمَا أَعْطَيْتَ، وَلاَ مُعْطِيَ لِمَا مَنَعْتَ، وَلاَ يَنْفَعُ ذَا الْجَدِّ مِنْكَ الْجَدُّ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              const Text(
                "Laa ilaha illallah wahdahu laa syarika lah, lahul mulku wa lahul hamdu wa huwa ‘ala kulli syai-in qodiir. Allahumma laa maani’a limaa a’thoyta wa laa mu’thiya limaa mana’ta wa laa yanfa’u dzal jaddi minkal jaddu.",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              const Text(
                "Tiada Rabb yang berhak disembah selain Allah Yang Maha Esa, tidak ada sekutu bagi-Nya. Bagi-Nya puji dan bagi-Nya kerajaan. Dia Maha Kuasa atas segala sesuatu. Ya Allah, tidak ada yang mencegah apa yang Engkau berikan dan tidak ada yang memberi apa yang Engkau cegah. Tidak berguna kekayaan dan kemuliaan itu bagi pemiliknya (selain iman dan amal shalihnya yang menyelamatkan dari siksaan). Hanya dari-Mu kekayaan dan kemuliaan.",
                style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 25),
              Text(
                'Membaca Tahlil 2',
                style: TextStyle(fontFamily: 'PoppinsSemiBold', fontSize: 18),
              ),
              const SizedBox(height: 8),
              const Text(
                "لاَ إِلَـهَ إِلاَّ اللهُ وَحْدَهُ لاَ شَرِيْكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيْرُ. لاَ حَوْلَ وَلاَ قُوَّةَ إِلاَّ بِاللهِ، لاَ إِلَـهَ إِلاَّ اللهُ، وَلاَ نَعْبُدُ إِلاَّ إِيَّاهُ، لَهُ النِّعْمَةُ وَلَهُ الْفَضْلُ وَلَهُ الثَّنَاءُ الْحَسَنُ، لاَ إِلَـهَ إِلاَّ اللهُ مُخْلِصِيْنَ لَهُ الدِّيْنَ وَلَوْ كَرِهَ الْكَافِرُوْن",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              const Text(
                "Laa ilaha illallah wahdahu laa syarika lah. Lahul mulku wa lahul hamdu wa huwa ‘ala kulli syai-in qodiir. Laa hawla wa laa quwwata illa billah. Laa ilaha illallah wa laa na’budu illa iyyaah. Lahun ni’mah wa lahul fadhlu wa lahuts tsanaaul hasan.",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              const Text(
                "Tiada Rabb (yang berhak disembah) kecuali Allah, Yang Maha Esa, tidak ada sekutu bagi-Nya. Bagi-Nya kerajaan dan pujaan. Dia Mahakuasa atas segala sesuatu. Tidak ada daya dan kekuatan kecuali (dengan pertolongan) Allah. Tiada Rabb (yang hak disembah) kecuali Allah. Kami tidak menyembah kecuali kepada-Nya. Bagi-Nya nikmat, anugerah dan pujaan yang baik. Tiada Rabb (yang hak disembah) kecuali Allah, dengan memurnikan ibadah kepadaNya, sekalipun orang-orang kafir sama benci.",
                style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 25),
              Text(
                'Membaca Tasbih',
                style: TextStyle(fontFamily: 'PoppinsSemiBold', fontSize: 18),
              ),
              Container(
                alignment: Alignment.center,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: ColorConstant.colorPrimary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    "33x",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Text(
                "سُبْحَانَ اللهِ",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              const Text(
                "Subhanallah",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const Text(
                "Maha Suci Allah",
                style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 25),
              Text(
                'Membaca Tahmid',
                style: TextStyle(fontFamily: 'PoppinsSemiBold', fontSize: 18),
              ),
              Container(
                alignment: Alignment.center,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: ColorConstant.colorPrimary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    "33x",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Text(
                "اَلْحَمْدُ لِلَّهِ",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              const Text(
                "Alhamdulillah",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const Text(
                "Segala puji bagi Allah",
                style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 25),
              Text(
                'Membaca Takbir',
                style: TextStyle(fontFamily: 'PoppinsSemiBold', fontSize: 18),
              ),
              Container(
                alignment: Alignment.center,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: ColorConstant.colorPrimary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    "33x",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Text(
                "اَللهُ أَكْبَرُ",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              const Text(
                "Allahu akbar",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const Text(
                "Allah maha besar",
                style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 25),
              Text(
                'Membaca Tahlil 3',
                style: TextStyle(fontFamily: 'PoppinsSemiBold', fontSize: 18),
              ),
              const SizedBox(height: 8),
              const Text(
                "لاَ إِلَـهَ إِلاَّ اللهُ وَحْدَهُ لاَ شَرِيْكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيْرُ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              const Text(
                "Laa ilaha illallah wahdahu laa syarika lah. Lahul mulku wa lahul hamdu wa huwa ‘ala kulli syai-in qodiir",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              const Text(
                "Tidak ada Rabb (yang berhak disembah) kecuali Allah Yang Maha Esa, tidak ada sekutu bagi-Nya. Bagi-Nya kerajaan. Bagi-Nya pujaan. Dia-lah Yang Mahakuasa atas segala sesuatu",
                style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 25),
              Text(
                'Membaca Ayat Qursi',
                style: TextStyle(fontFamily: 'PoppinsSemiBold', fontSize: 18),
              ),
              const SizedBox(height: 10),
              Text(
                'Membaca Surat Al Ikhlas',
                style: TextStyle(fontFamily: 'PoppinsSemiBold', fontSize: 18),
              ),
              const SizedBox(height: 10),
              Text(
                'Membaca Surat Al Falaq',
                style: TextStyle(fontFamily: 'PoppinsSemiBold', fontSize: 18),
              ),
              const SizedBox(height: 10),
              Text(
                'Membaca Surat An Naas',
                style: TextStyle(fontFamily: 'PoppinsSemiBold', fontSize: 18),
              ),
              const SizedBox(height: 25),
              Text(
                'Membaca Doa ini setiap selesai sholat subuh',
                style: TextStyle(fontFamily: 'PoppinsSemiBold', fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                "اَللَّهُمَّ إِنِّيْ أَسْأَلُكَ عِلْمًا نَافِعًا، وَرِزْقًا طَيِّبًا، وَعَمَلاً مُتَقَبَّلاً",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              const Text(
                "Allahumma inni as-aluka ‘ilman naafi’a, wa rizqon thoyyiba, wa ‘amalan mutaqobbala",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              const Text(
                "Ya Allah, sungguh aku memohon kepada-Mu ilmu yang bermanfaat (bagi diriku dan orang lain), rizki yang halal dan amal yang diterima (di sisi-Mu dan mendapatkan ganjaran yang baik).",
                style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

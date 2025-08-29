import 'package:bittaqwa_1/presentation/widgets/card_result_harta.dart';
import 'package:bittaqwa_1/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:intl/intl.dart';

class ZakatScreen extends StatefulWidget {
  const ZakatScreen({super.key});

  @override
  State<ZakatScreen> createState() => _ZakatScreenState();
}
class _ZakatScreenState extends State<ZakatScreen> {

  final MoneyMaskedTextController controller = MoneyMaskedTextController(
      thousandSeparator: '.',
      precision: 0,
      decimalSeparator: '',
    );

    double totalHarta = 0;
    double zakatDikeluarkan = 0;
    final double minimumHarta = 85000000;

    String formattedTotalHarta = '';
    String formattedZakatDikeluarkan = '';

    void hitungZakat() {
      String cleanValue = controller.text.replaceAll('.', '');
      double inputValue = double.tryParse(cleanValue) ?? 0;

      if (inputValue >= minimumHarta) {
        setState(() {
          totalHarta = inputValue;
          zakatDikeluarkan = (inputValue * 2.5) / 100;
        });

        formattedTotalHarta =
            NumberFormat.currency(locale: 'id_ID', symbol: '')
                .format(totalHarta);
        formattedZakatDikeluarkan =
            NumberFormat.currency(locale: 'id_ID', symbol: '')
                .format(zakatDikeluarkan);
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Peringatan'),
            content: Text('Total harta belum mencapai Hisab (85gr)'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Ok'),
              ),
            ],
          ),
        );
      }
    }

  @override
  Widget build(BuildContext context) {
    Widget cardHarta() {
      return Container(
        margin: EdgeInsets.all(24),
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[200],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Total Harta",
              style: TextStyle(
                  color: ColorConstant.colorPrimary,
                  fontSize: 14,
                  fontFamily: 'PoppinsMedium'),
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukan Total Harta',
                labelStyle: TextStyle(
                  color: ColorConstant.colorText,
                  fontSize: 14,
                ),
                fillColor: Colors.white,
                filled: true,
                prefixText: 'Rp. ',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: ColorConstant.colorPrimary,
                      width: 2.0,
                    )),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: ColorConstant.colorPrimary,
                    width: 2.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: () {
                  hitungZakat();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConstant.colorPrimary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(12)),
                  padding: EdgeInsets.all(12),
                  minimumSize: Size(double.infinity, 0),
                ),
                child: Text(
                  "OK",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      );
    }

    Widget cardResult(
      String formattedTotalHarta, String formattedZakatDikeluarkan) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CardResultHarta(
            title: 'Total Uang',
            result: 'Rp. $formattedTotalHarta',
            color: Colors.red[300]!,
          ),
          SizedBox(
            height: 24,
          ),
          CardResultHarta(
            title: 'Zakat Dikeluarkan',
            result: 'Rp. $formattedZakatDikeluarkan',
            color: Colors.purple[300]!,
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.colorPrimary,
        title: Text(
          'Zakat',
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
      body: ListView(
        children: [
          Image.asset('assets/images/bg_header_zakat.png'),
          cardHarta(),
          cardResult(formattedTotalHarta, formattedZakatDikeluarkan)
        ],
      ),
    );
  }
}

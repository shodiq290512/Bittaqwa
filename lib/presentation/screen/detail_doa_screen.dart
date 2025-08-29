import 'package:bittaqwa_1/utils/color_constant.dart';
import 'package:flutter/material.dart';

class DetailDoaScreen extends StatelessWidget {
  final String title;
  final String arabicText;
  final String translation;
  final String reference;
  const DetailDoaScreen({
    required this.title,
    required this.arabicText,
    required this.translation,
    required this.reference,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.colorPrimary,
        title: Text(title,
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'PoppinsSemiBold',
        ),), centerTitle: false,
        leading: IconButton(icon:  Icon(Icons.arrow_back_ios_new_outlined,
        color: Colors.white,
        ), onPressed: () { 
          Navigator.pop(context);
         },),
      ),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        decoration: BoxDecoration(
          image : DecorationImage(
            image: AssetImage('assets/images/bg_detail_doa.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Container(
                
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const[
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 2,
                      blurRadius: 5,
                    )
                  ],
                ),
                padding: EdgeInsets.all(24),
                child: Column(
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        color: ColorConstant.colorText,
                        fontFamily: 'PoppinsBold'
                      ),
                    ),
                    SizedBox(height: 16,),
                    Text(
                      arabicText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        color: ColorConstant.colorText,
                        fontFamily: 'PoppinsRegular'
                      ),
                    ),
                    SizedBox(height: 16,),
                    Text(
                      translation,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'PoppinsRegular'
                      ),
                    ),
                    SizedBox(height: 16,),Text(
                      reference,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: ColorConstant.colorText,
                        fontFamily: 'PoppinsRegular'
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      )
    );
  }
}
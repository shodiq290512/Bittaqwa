import 'package:bittaqwa_1/data/doa_data.dart';
import 'package:bittaqwa_1/presentation/screen/detail_doa_screen.dart';
import 'package:bittaqwa_1/utils/color_constant.dart';
import 'package:flutter/material.dart';

class DoaListScreen extends StatelessWidget {
  final String category;
  const DoaListScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {

    final List<Map<String, String>> doaList = getDoaList(category);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.colorPrimary,
        title: Text('List Doa',
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
      body: ListView.builder(
        itemCount: doaList.length,
        itemBuilder: (context,index){
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: ColorConstant.colorWhite,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[200]!,
                    blurRadius: 3,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: ListTile(
                leading: Image.asset(doaList[index]['image']!),
                title: Text(
                  doaList[index]['title']!,
                  style: TextStyle(fontFamily: 'PoppinsMedium'),
                ),
                onTap: (){
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => DetailDoaScreen(
                        title: doaList[index]['title']!, 
                        arabicText: doaList[index]['arabicText']!, 
                        translation: doaList[index]['translation']!, 
                        reference: doaList[index]['reference']!,
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        }),
    );
  }
}
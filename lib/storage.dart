import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
class Storage extends StatefulWidget {
  @override
  _StorageState createState() => _StorageState();
}

class _StorageState extends State<Storage> {
  String data;
  String name='Qodirov Azizbek Usmonqul o`g`li';
   Widget card(Color colors,String name,){
   return Padding(
     padding: const EdgeInsets.symmetric(vertical: 10.0),
     child: Center(
       child: Container(
         width: 300.0,
         height: 200.0,
         decoration: BoxDecoration(
           gradient:LinearGradient(
             begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.blue[800],
                Colors.blue[600],
                Colors.blueAccent,
              ],
           ) ,
           borderRadius: BorderRadius.circular(30.0),
           
           boxShadow: [BoxShadow(
             offset:const Offset(0,5),
             blurRadius: 9.0,
             spreadRadius: 0.0,
             color: colors,
           )]
         ),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             SizedBox(height: 10.0,),
             Text('O`ZBEKISTON MILLIY BANKI',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),),
             Container(
               width: 60.0,
               height: 80.0,
               decoration:BoxDecoration(
                 image: DecorationImage(
                   image:NetworkImage('https://logobank.uz:8005/media/logos_png/NBU-01.png'),
                   fit:BoxFit.cover, 
                    ),
                    borderRadius: BorderRadius.circular(30.0),
               ),
               
             ),

             Padding(
               padding: const EdgeInsets.only(left: 15.0,bottom: 10.0),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                     Text('8600 0125 1204 0449',style: TextStyle(fontWeight: FontWeight.bold),),
                      Padding(
                        padding: const EdgeInsets.only(left: 50.0),
                        child: Text('01/25'),
                      ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text('$name', style:const  TextStyle(color:Colors.black,fontSize: 12.0,fontWeight: FontWeight.bold),)
               ),],),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Container(
                   height: 60.0,
                   width: 50.0,
                   decoration:BoxDecoration(
                     color: Colors.white,
                     image: DecorationImage(
                       image:NetworkImage('https://logobank.uz:8005/media/logos_png/Uzcard-01.png'),
                       fit:BoxFit.cover, 
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                   ),
                 ),
               )
                 ],
               ),
             )
           ],
         ),
       ),
     ),
   );
 }
 Future<String> get _localPath async{
   final directory=await getApplicationDocumentsDirectory();
   print(directory.path);
   return directory.path;
 } 
 Future<File> get _localFile async{
   final path=await _localPath;
   return File('$path/counter.txt');
 }
Future<String> readContent()async{
  try{
    final file= await _localFile;
    String  contents = await file.readAsString();
    return contents;
  }catch(e){
    return 'Error !';
  }
}
 Future<File> writeContent() async{
   final file=await _localFile;
   return file.writeAsString(name);
 }
  
@override
  void initState() {
    super.initState();
    writeContent();
    readContent().then(( value){
      setState(() {
        data=value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        crossAxisAlignment:CrossAxisAlignment.center,
        children: [
          card(Colors.blueAccent, data),
        ],
      ),
    );
  }
}
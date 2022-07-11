import 'package:flutter/material.dart';
import 'package:flutter_application_1/Home.dart';
import 'package:flutter_application_1/style.dart' as style;
import 'package:http/http.dart'as http;
import 'dart:convert';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp (
    MaterialApp(
      theme: style.theme,
    home: MyApp(),
  )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var tab = 0;
  var data = [];
  var userImage;
  getData()async{
    var result = await http.get(Uri.parse('https://codingapple1.github.io/app/data.json'));
    var result2 = jsonDecode(result.body);
    setState(() {
      data = result2;
    });
  }
  @override
  void initState() {
    super.initState();
    getData();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (i){
          setState(() {
            tab = i;
            
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined),label: '샵'),

      ],),
      appBar: AppBar(
        title: Text('Instagram'),
        actions: [
          IconButton(
            icon:Icon(Icons.add_box_outlined),
            onPressed: ()async{
              var picker = ImagePicker();
              var image = await picker.pickImage(source: ImageSource.gallery);
              if(image !=null){setState(() {
                userImage = File(image.path);
              });}
              Image.file(userImage);
              Navigator.push(context, 
              MaterialPageRoute(builder: (context)=>Upload(userImage : userImage
              )));
            },
            iconSize: 30,)],
      ),
      body: [Home(data : data),Text('샵')][tab],
    );
  }
}

class Upload extends StatelessWidget {
  const Upload({Key? key, this.userImage}) : super(key: key);
  @override
  final userImage;
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body:  ListView(
          children: [Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.file(userImage),
              Text('이미지업로드화면'),
              TextField(),
              IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close)
              ),
            ],
          )],
        )
    );

  }
} 
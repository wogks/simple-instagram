import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({Key? key, this.data}) : super(key: key);
  final data;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  

  var scroll = ScrollController();
  getMore() async {
    var result = await http.get(Uri.parse('https://codingapple1.github.io/app/more1.json'));
    var result2 = jsonDecode(result.body);
    
    
  }
  @override
  void initState() {
    super.initState();
    scroll.addListener(() { 
      if (scroll.position.pixels == scroll.position.maxScrollExtent){
        getMore();
        }
    });
  }


  @override
  Widget build(BuildContext context) {
    if(widget.data.isNotEmpty){
       return ListView.builder(itemCount: 3,controller: scroll,itemBuilder: (c,i){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(widget.data[i]['image']),
          Text('좋아요 ${widget.data[i]['likes']}'),
          Text(widget.data[i]['date']),
          Text(widget.data[i]['content']),
        ],
      );
    });
    }else{
      return Text('로딩중임');
    }
   
  }
}
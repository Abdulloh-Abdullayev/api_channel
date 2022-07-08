import 'package:api_channel/models/news_model.dart';
import 'package:api_channel/services/news_service.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("API Channel",style: TextStyle(fontSize: 32,color: Colors.black),),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        child: FutureBuilder(
          future: NewsService.getNews(),
          builder: (context, AsyncSnapshot<NewsModel> snap) {
            if(!snap.hasData){
              return ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index){
                  return Shimmer.fromColors(
                    highlightColor: Colors.grey,
                    baseColor: Colors.white,
                    child: Card(
                      elevation: 5,
                      child: ListTile(
                        title: Text(""),
                      ),
                    ),
                  );
                },
              );
            }else if(snap.hasError){
              return Text("NO DATA");
            }else{
              NewsModel data = snap.data!;
              return ListView.builder(
                itemCount: data.articles!.length,
                itemBuilder: (context, index){
                  return Card(
                    elevation: 5,
                    child: ListTile(
                      title: Text("${data.articles![index].author}"),
                    ),
                  );
                },
              );
            }
          },

        )
      ),
    );
  }
}

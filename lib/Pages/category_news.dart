import 'package:flutter/material.dart';
import 'package:news_app/widgets/news.dart';
import 'package:news_app/widgets/widgets.dart';

class CategoryNews extends StatefulWidget {
  final String? newsCategory;
  const CategoryNews({super.key, this.newsCategory});

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {

  var newslist;
  bool loading = true;

  @override
  void initState() {
    getNews();
    super.initState();
  }

  void getNews() async {
    NewsForCategorie news = NewsForCategorie();
    await news.getNewsForCategory(widget.newsCategory!);
    newslist = news.news;

    setState(() {
      loading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: loading ?
      Center(
        child: CircularProgressIndicator(),
      )
      : SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 16),
          child: ListView.builder(
            itemCount: newslist.length,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              return NewsTile(
                imgUrl: newslist[index].urlToImage ?? "",
                title: newslist[index].title ?? "",
                desc: newslist[index].description ?? "",
                content: newslist[index].content ?? "",
                postUrl: newslist[index].articleUrl ?? "",
              );
            },
          ),
        ),
      )
    );
  }
}
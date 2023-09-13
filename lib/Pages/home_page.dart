import 'package:flutter/material.dart';
import 'package:news_app/Models/categories_modal.dart';
import 'package:news_app/widgets/category_card.dart';
import 'package:news_app/widgets/data.dart';
import 'package:news_app/widgets/news.dart';
import 'package:news_app/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool? loading;
  var newslist;

  List<CategorieModel> categories = [];

  void getNews() async {
    News news = News();
    await news.getNews();
    newslist = news.news;

    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    loading = true;

    categories = getCategories();

    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SafeArea(
        child: loading! 
        ?const Center(
          child: CircularProgressIndicator(),
        )
       : SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                padding:const EdgeInsets.symmetric(horizontal: 16),
                height: 70,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoryCard(
                      imageAssetUrl: categories[index].imageAssetUrl,
                      categoriesName: categories[index].categorieName,
                    );
                  },
                ),
              ),
            //  News Article
              Container(
                margin: const EdgeInsets.only(top: 16),
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
            ],
          ),
        ),
       )
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:news_app/Pages/article.dart';


AppBar MyAppBar() {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "News",
          style: TextStyle(
            color: Colors.black87, fontWeight: FontWeight.w700,
          ),
        ),

        Text(
          "App",
          style: TextStyle(
            color: Colors.blue, fontWeight: FontWeight.w700,
          ),
        ),
      ],
    ),
    backgroundColor: Colors.transparent,
    elevation: 0.0,
  );
}

class NewsTile extends StatelessWidget {

  final String? imgUrl, title, desc, content, postUrl;
  const NewsTile({super.key,  this.imgUrl,  this.title,  this.desc,  this.content, required this.postUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context, MaterialPageRoute(builder: (context) => ArticleView(
          postUrl: postUrl!,
        )));
      },

      child: Container(
        margin: EdgeInsets.only(bottom: 24),
        width: MediaQuery.of(context).size.width,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(6), bottomLeft: Radius.circular(6)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  imgUrl!,
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                title!,
                maxLines: 2,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                desc!,
                maxLines: 2,
                style: TextStyle(
                  color: Colors.black87, fontSize: 14
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutternewsapp/helper/data.dart';
import 'package:flutternewsapp/helper/news.dart';
import 'package:flutternewsapp/model/article_model.dart';
import 'package:flutternewsapp/model/category_model.dart';
import 'package:flutternewsapp/views/article_view.dart';
import 'package:flutternewsapp/views/category_news.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CategoryModel> categories = new List<CategoryModel>();
  List<ArticleModel> articles = new List<ArticleModel>();

  bool _loading = true;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async{
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("News"),
            Text("App", style: TextStyle( color: Colors.blue),)
          ],
        ),
        elevation: 0.0,
      ),
      body: _loading ?  Center(
        child:Container(
          child: SpinKitFadingCube(
            color: Colors.blue,
            size: 120.0,
          ),
        ),
        ) : SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: <Widget>[

                /// Categories
                Container(
                  height: 70,
                  child: ListView.builder(
                      itemCount: categories.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index){
                        return CategoryTile(
                          imageUrl: categories[index].imageUrl,
                          categoryName: categories[index].categoryName,

                        );
                      }),
                ),

                /// Blogs
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child:  ListView.builder(
                    itemCount: articles.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                      return BlogTile(
                        imageUrl: articles[index].urlToImage,
                        title: articles[index].title,
                        desc: articles[index].description,
                        url: articles[index].url,
                      );
                      }),
                )

              ],
            ),
          ),
        ),
      );

  }
}

class CategoryTile extends StatelessWidget {

  final String imageUrl, categoryName;
  CategoryTile({ this.imageUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) =>CategoryNews(
            category: categoryName.toLowerCase(),
          )
        ));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Stack(
          children: [
          ClipRRect(
        borderRadius: BorderRadius.circular(6),
            child: CachedNetworkImage(
              imageUrl: imageUrl, width: 120, height: 60,fit: BoxFit.fill,),
      ),
                Container(
                  alignment: Alignment.center,
                  width: 120, height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.black26
                  ),
                  child: Text(categoryName, style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500
                  ),),
                ),
          ],
  ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {

  final String imageUrl, title, desc, url;
  BlogTile({@required this.imageUrl,@required this.title,@required this.desc,@required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => ArticleView(
            blogUrl: url,
          )
        ));
      },
      child: Container(
        child: Column(
          children: <Widget>[

            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(imageUrl)
            ),
            SizedBox(height: 8,),
            Text(title, style: TextStyle(
              fontSize: 18,
              color: Colors.black87,
              fontWeight: FontWeight.w500
            )
            ),
            SizedBox(height: 8,),
            Text(desc, style: TextStyle(
              color: Colors.black54
            ),),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}

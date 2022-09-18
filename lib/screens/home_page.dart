import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reddit_bloc/model/reddit_model.dart';
import 'package:flutter_reddit_bloc/screens/search_page.dart';

import '../bloc/reddit_bloc.dart';
import 'details_page.dart';

// ignore: must_be_immutable
class ShowPost extends StatefulWidget {
  List<ChildData> post;
  final elemanSayisi;

  ShowPost(this.post, this.elemanSayisi);

  @override
  State<ShowPost> createState() => _ShowPostState();
}

class _ShowPostState extends State<ShowPost> {
  @override
  Widget build(BuildContext context) {
    final userRepo = BlocProvider.of<RedditBloc>(context);
    final ScrollController _scrollController = ScrollController();
    return RefreshIndicator(
      onRefresh: _refreshIndicator,
      child: FutureBuilder<List<ChildData>>(
          future: userRepo.redditRepo.getReddit(widget.elemanSayisi),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              return Column(
                children: [
                  const Text(
                    "Gönderi Listesi",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: GridView.builder(
                        itemCount: snapshot.data!.length,
                        shrinkWrap: true,
                        controller: _scrollController,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          var redditPost = snapshot.data?[index];
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => RedditDetails(
                                        post: widget.post,
                                        index: index,
                                      )));
                            },
                            child: Hero(
                              tag: redditPost?.id! ?? "null",
                              child: Card(
                                child: Column(
                                  children: <Widget>[
                                    Expanded(
                                      child: FadeInImage.assetNetwork(
                                        placeholder: "assets/loading.gif",
                                        image: redditPost?.thumbnail! ?? "",
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    Text(
                                      "Gönderi Sahibi : ${redditPost?.author_fullname}",
                                      style:
                                          TextStyle(color: Colors.red.shade400),
                                    ),
                                    const Text("Detaylar için dokun"),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.88,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<RedditBloc>(context)
                                  .add(ResetReddit());
                            },
                            child: const Text(
                              "Tekrar Gönderi Listele",
                              style: TextStyle(color: Colors.black, fontSize: 16),
                            ),
                            style: TextButton.styleFrom(primary: Colors.red),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  )
                ],
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Column(
                  children: const <Widget>[
                    CircularProgressIndicator(
                      backgroundColor: Color(0xff003140),
                    ),
                  ],
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: Color(0xff003140),
              ),
            );
          }),
    );
  }

  Future<void> _refreshIndicator() async {
    setState(() {

    });
  }
}

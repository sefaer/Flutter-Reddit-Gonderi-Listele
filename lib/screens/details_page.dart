import 'package:flutter/material.dart';

import '../model/reddit_model.dart';
import 'package:flutter/src/widgets/image.dart' as ImageFlutter;

// ignore: must_be_immutable
class RedditDetails extends StatefulWidget {
  List<ChildData> post;
  int index;

  RedditDetails({Key? key, required this.post, required this.index})
      : super(key: key);

  @override
  _RedditDetailsState createState() => _RedditDetailsState();
}

class _RedditDetailsState extends State<RedditDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade300,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red.shade400,
        title: Text(widget.post[widget.index].title!),
      ),
      body: UserDetailBody(context),
    );
  }

  Widget UserDetailBody(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          height: MediaQuery.of(context).size.height * (7 / 10),
          width: MediaQuery.of(context).size.width - 18,
          left: 10,
          top: MediaQuery.of(context).size.height * 0.1,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            elevation: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text("Yazar: "+
                        widget.post[widget.index].author!,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.description,
                        size: 30,
                      ),
                      Flexible(
                        child: Text(
                          widget.post[widget.index].title!,
                          style:
                              const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(45.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.person,
                            size: 40,
                          ),
                          Text(
                            widget.post[widget.index].author_fullname!,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.comment,
                            size: 40,
                          ),
                          Text(
                            widget.post[widget.index].num_comments!.toString(),
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.score,
                            size: 40,
                          ),
                          Text(
                            widget.post[widget.index].score!.toString(),
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.reddit_outlined,
                            size: 40,
                          ),
                          Text(
                            widget.post[widget.index].subreddit_name_prefixed.toString(),
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                ),

/*                  Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: widget.pokemon.type
                          .map((tip) => Chip(
                          backgroundColor: Colors.deepOrange.shade300,
                          label: Text(
                            tip,
                            style: TextStyle(color: Colors.white),
                          )))
                          .toList()),
                ),
                Text(
                  "Pre Evolution : ",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
*/
                /*      Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: widget.pokemon.prevEvolution != null
                          ? widget.pokemon.prevEvolution
                          .map((preevolution) => Chip(
                          backgroundColor: Colors.deepOrange.shade300,
                          label: Text(
                            preevolution.name,
                            style: TextStyle(color: Colors.white),
                          )))
                          .toList()
                          : [Text([widget.index evolution")]),
                ),
                Text(
                  "Next Evolution : ",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),*/
                /*     Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: widget.pokemon.nextEvolution != null
                          ? widget.pokemon.nextEvolution
                          .map((evolution) => Chip(
                          backgroundColor: Colors.deepOrange.shade300,
                          label: Text(
                            evolution.name,
                            style: TextStyle(color: Colors.white),
                          )))
                          .toList()
                          : [Text("End evolution")]),
                ),
                Text(
                  "Weakness : ",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),*/
                /*Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: widget.pokemon.weaknesses != null
                          ? widget.pokemon.weaknesses
                          .map((weakness) => Chip(
                          backgroundColor: Colors.deepOrange.shade300,
                          label: Text(
                            weakness,
                            style: TextStyle(color: Colors.white,fontSize: 12),
                          )))
                          .toList()
                          : [Text("No weakness")]),
                ),*/
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Hero(
            tag: widget.post[widget.index].title!,
            child: Container(
              width: 150,
              height: 150,
              child: ImageFlutter.Image.network(
                widget.post[widget.index].thumbnail!,
                fit: BoxFit.contain,
              ),
            ),
          ),
        )
      ],
    );
  }
}

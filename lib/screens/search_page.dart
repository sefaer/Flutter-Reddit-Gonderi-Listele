import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reddit_bloc/bloc/reddit_bloc.dart';
import 'package:flutter_reddit_bloc/screens/home_page.dart';

class SearchPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<RedditBloc>(context);
    final _formKey = GlobalKey<FormState>();
    TextEditingController _userController = TextEditingController();

    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: SizedBox(
                  height: 180,
                  width: 300,
                  child: Icon(Icons.reddit,size:200),
                ),
              )),
          BlocBuilder<RedditBloc, RedditState>(
            builder: (context, state) {
              if (state is RedditIsNotSearched) {
                return Container(
                  padding: const EdgeInsets.only(
                    left: 32,
                    right: 32,
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 70,),
                      const Text(
                        "Reddit Post",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                            color: Colors.white70),
                      ),
                      const Text(
                        "Listele",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w200,
                            color: Colors.white70),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Form(
                        key: _formKey,
                        child: TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(4),
                          ],
                          validator: (value) {
                            if (value!.isEmpty ||
                                value == "0" ||
                                value == "00" ||
                                value == "1" ||
                                int.parse(value!) > 500) {
                              return "Lütfen 1 ile 500 arası adet giriniz..";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          controller: _userController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.white70,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                    color: Colors.white70,
                                    style: BorderStyle.solid)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                    color: Colors.white,
                                    style: BorderStyle.solid)),
                            hintText: "Listelenecek gönderi sayısını giriniz..",
                            hintStyle: TextStyle(color: Colors.white70),
                          ),
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              //snackbar
                              userBloc.add(FetchReddit(_userController?.text));
                            }
                          },
                          child: const Text(
                            "Reddit Post Listele",
                            style:
                            TextStyle(color: Colors.white70, fontSize: 16),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              } else if (state is RedditIsLoading) {
                return const Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Color(0xff003140),
                    ));
              } else if (state is RedditIsLoaded) {
                return ShowPost(state.getReddit,_userController.text);
              } else {
                return Container(
                  padding: const EdgeInsets.only(
                    left: 32,
                    right: 32,
                  ),
                  child: Column(
                    children: <Widget>[
                      const Center(
                          child: Text(
                            "Reddit Post",
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w500,
                                color: Colors.white70),
                          )),
                      const Center(
                          child: Text(
                            "Listele",
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w200,
                                color: Colors.white70),
                          )),
                      const SizedBox(
                        height: 24,
                      ),
                      Form(
                        key: _formKey,
                        child: TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(4),
                          ],
                          validator: (value) {
                            if (value!.isEmpty ||
                                value == "0" ||
                                value == "00" ||
                                value == "1" ||
                                int.parse(value) > 500) {
                              return "Lütfen 1 ile 500 arası adet giriniz..";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          controller: _userController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.white70,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                    color: Colors.white70,
                                    style: BorderStyle.solid)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                    color: Colors.white,
                                    style: BorderStyle.solid)),
                            hintText: "Listelenecek gönderi sayısını giriniz..",
                            hintStyle: TextStyle(color: Colors.white70),
                          ),
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              //SnackBar ekle
                              userBloc.add(FetchReddit(_userController?.text));
                            }
                          },
                          child: const Text(
                            "Reddit Post Listele",
                            style:
                            TextStyle(color: Colors.white70, fontSize: 16),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
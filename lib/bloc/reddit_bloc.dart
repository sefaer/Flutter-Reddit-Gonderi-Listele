import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../model/reddit_model.dart';
import '../repo/reddit_repo.dart';

part 'reddit_event.dart';

part 'reddit_state.dart';

class RedditBloc extends Bloc<RedditEvent, RedditState> {
  RedditRepo redditRepo;

  RedditBloc(this.redditRepo) : super(RedditInitial());

  RedditState get initialState => RedditIsNotSearched();

  @override
  Stream<RedditState> mapEventToState(
    RedditEvent event,
  ) async* {
    if (event is FetchReddit) {
      yield RedditIsLoading();
      try {
         List<ChildData> reddit =
            await redditRepo.getReddit(event._elemanSayisi);
        yield RedditIsLoaded(reddit);
      } catch (_) {
        yield RedditIsNotLoaded();
      }
    } else if (event is ResetReddit) {
      yield RedditIsNotSearched();
    }
  }
}

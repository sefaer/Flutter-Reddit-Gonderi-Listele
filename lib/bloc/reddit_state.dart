part of 'reddit_bloc.dart';

abstract class RedditState extends Equatable {
  const RedditState();
}

class RedditInitial extends RedditState {
  @override
  List<Object> get props => [];
  RedditState get initialState=>RedditIsNotSearched();
}
class RedditIsNotSearched extends RedditState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}
class RedditIsLoading extends RedditState{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}
class RedditIsLoaded extends RedditState{
  final _reddit;
  RedditIsLoaded(this._reddit);
  List<ChildData> get getReddit=>_reddit;
  @override
  // TODO: implement props
  List<Object> get props => [_reddit];

}
class RedditIsNotLoaded extends RedditState{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}
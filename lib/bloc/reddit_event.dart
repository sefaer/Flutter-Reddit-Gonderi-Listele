part of 'reddit_bloc.dart';

abstract class RedditEvent extends Equatable {
  const RedditEvent();
}
class FetchReddit extends RedditEvent{
  final _elemanSayisi;
  const FetchReddit(this._elemanSayisi);

  @override
  List<Object> get props => [_elemanSayisi];
}
class ResetReddit extends RedditEvent{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}
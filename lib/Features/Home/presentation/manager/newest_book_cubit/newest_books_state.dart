part of 'newest_books_cubit.dart';

sealed class NewestBooksState extends Equatable {
  const NewestBooksState();

  @override
  List<Object> get props => [];
}

final class NewestBooksCubitInitial extends NewestBooksState {}

final class NewestBooksCubitLoading extends NewestBooksState {}

final class NewestBooksCubitSuccess extends NewestBooksState {
  final List<BookModel> books;

  const NewestBooksCubitSuccess(this.books);
}

final class NewestBooksCubitFailure extends NewestBooksState {
  final String errMassage;

  const NewestBooksCubitFailure(this.errMassage);
}

import 'package:book_app/Core/errors/failures.dart';
import 'package:book_app/Features/Home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failures, List<BookModel>>> fetchSearchedBooks({required String searchText});

}

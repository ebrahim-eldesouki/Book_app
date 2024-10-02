import 'package:book_app/Core/errors/failures.dart';
import 'package:book_app/Features/Home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<BookModel>>> fetchNewestBooks();
  Future<Either<Failures, List<BookModel>>> fetchFeaturedBooks(); 
  Future<Either<Failures, List<BookModel>>> fetchSimilarBooks({required String category});

}

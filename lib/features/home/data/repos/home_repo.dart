import 'package:book_app/core/errors/failures.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure ,List<BookModel>>> fetchBestSellerBooks();
  Future<Either<Failure ,List<BookModel>>> fetchFeatueredBooks();
}

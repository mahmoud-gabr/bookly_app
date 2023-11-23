import 'package:bloc/bloc.dart';
import 'package:book_app/core/errors/failures.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchFearuredBooks() async {
    var result = await homeRepo.fetchFeatueredBooks();
    result.fold(
      (failure) {
        emit(FeaturedBooksFailure(errMessage: failure.errorMessage));
      },
      (books) {
        emit(FeaturedBooksSucsess(books: books));
      },
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repos/home_repo.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksLoading());
  final HomeRepo homeRepo;

  Future<void> fetchSimilarBooks({required String category}) async {
    var result = await homeRepo.fetchSimilarBooks(category: category);
    result.fold(
      (failure) {
        emit(SimilarBooksFailure(errMessage: failure.errorMessage));
      },
      (books) {
        emit(SimilarBooksSucsess(books: books));
      },
    );
  }
}

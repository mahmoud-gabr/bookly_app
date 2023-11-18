import 'package:book_app/core/utils/styles.dart';
import 'package:book_app/core/widgets/custom_botton.dart';
import 'package:book_app/features/home/presentation/views/widgets/booking_rate.dart';
import 'package:book_app/features/home/presentation/views/widgets/books_action.dart';
import 'package:book_app/features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:book_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:book_app/features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              const CustomBookDetaisAppBar(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * .25),
                child: const CustomBookImage(),
              ),
              const SizedBox(
                height: 46,
              ),
              const Text(
                'The Jungle Book',
                style: Styles.textStyle30,
              ),
              const SizedBox(
                height: 6,
              ),
              Opacity(
                opacity: .7,
                child: Text(
                  'Rudyard Kliping',
                  style: Styles.textStyle18.copyWith(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              const BookRating(
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              const SizedBox(
                height: 37,
              ),
              const BooksAction(),
              const Expanded(
                child: SizedBox(
                  height: 50,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'You Can Also Like',
                    style: Styles.textStyle14.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 25),
                child: SimilarBooksListView(),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        )
      ],
    );
  }
}

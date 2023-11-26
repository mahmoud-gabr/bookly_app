import 'package:book_app/core/utils/functions/launch_url.dart';
import 'package:book_app/core/widgets/custom_botton.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38),
      child: Row(
        children: [
          const Expanded(
            child: CustomBotton(
              text: '19.99 €',
              backgroundColor: Colors.white,
              textColor: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
          ),
          Expanded(
            child: CustomBotton(
              onPressed: () async {
                launchCustomUrl(context, bookModel.volumeInfo.previewLink!);
              },
              text: 'Free Preview',
              fontSize: 16,
              backgroundColor: const Color(0xffEF8262),
              textColor: Colors.white,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

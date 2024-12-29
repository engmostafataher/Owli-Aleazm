import 'package:flutter/material.dart';
import 'package:owli_aleazm/features/home/presentation/views/hadith_Book_view.dart';
import 'package:owli_aleazm/features/home/presentation/views/hijri_calendar_view.dart';
import 'package:owli_aleazm/features/home/presentation/views/quran_view.dart';
import 'package:owli_aleazm/features/home/presentation/views/religion_lessons_view.dart';
import 'category_item.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CategoryItem(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const QuranView();
              }));
              // GoRouter.of(context).push(AppRouter.kQuranView);
            },
            title: "قرآن",
            image: "assets/images/img_11.png",
          ),
          CategoryItem(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const HadithBookView();
              }));
              // GoRouter.of(context).push(AppRouter.kHadithBookView);
            },
            title: "حديث",
            image: "assets/images/img_10.png",
          ),
          CategoryItem(
            onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ReligionLessonsView();
              }));
              
              // GoRouter.of(context).push(AppRouter.kReligionLessonsView);
            },
            title: "دروس دين",
            image: "assets/images/img_9.png",
          ),
          CategoryItem(
            onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const HijriCalendarView();
              }));
              // GoRouter.of(context).push(AppRouter.kHijriCalendarView);
            },
            title: "التقويم",
            image: "assets/images/img_8.png",
          ),
        ],
      ),
    );
  }
}

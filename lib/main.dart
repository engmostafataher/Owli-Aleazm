import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:owli_aleazm/core/helpers/share_pref_helper_token.dart';
import 'package:owli_aleazm/features/auth/manager/signin_signup_cubit/signin_sinup_cubit.dart';
import 'package:owli_aleazm/features/splash/presentation/views/splash_view.dart';
import 'package:owli_aleazm/features/splash_true/presentation/views/splash_true_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/utils/service_locator.dart';
import 'features/home/data/repos/audio_lessons_repo/audio_lessons_repo_impl.dart';
import 'features/home/data/repos/hadith_repo/hadith_repo_impl.dart';
import 'features/home/data/repos/khotab_repo/khotab_repo_impl.dart';
import 'features/home/data/repos/religion_lessons_repo/religion_lessons_repo_impl.dart';
import 'features/home/data/repos/religious_books_repo/religious_books_repo_impl.dart';
import 'features/home/data/repos/surah_repo/surah_repo_impl.dart';
import 'features/home/presentation/manager/audio_lessons_cubit/audio_lessons_cubit.dart';
import 'features/home/presentation/manager/hadith_book_cubit/hadith_book_cubit.dart';
import 'features/home/presentation/manager/hadith_cubit/hadith_cubit.dart';
import 'features/home/presentation/manager/khotab_cubit/khotab_cubit.dart';
import 'features/home/presentation/manager/quran_progress_cubit/quran_progress_cubit.dart';
import 'features/home/presentation/manager/religion_lessons_cubit/religion_lessons_cubit.dart';
import 'features/home/presentation/manager/religious_book_details_cubit/religious_book_details_cubit.dart';
import 'features/home/presentation/manager/religious_books_cubit/religious_books_cubit.dart';
import 'features/home/presentation/manager/surah_list_cubit/surah_list_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
     bool hasToken = await _checkToken();
  await SharedPref.init();
  setupServiceLocator();
  runApp(MyApp(hasToken: hasToken));
}

Future<bool> _checkToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('firebase_token');
  return token != null && token.isNotEmpty;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.hasToken});
   final bool hasToken;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SigninSignupCubit()),
        BlocProvider(
          create: (context) => SurahListCubit(
            getIt.get<SurahRepoImpl>(),
          )..fetchSurahList(),
        ),
        BlocProvider(
          create: (context) => HadithBookCubit(
            getIt.get<HadithRepoImpl>(),
          )..fetchHadithBook(),
        ),
        BlocProvider(
          create: (context) => HadithCubit(
            getIt.get<HadithRepoImpl>(),
          ),
        ),
        BlocProvider(
          create: (context) => ReligiousBooksCubit(
            getIt.get<ReligiousBooksRepoImpl>(),
          )..fetchReligiousBooksList(),
        ),
        BlocProvider(
          create: (context) => ReligiousBookDetailsCubit(
            getIt.get<ReligiousBooksRepoImpl>(),
          ),
        ),
        BlocProvider(
          create: (context) => KhotabCubit(
            getIt.get<KhotabRepoImpl>(),
          )..fetchKhotabList(),
        ),
        BlocProvider(
          create: (context) => ReligionLessonsCubit(
            getIt.get<ReligionLessonsRepoImpl>(),
          )..fetchLessonsList(),
        ),
        BlocProvider(
          create: (context) => AudioLessonsCubit(
            getIt.get<AudioLessonsRepoImpl>(),
          )..fetchLessonsList(),
        ),
        BlocProvider(
          create: (context) => QuranProgressCubit()..loadProgress(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: GoogleFonts.montserratTextTheme.toString(),
        ),
        home:  hasToken?const SplashTrueView():const SplashView() ,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

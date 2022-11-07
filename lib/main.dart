import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_movie_theater/res/colors.dart';
import 'package:odc_movie_theater/view/pages/authentication/splash.dart';
import 'package:odc_movie_theater/view_model/cubit/authentication/auth_cubit.dart';
import 'package:odc_movie_theater/view_model/cubit/movie_cast/movie_cast_cubit.dart';
import 'package:odc_movie_theater/view_model/database/network/dio_helper.dart';
import 'view_model/cubit/main/main_cubit.dart';
import 'view_model/database/local/shared_preference/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MainCubit(),
        ),
        BlocProvider(
          create: (context) => AuthenticationCubit(),
        ),
        BlocProvider(
          create: (context) => MovieCastCubit()..getAllMovieCast(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: firstColor,
          primarySwatch: Colors.red,
          drawerTheme: DrawerThemeData(
            backgroundColor: firstColor,
            width: 280,
            elevation: 2,
            scrimColor: Colors.transparent,
          ),
          appBarTheme: AppBarTheme(
            centerTitle: true,
            backgroundColor: firstColor,
            elevation: 0.0,
          ),
        ),
        home: const Splash(),
      ),
    );
  }
}
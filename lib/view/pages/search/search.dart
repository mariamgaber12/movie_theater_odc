import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_movie_theater/res/colors.dart';
import 'package:odc_movie_theater/view/components/auth/components.dart';
import '../../../view_model/cubit/home/home_cubit.dart';
import '../../components/home/home_drawer.dart';
import '../../components/search/search_com.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: firstColor,
        title: Text(
          'Search',
          style: textStyleRoboto.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => HomeCubit()..searchedMovies,
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            var searchCubit = HomeCubit.get(context);
            return ListView(
              children: [
                buildSearchFormField(
                    onChange: (String val) {
                      searchCubit.searchMovies(val);
                    },
                    controller: searchController,
                    hint: 'Search'),
                const SizedBox(
                  height: 66,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildSearchCard(
                      title: 'Spiderman No Way',
                      image: 'assets/card.png',
                    ),
                    buildSearchCard(
                      title: 'Spiderman No Way',
                      image: 'assets/card.png',
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
      drawer: const DrawerScreen(),
    );
  }
}

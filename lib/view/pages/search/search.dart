import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc_movie_theater/cubit/home/home_cubit.dart';
import 'package:odc_movie_theater/view/componentes/search/search_com.dart';

import '../../componentes/home/home_com.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Search',
          style: GoogleFonts.roboto(
              fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => HomeCubit(),
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            return ListView(
              children: [
                buildSearchFormField(
                    onChange: (String val) {
                      HomeCubit.get(context).searchMovies(val);
                    },
                    controller: searchController,
                    hint: 'Search'),
              ],
            );
          },
        ),
      ),
      drawer: buildDrawerScreen(),
    );
  }
}

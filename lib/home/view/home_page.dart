import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/repository.dart';
import '../bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeBloc(appRepository: AppRepository())..add(GetCountries()),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.apiStatus == ApiStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state.apiStatus == ApiStatus.succeed) {
            return ListView.builder(
              itemCount: state.countries.length,
              itemBuilder: (BuildContext context, int index) {
                final item = state.countries[index];
                return ListTile(
                  title: Text('${item.common}'),
                );
              },
            );
          }

          return SizedBox.fromSize();
        },
      ),
    );
  }
}

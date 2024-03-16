import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemood/blocs/region_bloc/region_bloc.dart';
import 'package:pokemood/components/topbar/drawer_topbar.dart';
import 'package:pokemood/pages/pokemon_list_page.dart';
import 'package:pokemood/pages/region/region_item.dart';

class RegionPage extends StatelessWidget {
  static Route route() => MaterialPageRoute<void>(builder: (_) => RegionPage());

  const RegionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => RegionBloc()..add(LoadRegionEvent()),
        child: BlocRegionView());
  }
}

class BlocRegionView extends StatelessWidget {
  BlocRegionView({
    super.key,
  });

  final double itemWidth = 200;
  final double itemHeight = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: DrawerAppBar(),
      body: SafeArea(
        child: BlocConsumer<RegionBloc, RegionState>(
          listener: (context, state) {
            if (state is RegionError) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Image not loaded')),
              );
            }
          },
          builder: (context, state) {
            if (state is RegionLoaded) {
              int crossAxisCount =
                  (MediaQuery.of(context).size.width / itemWidth).floor();

              return GridView.count(
                padding: const EdgeInsets.only(top: 20),
                crossAxisCount: crossAxisCount,
                childAspectRatio: itemWidth / itemHeight,
                children: state.regions.map((region) {
                  return Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context, PokemonListPage.route(region: region));
                      },
                      child: RegionItem(region: region),
                    ),
                  );
                }).toList(),
              );
            } else if (state is RegionLoading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return const Center(child: SizedBox());
            }
          },
        ),
      ),
    );
  }
}

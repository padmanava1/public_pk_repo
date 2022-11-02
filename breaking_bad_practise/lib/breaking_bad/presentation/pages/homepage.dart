import 'package:breaking_bad_practise/breaking_bad/data/remote/models/EpisodesModel.dart';
import 'package:breaking_bad_practise/breaking_bad/presentation/cubit/homepage_cubit.dart';
import 'package:breaking_bad_practise/breaking_bad/presentation/pages/character_details_page.dart';
import 'package:breaking_bad_practise/breaking_bad/presentation/pages/episode_detail_page.dart';
import 'package:breaking_bad_practise/breaking_bad/presentation/pages/episodes_by_seasons_page.dart';
import 'package:breaking_bad_practise/core/base/base_state.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../injection_container.dart';
import '../cubit/shared_pref_cubit.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final prefCubit = sl<PrefCubit>();
  //bool isChanged = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomepageCubit, BaseState>(
      builder: (context, state) {
        List<EpisodesModel> result = [];
        var homepageCubit = BlocProvider.of<HomepageCubit>(context);
        if (state is StateOnSuccess) {
          var stateResponse = state.response as HomepageParam;
          stateResponse.episodeModelList?.forEach((element) {
            homepageCubit.set.add(element.season?.replaceAll(' ', ''));
          });

          return SafeArea(
            child: Scaffold(
                appBar: AppBar(
                  title: const Text('Breaking Bad'),
                  centerTitle: true,
                  actions: [
                    Switch(
                        activeColor: Colors.blueGrey[200],
                        value: prefCubit.getDarkMode(),
                        onChanged: (bool isSwitch) {
                          prefCubit.setDarkMode(isSwitch);
                          prefCubit.changeCurrentTheme();
                          //homepageCubit.onTapSwitch();
                        })
                  ],
                ),
                drawer: Drawer(
                  child: Column(
                    children: [
                      const DrawerHeader(
                        child: DrawerHeader(
                          //margin: EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/p8696131_b_h10_aa.jpeg'),
                                fit: BoxFit.cover,
                              )),
                          child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                'Find All Seasons below',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              )),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: homepageCubit.set.length,
                            itemBuilder: (BuildContext context, int index) {
                              // final Map groupedList =  groupBy(stateResponse, (EpisodesModel model) => model.season?.replaceAll(' ', '')); //Grouped by Seasons
                              result = homepageCubit.groupedList[homepageCubit
                                      .set
                                      .toList()[
                                  index]]; //Season wise episodes saving in result as Season 1 with 7 episodes in result for index == 1

                              return ListTile(
                                leading: const Icon(
                                  Icons.movie,
                                  color: Colors.white,
                                ),
                                title: Text(
                                  'Season ${homepageCubit.set.toList()[index]}'
                                  ' (${result.length} episodes)',
                                  style: TextStyle(color: Colors.white),
                                ),
                                //subtitle: Text('This is Subtitle'),
                                trailing: const Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                contentPadding: const EdgeInsets.all(10.0),
                                // selected: true,
                                // selectedTileColor: Colors.greenAccent,
                                onTap: () {
                                  //Navigate to particular Season wise Episodes page
                                  List<EpisodesModel> tappedSeason = result;
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          EpisodesBySeasonsPage(
                                            episodesBySeasonsList: tappedSeason,
                                          )));
                                },
                              );
                            }),
                      ),
                    ],
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      // Text('Quick tap to know your favourite characters',style: Theme.of(context).textTheme.headline4?.copyWith(color: Colors.green[300]),),
                      CarouselSlider.builder(
                        itemCount:
                            stateResponse.characterModelList?.length ?? 0,
                        itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) =>
                            GestureDetector(
                          onTap: () {
                            //Code for characters Navigatation Page
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CharacterDetailsPage(
                                    charId: stateResponse
                                            .characterModelList?[itemIndex]
                                            .charId ??
                                        1,
                                    name: stateResponse.characterModelList?[itemIndex].name ??
                                        'Name',
                                    birthday: stateResponse
                                            .characterModelList?[itemIndex]
                                            .birthday ??
                                        'BirthDay',
                                    occupation: stateResponse
                                            .characterModelList?[itemIndex]
                                            .occupation ??
                                        ['Null'],
                                    status: stateResponse
                                            .characterModelList?[itemIndex]
                                            .status ??
                                        'status',
                                    nickname: stateResponse.characterModelList?[itemIndex].nickname ?? 'Nickname',
                                    appearance: stateResponse.characterModelList?[itemIndex].appearance ?? [0],
                                    img: stateResponse.characterModelList?[itemIndex].img ?? 'imgStr',
                                    category: stateResponse.characterModelList?[itemIndex].category ?? 'Category',
                                    portrayed: stateResponse.characterModelList?[itemIndex].portrayed ?? 'Portrayed')));
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0.0, vertical: 8.0),
                            child: Stack(children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: SizedBox(
                                  width: 800,
                                  child: Image.network(
                                    stateResponse.characterModelList?[itemIndex]
                                            .img ??
                                        '',
                                    fit: BoxFit.fill,
                                    errorBuilder: (BuildContext context, _,
                                            __) =>
                                        Image.asset(
                                            'assets/images/placeholder.png'),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  stateResponse.characterModelList?[itemIndex]
                                          .name ??
                                      '',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20),
                                ),
                              )
                            ]),
                          ),
                        ),
                        options: CarouselOptions(
                          autoPlay: true,
                          enlargeCenterPage: true,
                          aspectRatio: 16 / 9,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 600),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: homepageCubit.set.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              List<EpisodesModel> result2 =
                                  homepageCubit.groupedList[
                                      homepageCubit.set.toList()[index]];
                              return seasonHorizontalListView(
                                  seasonName: homepageCubit.set.toList()[index],
                                  length: result2.length,
                                  //homepageCubit.groupedList[index].length,
                                  //
                                  result: result2);
                            }),
                      ),
                    ],
                  ),
                )),
          );
        } else if (state is StateErrorGeneral) {
          Center(child: Text(state.errorMessage));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget seasonHorizontalListView(
      {required String seasonName,
      required int length,
      required List<EpisodesModel> result}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            'Season $seasonName',
            style: TextStyle(
                color: Colors.green[800],
                fontWeight: FontWeight.bold,
                fontSize: 24),
          ),
        ),
        SizedBox(
          height: 220,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics:
                  const BouncingScrollPhysics(), //give SCrollPhysics or it would give error of 'notification.metrics.axis == widget.axis': is not true
              itemCount: length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => EpisodeDetailsPage(
                              on_air_date: result[index].airDate ?? '',
                              characters: result[index].characters ?? [],
                              series: result[index].series ?? '',
                              season: result[index].season ?? "",
                              episode_no: result[index].episode ?? "",
                              episode_title: result[index].title ?? "",
                            )));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 4.0,
                              offset: Offset(
                                  2.0, 2.0), // shadow direction: bottom right
                            )
                          ],
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              opacity: 0.7,
                              image: const AssetImage(
                                  'assets/images/download.jpeg'),
                              colorFilter: ColorFilter.mode(
                                  Colors.green[50]!, BlendMode.hue))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            result[index].series ?? '',
                            style: const TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text("Season ${result[index].season.toString()}",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade300)),
                          const SizedBox(
                            height: 60.0,
                          ),
                          Text("Episode  ${result[index].episode.toString()}",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green[50])),
                          Column(
                            children: [
                              Text("${result[index].title.toString()}",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green[50],
                                      overflow: TextOverflow.ellipsis)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ), //gridTile
                );
              }),
        )
      ],
    );
  }
}

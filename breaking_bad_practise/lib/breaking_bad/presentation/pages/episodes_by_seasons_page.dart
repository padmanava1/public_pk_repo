import 'package:breaking_bad_practise/breaking_bad/presentation/cubit/homepage_cubit.dart';
import 'package:breaking_bad_practise/core/base/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/remote/models/EpisodesModel.dart';
import 'episode_detail_page.dart';

class EpisodesBySeasonsPage extends StatelessWidget {
  EpisodesBySeasonsPage({Key? key, required this.episodesBySeasonsList})
      : super(key: key);
  late List<EpisodesModel> episodesBySeasonsList = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Season ${episodesBySeasonsList[0].season!}"),
          centerTitle: true,
        ),
        body: BlocBuilder<HomepageCubit, BaseState>(
          builder: (context, state) {
            if (state is StateOnSuccess) {
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: episodesBySeasonsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => EpisodeDetailsPage(
                                  on_air_date:
                                      episodesBySeasonsList[index].airDate!,
                                  characters:
                                      episodesBySeasonsList[index].characters!,
                                  series: episodesBySeasonsList[index].series!,
                                  season: episodesBySeasonsList[index].season!,
                                  episode_no:
                                      episodesBySeasonsList[index].episode!,
                                  episode_title:
                                      episodesBySeasonsList[index].title!,
                                )));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 4.0,
                                  offset: Offset(2.0,
                                      2.0), // shadow direction: bottom right
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
                                episodesBySeasonsList[index].series.toString(),
                                //stateResponse[index].series.toString(),
                                style: const TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Text(
                                  "Season ${episodesBySeasonsList[index].season.toString()}",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.shade300)),
                              const SizedBox(
                                height: 60.0,
                              ),
                              Text(
                                  "Episode  ${episodesBySeasonsList[index].episode.toString()}",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green[50])),
                              Column(
                                children: [
                                  Text(
                                      episodesBySeasonsList[index]
                                          .title
                                          .toString(),
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
                      ),
                    );
                  });
            } else if (state is StateErrorGeneral) {
              Center(child: Text(state.errorMessage));
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

import 'package:breaking_bad_practise/core/base/base_state.dart';
import 'package:breaking_bad_practise/core/theme/make_my_trip_theme.dart';
import 'package:breaking_bad_practise/core/theme/text_styles.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../cubit/episode_details_cubit.dart';

class EpisodeDetailsPage extends StatelessWidget {
  String series, season, episode_no, episode_title, on_air_date;
  List<String> characters;

  EpisodeDetailsPage(
      {Key? key,
      required this.characters,
      required this.series,
      required this.season,
      required this.episode_no,
      required this.on_air_date,
      required this.episode_title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: DefaultTabController(
        animationDuration: Duration(seconds: 0),
        length: 2,
        child: Scaffold(
          extendBody: true,
          body: Column(
            children: [
              Stack(children: [
                Container(
                  decoration: BoxDecoration(color: Colors.green[800]),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Season: $season",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "$episode_no: $episode_title",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.calendar_month,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "$on_air_date",
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    top: 10.0,
                    bottom: 10.0,
                    left: 20.0,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(Icons.arrow_back_ios)))
              ]),
              Expanded(
                child: TabBarView(children: [
                  BlocBuilder<EpisodeDetailsCubit, BaseState>(
                    bloc: BlocProvider.of<EpisodeDetailsCubit>(context)
                      ..getCharactersOfEpisodes(characters),
                    //to call a method in first when page is called
                    builder: (context, state) {
                      if (state is StateOnSuccess) {
                        EpisodeDetailsParam stateResponse =
                            state.response as EpisodeDetailsParam;
                        //List<CharacterModel> stateResponse = state.response;
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView.builder(
                              //physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10),
                              itemCount:
                                  stateResponse.characterModelList!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return FlipCard(
                                    speed: 1000,
                                    front: Container(
                                      decoration: BoxDecoration(
                                          // border: Border.all(color: Colors.green[800]!,width: 4.0),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          color: Colors.green[200],
                                          image: DecorationImage(
                                              image: NetworkImage(stateResponse
                                                  .characterModelList![index]
                                                  .img!),
                                              fit: BoxFit.cover)),
                                    ),
                                    back: Container(
                                      decoration: BoxDecoration(
                                          // border: Border.all(color: Colors.green[800]!,width: 4.0),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          color: Colors.green[100]),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Name : ${stateResponse.characterModelList![index].name!}",
                                            style: TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                color: Colors.green[800],
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                              "Birthday : ${stateResponse.characterModelList![index].birthday!}",
                                              style: TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  color: Colors.green[800],
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold)),
                                          Text(
                                              "Status : ${stateResponse.characterModelList![index].status!}",
                                              style: TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  color: Colors.green[800],
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold)),
                                          Text(
                                              "Portrayed : ${stateResponse.characterModelList![index].portrayed!}",
                                              style: TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  color: Colors.green[800],
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold)),
                                          Text(
                                              "Nickname : ${stateResponse.characterModelList![index].nickname!}",
                                              style: TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  color: Colors.green[800],
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold)),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                  "Category : ${stateResponse.characterModelList![index].category!}",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      // overflow:
                                                      // TextOverflow.ellipsis,
                                                      color: Colors.green[800],
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10.0,
                                          )
                                        ],
                                      ),
                                    ));
                              }),
                        );
                      } else if (state is StateErrorGeneral) {
                        return Center(child: Text(state.errorMessage));
                      } else {
                        return const Center(
                            child: CircularProgressIndicator(
                          strokeWidth: 5,
                          color: Colors.green,
                        ));
                      }
                    },
                  ), //1st Page
                  BlocConsumer<EpisodeDetailsCubit, BaseState>(
                    bloc: BlocProvider.of<EpisodeDetailsCubit>(context)
                      ..getCharactersOfEpisodes(characters),
                    listener: (context, state) {
                      if (state is StateErrorGeneral) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("No Data Found!!")));
                      }
                    }, //to call a method in first when page is called
                    builder: (context, state) {
                      if (state is StateOnSuccess) {
                        EpisodeDetailsParam stateResponse =
                            state.response as EpisodeDetailsParam;
                        bool isLoading = stateResponse.isLoading;
                        return Stack(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GridView.builder(
                                //physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10),
                                itemCount:
                                    stateResponse.characterModelList?.length ??
                                        0,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () async {
                                      if (!BlocProvider.of<EpisodeDetailsCubit>(
                                              context)
                                          .isProcess) {
                                        await BlocProvider.of<
                                                EpisodeDetailsCubit>(context)
                                            .getRandomQuotesByAuthor(
                                                stateResponse
                                                        .characterModelList![
                                                            index]
                                                        .name ??
                                                    'Author Name');

                                        BlocProvider.of<EpisodeDetailsCubit>(
                                                        context)
                                                    .quotesModel !=
                                                null
                                            ? await showModalBottomSheet(
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  60.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  60.0)),
                                                ),
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return Container(
                                                    height: 300,
                                                    decoration:
                                                        const BoxDecoration(
                                                      // color:
                                                      //     Colors.green[100],
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      60.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      60.0)),
                                                    ),
                                                    //height: 800,
                                                    child: Center(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10.0),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: <
                                                                  Widget>[
                                                                Transform.scale(
                                                                    scaleX: -1,
                                                                    child: const Icon(
                                                                        Icons
                                                                            .format_quote,
                                                                        color: Colors
                                                                            .green)),
                                                                Center(
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsets
                                                                            .all(
                                                                        12.0),
                                                                    child: Text(
                                                                      """ ${BlocProvider.of<EpisodeDetailsCubit>(context).quotesModel?.quote ?? 'No quotes available'}  """,
                                                                      style: const TextStyle(
                                                                          fontSize:
                                                                              22,
                                                                          fontWeight: FontWeight
                                                                              .w600,
                                                                          fontStyle:
                                                                              FontStyle.italic),
                                                                    ),
                                                                  ),
                                                                ),
                                                                const Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .bottomRight,
                                                                    child: Icon(
                                                                        Icons
                                                                            .format_quote,
                                                                        color: Colors
                                                                            .green)),
                                                                Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .bottomRight,
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            20.0),
                                                                    child: Text(
                                                                        """- ${BlocProvider.of<EpisodeDetailsCubit>(context).quotesModel?.author ?? 'No Author Available'}""",
                                                                        style:
                                                                            const TextStyle(
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.w400,
                                                                        )),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                })
                                            : ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    content: Text(
                                                        'error loading quote')));
                                      }
                                    },
                                    child: FlipCard(
                                        flipOnTouch: false,
                                        front: Container(
                                          decoration: BoxDecoration(
                                              // border: Border.all(color: Colors.green[800]!,width: 4.0),
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              color: Colors.green[200],
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      stateResponse
                                                          .characterModelList![
                                                              index]
                                                          .img!),
                                                  fit: BoxFit.cover)),
                                        ),
                                        back: Container(
                                          decoration: BoxDecoration(
                                              // border: Border.all(color: Colors.green[800]!,width: 4.0),
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              color: Colors.green[100]),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Name : ${stateResponse.characterModelList![index].name!}",
                                                style: TextStyle(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    color: Colors.green[800],
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                  "Birthday : ${stateResponse.characterModelList![index].birthday!}",
                                                  style: TextStyle(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      color: Colors.green[800],
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text(
                                                  "Status : ${stateResponse.characterModelList![index].status!}",
                                                  style: TextStyle(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      color: Colors.green[800],
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text(
                                                  "Potrayed : ${stateResponse.characterModelList![index].portrayed!}",
                                                  style: TextStyle(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      color: Colors.green[800],
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text(
                                                  "Nickname : ${stateResponse.characterModelList![index].nickname!}",
                                                  style: TextStyle(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      color: Colors.green[800],
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                      "Category : ${stateResponse.characterModelList![index].category!}",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          // overflow:
                                                          // TextOverflow.ellipsis,
                                                          color:
                                                              Colors.green[800],
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10.0,
                                              )
                                            ],
                                          ),
                                        )),
                                  );
                                }),
                          ),
                          Visibility(
                            visible: isLoading,
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: ColoredBox(color: Colors.black45,),
                              )),
                          // Visibility(
                          //     visible:isLoading,
                          //     child: Center(child: CircularProgressIndicator(color: Colors.green[800],))),
                          Visibility(
                            visible: isLoading,
                            child: const AlertDialog(
                              title: Text(
                                  'Please wait while we load'), // To display the title it is optional
                              // Action widget which will provide the user to acknowledge the choice
                              actions: [
                                Center(child: CircularProgressIndicator(color: Colors.green,strokeWidth: 5.0,))
                              ],
                              actionsPadding: EdgeInsets.all(8.0),
                            ),
                          )
                        ]);
                      } else {
                        return Column(
                          children: [
                            Center(
                                child: SizedBox(
                              height: size.height * 0.3,
                            )),
                            const Center(child: Text('Error Loading Page!!')),
                          ],
                        );
                      }
                    },
                  ), //2nd Page
                ]),
              ),
            ],
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(color: Colors.green),
            child: const TabBar(
              indicatorColor: Colors.yellow,
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.people,
                    size: 35,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.format_quote,
                    size: 35,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

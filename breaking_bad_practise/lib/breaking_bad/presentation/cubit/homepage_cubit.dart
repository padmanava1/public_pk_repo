import 'package:bloc/bloc.dart';
import 'package:breaking_bad_practise/breaking_bad/domain/usecases/get_random_characters_usecase.dart';
import 'package:breaking_bad_practise/breaking_bad/presentation/cubit/episode_details_cubit.dart';
import 'package:breaking_bad_practise/core/base/base_state.dart';
import 'package:breaking_bad_practise/core/failures/failures.dart';
import 'package:collection/collection.dart';

import '../../../core/usecases/usecase.dart';
import '../../data/remote/models/CharacterModel.dart';
import '../../data/remote/models/EpisodesModel.dart';
import '../../domain/usecases/get_all_episodes_usecase.dart';

class HomepageCubit extends Cubit<BaseState> {
  HomepageCubit(
      {required this.getAllEpisodesUsecase,
      required this.getRandomCharactersUsecase})
      : super(StateInitial());

  GetAllEpisodesUsecase getAllEpisodesUsecase;
  GetRandomCharactersUsecase getRandomCharactersUsecase;
  Set set = <String>{};
  late Map groupedList = {};

  showAllEpisodes() async {
    final response = await getAllEpisodesUsecase.call(NoParams());
    response.fold((l) => emit(StateErrorGeneral("Failed to load data!")), (r) {
      groupedList = groupBy(
          r, (EpisodesModel model) => model.season?.replaceAll(' ', ''));

      emit(StateOnSuccess(response: HomepageParam(episodeModelList: r)));
      showRandomCharacters();
    });
  }

  //   onTapSwitch() {
  //   if (state is StateOnSuccess) {
  //     final success = state as StateOnSuccess;
  //     emit(success.copyWith());
  //   }
  // }

  showRandomCharacters() async {
    if (state is StateOnSuccess) {
      final success = state as StateOnSuccess<HomepageParam>;
      final response = await getRandomCharactersUsecase.call(NoParams());
      response.fold((l) => ServerFailure(failureMsg: "Server failed to load!"),
          (charModelList) {
        emit(success.copyWith(
            response: success.response?.copyWith(
          characterModelList: charModelList,
        )));
      });
    }
  }
}

class HomepageParam {
  List<EpisodesModel>? episodeModelList;
  List<CharacterModel>? characterModelList;
  String? errormsg;

  HomepageParam(
      {this.episodeModelList, this.characterModelList, this.errormsg});

  HomepageParam copyWith({
    List<EpisodesModel>? episodeModelList,
    List<CharacterModel>? characterModelList,
    String? errormsg,
  }) {
    return HomepageParam(
        episodeModelList: episodeModelList ?? this.episodeModelList,
        characterModelList: characterModelList ?? this.characterModelList,
        errormsg: errormsg ?? this.errormsg);
  }
}

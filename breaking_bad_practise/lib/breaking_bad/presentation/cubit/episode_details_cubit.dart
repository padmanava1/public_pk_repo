import 'package:bloc/bloc.dart';
import 'package:breaking_bad_practise/breaking_bad/data/remote/models/QuotesModel.dart';
import 'package:breaking_bad_practise/core/base/base_state.dart';

import '../../data/remote/models/CharacterModel.dart';
import '../../domain/usecases/get_characters_of_episodes_usecase.dart';
import '../../domain/usecases/get_random_quotes_by_author.dart';

class EpisodeDetailsCubit extends Cubit<BaseState> {
  GetCharactersOfEpisodesUsecase getCharactersOfEpisodesUsecase;
  GetRandomQuotesByAuthorUsecase getRandomQuotesByAuthorUsecase;
  QuotesModel? quotesModel;
  bool isProcess = false;
  EpisodeDetailsCubit(
      {required this.getCharactersOfEpisodesUsecase,
      required this.getRandomQuotesByAuthorUsecase})
      : super(StateInitial());

  getCharactersOfEpisodes(List<String> charactersList) async {
    // emit(StateOnSuccess(response: EpisodeDetailsParam(isLoading: true)));
    var res = await getCharactersOfEpisodesUsecase.call(charactersList);
    res.fold((l) {
      emit(StateErrorGeneral('Sorry! Could not load from Server! T-T'));
    }, (r) {
      emit(StateOnSuccess(
        response: EpisodeDetailsParam(characterModelList: r, isLoading: false),
      ));
    });
  }

  Future<void> getRandomQuotesByAuthor(String author) async {
    if (state is StateOnSuccess) {
      final success = state as StateOnSuccess;
      final response = success.response as EpisodeDetailsParam;
      isProcess = true;
      emit(success.copyWith(response: response.copyWith(isLoading: true)));
      var res = await getRandomQuotesByAuthorUsecase.call(author);

      res.fold((l) {
        isProcess = false;
        quotesModel = null;
        emit(success.copyWith(response: response.copyWith(isLoading: false)));
      }, (r) {
        isProcess = false;
        quotesModel = r;
        emit(success.copyWith(response: response.copyWith(isLoading: false)));
      });
    }
  }
}

class EpisodeDetailsParam {
  QuotesModel? quotesModel;
  List<CharacterModel>? characterModelList;
  String? errormsg;
  bool isLoading;

  EpisodeDetailsParam(
      {this.characterModelList,
      this.quotesModel,
      this.errormsg,
      required this.isLoading});

  EpisodeDetailsParam copyWith(
      {QuotesModel? quotesModel,
      List<CharacterModel>? characterModelList,
      String? errormsg,
      bool? isLoading}) {
    return EpisodeDetailsParam(
        characterModelList: characterModelList ?? this.characterModelList,
        errormsg: errormsg ?? this.errormsg,
        quotesModel: quotesModel ?? this.quotesModel,
        isLoading: isLoading ?? this.isLoading);
  }
}

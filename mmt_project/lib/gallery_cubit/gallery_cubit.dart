import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mmt_project/Pages/gallery_page.dart';

part 'gallery_state.dart';

class GalleryCubit extends Cubit<GalleryState> {
  GalleryCubit() : super(GalleryInitial());

  void setPage(int index){
    emit(GalleryChangedPage(index));
  }

}

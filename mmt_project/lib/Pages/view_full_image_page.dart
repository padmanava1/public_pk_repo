import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mmt_project/Pages/gallery_page.dart';
import 'package:mmt_project/gallery_cubit/gallery_cubit.dart';
import 'package:mmt_project/theme/make_my_trip_colors.dart';
import 'package:photo_view/photo_view.dart';

class ViewImage extends StatelessWidget {
  const ViewImage({
    Key? key,
    required this.index,
    required this.imgStr,
  }) : super(key: key);
  final int index;
  final String imgStr;

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: index);
    return BlocProvider<GalleryCubit>(
      create: (context) => GalleryCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: MakeMyTripColors.colorBlack,
        body: BlocBuilder<GalleryCubit, GalleryState>(
          builder: (context, state) {
            return Center(
              child: Hero(
                  tag: (state is GalleryChangedPage)
                      ? state.index.toString()
                      : index.toString(),
                  child: PageView.builder(
                      controller: controller,
                      itemCount: imageList.length,
                      pageSnapping: true,
                      onPageChanged: (val) {
                        context.read<GalleryCubit>().setPage(val);
                      },
                      itemBuilder: (context, pagePosition) {
                        return InteractiveViewer(
                          panEnabled: true,
                          minScale: 0.1,
                          maxScale: 1.6,
                          child: Container(
                              margin: const EdgeInsets.all(10),
                              child: FadeInImage.assetNetwork(
                                  alignment: Alignment.center,
                                  placeholder: 'assets/images/placeholder.png',
                                  image: imageList[pagePosition],
                                  imageErrorBuilder:
                                      (context, error, stackTrace) {
                                    return Image.asset(
                                        'assets/images/placeholder.png',
                                        fit: BoxFit.fitWidth);
                                  })),
                        );

                      })),
            );
          },
        ),
      ),
    );
  }
}

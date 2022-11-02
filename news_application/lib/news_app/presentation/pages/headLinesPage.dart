import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/news_app/presentation/cubit/news_cubit.dart';
import 'package:news_application/news_app/presentation/cubit/news_state.dart';

import '../../data/models/HeadlinesModel.dart';

class HeadLinesPage extends StatelessWidget {
  HeadLinesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Headlines'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: SizedBox(
                    width: 250,
                    child: TextFormField(
                      //controller: reviewController,
                      //onChanged: (val) {
                      //   val = reviewController.text;
                      //   context
                      //       .read<PublishReviewCubit>()
                      //       .onChangeCommentReviewValueEvent(val);
                      // }
                      // ,
                      decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          hintStyle: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.normal),
                          hintText: "Search for Country eg: us,in etc...."),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      print('hello');
                      // BlocProvider.of<NewsCubit>(context).getNewsHeadlines();
                    },
                    child: Icon(Icons.search)),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            BlocBuilder<NewsCubit, NewsState>(
              builder: (context, state) {
                if (state is StateOnSuccess) {
                  List<HeadlinesModel> model = state.headlist;
                  print(state.headlist);
                  return Expanded(
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                childAspectRatio: 1.5 / 2.5,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10),
                        itemCount: model.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {},
                            child: Card(
                                elevation: 6,
                                child: Column(
                                  children: [

                                          FadeInImage.assetNetwork(
                                            fit: BoxFit.cover,
                                            placeholder: 'assets/images/placeholder.png',
                                            image: model[index].urlToImage!,
                                              imageErrorBuilder: (context, error, stackTrace) {
                                                return Image.asset('assets/images/placeholder.png');
                                              }
                                          )
                                      ,
                                      // BoxDecoration(
                                      //     image:
                                      //     DecorationImage(
                                      //         image: NetworkImage(model[index]
                                      //             .urlToImage
                                      //             .toString()),
                                      //         fit: BoxFit.cover)
                                      // ),

                                    Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 8.0, horizontal: 4.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              model[index].title!,
                                              style: TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.orange),
                                              maxLines: 4,
                                            ),
                                          ],
                                        ))
                                  ],
                                )),
                          );
                        }),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

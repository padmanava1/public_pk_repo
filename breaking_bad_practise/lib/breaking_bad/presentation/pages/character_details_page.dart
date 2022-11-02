import 'package:flutter/material.dart';

class CharacterDetailsPage extends StatelessWidget {
  num charId;
  String name;
  String birthday;
  List<String> occupation;
  String img;
  String status;
  String nickname;
  List<num> appearance;
  String portrayed;
  String category;

  CharacterDetailsPage(
      {Key? key,
      required this.charId,
      required this.name,
      required this.birthday,
      required this.occupation,
      required this.status,
      required this.nickname,
      required this.appearance,
      required this.img,
      required this.category,
      required this.portrayed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            //margin: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: AspectRatio(
                    aspectRatio: 2 / 3,
                    child: SizedBox(
                      //height: 400,width: 400,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          img,
                          fit: BoxFit.fill,
                          errorBuilder: (BuildContext context, _, __) =>
                              Image.asset('assets/images/placeholder.png'),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
                  child: Text(
                    "Birthday: $birthday",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
                  child: Text(
                    "Status: $status",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
                  child: Text(
                    "Nickname: $nickname",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
                  child: Text(
                    "Portrayed: $portrayed",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
                  child: Text(
                    "Category: $category",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Occupation: ',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            overflow: TextOverflow.ellipsis),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 22,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemCount: occupation.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Text(
                                  "${occupation[index].toString()},",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      overflow: TextOverflow.ellipsis),
                                );
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

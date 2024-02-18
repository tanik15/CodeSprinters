import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/api/api.dart';
import 'package:portfolio/colors/colors.dart';

class Carousal extends StatefulWidget {
  const Carousal({super.key});

  @override
  State<Carousal> createState() => _CarousalState();
}

class _CarousalState extends State<Carousal> {
  List res = [];

  void getCarousel() async {
    final respnse = await getCarousalDetails();
    print(respnse);
    setState(() {
      res = respnse;
    });
  }

  @override
  void initState() {
    getCarousel();
    // BlocProvider.of<CarousalBloc>(context).add(GetCarousal());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // return BlocBuilder<CarousalBloc, CarousalState>(
    //   builder: (context, state) {
    //     if (state is CarousalLoadingState) {
    //       return Center(
    //         child: LoadingAnimationWidget.hexagonDots(
    //           color: const Color.fromARGB(255, 51, 152, 224),
    //           size: 70,
    //         ),
    //       );
    //     }
    // if (state is CarousalLoadedState) {
    //   if (state.getMarks.isEmpty) {
    //     return Text(
    //       "No Carousel yet",
    //       style: Theme.of(context).textTheme.titleMedium,
    //     );
    //   }
    return CarouselSlider(
      options: CarouselOptions(
        enlargeCenterPage: true,
        pauseAutoPlayOnManualNavigate: true,
        autoPlay: true,
        viewportFraction: 0.9,
        autoPlayInterval: const Duration(seconds: 2),
        autoPlayAnimationDuration: const Duration(milliseconds: 1000),
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
      items: [
        for (int i = 0; i < res.length; i++)
          for (int i = 0; i < 2; i++)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 5.0,
                vertical: 18,
              ),
              child: GestureDetector(
                onTap: () {
                  // alertboxx(
                  //   context,
                  //   state.getMarks[i]['description'],
                  //   state.getMarks[i]['title'],
                  //   state.getMarks[i]['url'],
                  // );
                },
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade900,
                        blurRadius: 10,
                        offset: const Offset(2, 3),
                      )
                    ],
                    borderRadius: BorderRadius.circular(20),
                    // color: const Color.fromRGBO(163, 216, 255, 1),
                    color: lightColor,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 12.0, top: 15, bottom: 10, left: 15),
                              child: Text(res[i]['title'],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 12.0, top: 3, bottom: 9, left: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(res[i]['description'],
                                      maxLines: 2,
                                      //  (state.getMarks[i]['title']
                                      // .length >
                                      //     20)
                                      // ? 2
                                      // : 3
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(color: Colors.white)),
                                  // Text("knowmore",
                                  //     style: Theme.of(context)
                                  //         .textTheme
                                  //         .bodyMedium!
                                  //         .copyWith(
                                  //           color: Colors.white,
                                  //             decoration:
                                  //                 TextDecoration.underline))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.network(
                              res[i]['img'],
                              errorBuilder: (BuildContext context, Object error,
                                  StackTrace? stackTrace) {
                                return const Icon(
                                    Icons.image_not_supported_outlined);
                              },
                              fit: BoxFit.cover,
                              // width: 115,
                              width: size.width * 0.32,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
      ],
    );
    // }
    //   return const Text("Something went wrong");
    // },
    // );
  }
}

void alertboxx(context, String message, String title, String url) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: const Color.fromARGB(255, 208, 231, 248),
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(
                image: NetworkImage(
                  "https://edsanchaar.in/api/api_admin/$url",
                ),
                fit: BoxFit.cover,
                height: 200,
                // width: 20,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Okay",
                style: Theme.of(context).textTheme.bodyLarge,
              ))
        ],
      );
    },
  );
}

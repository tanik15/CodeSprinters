import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SmallCaruosal extends StatefulWidget {
  const SmallCaruosal({super.key});

  @override
  State<SmallCaruosal> createState() => _SmallCaruosalState();
}

class _SmallCaruosalState extends State<SmallCaruosal> {
  @override
  void initState() {
    // BlocProvider.of<SmallCaruosalBloc>(context).add(GetSmallCaruosal());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // return BlocBuilder<SmallCaruosalBloc, SmallCaruosalState>(
    //   builder: (context, state) {
    //     if (state is SmallCaruosalLoadingState) {
    //       return Center(
    //         child: LoadingAnimationWidget.hexagonDots(
    //           color: const Color.fromARGB(255, 51, 152, 224),
    //           size: 70,
    //         ),
    //       );
    //     }
    // if (state is SmallCaruosalLoadedState) {
    //   if (state.getMarks.isEmpty) {
    //     return Text(
    //       "No Carousel yet",
    //       style: Theme.of(context).textTheme.titleMedium,
    //     );
    //   }
    return SizedBox(
      height: 50,
      child: CarouselSlider(
        options: CarouselOptions(
          enlargeCenterPage: false,
          pauseAutoPlayOnManualNavigate: true,
          autoPlay: true,
          viewportFraction: 0.3,
          autoPlayInterval: const Duration(seconds: 2),
          // autoPlayAnimationDuration: const Duration(milliseconds: 1000),
          autoPlayCurve: Curves.linear,
        ),
        items: [
          // for (int i = 0; i < state.getMarks.length; i++)
          for (int i = 0; i < 2; i++)
           Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
              color: Colors.grey.withOpacity(0.5),
                ),
                height: 10,
                width: 120,
                child: const Center(child: Text("Sensex")),
              ),
            )
        ],
      ),
    );
    // }
    //   return const Text("Something went wrong");
    // },
    // );
  }
}

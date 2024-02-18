import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/colors/colors.dart';

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

  List list = ['Sensex', 'Nifty 50', "Bank Nifty"];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
          for (int i = 0; i < 3; i++)
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: lightColor,
                ),
                height: 10,
                width: 120,
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      list[i],
                      style: TextStyle(
                          color: (i != 1) ? Colors.green : Colors.red),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    if(i != 1)  
                    const Icon(
                      Icons.arrow_upward,
                      color: Colors.green,
                      size: 15,
                    ),
                    if(i == 1)  
                    const Icon(
                      Icons.arrow_downward,
                      color: Colors.red,
                      size: 15,
                    )
                  ],
                )),
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

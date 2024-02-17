// import 'package:fl_chart/fl_chart.dart';
import 'package:candlesticks/candlesticks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/bloc/home_screen_bloc.dart';
import 'package:portfolio/data/line_chart.dart';
import 'package:portfolio/screens/mutual_fund.dart';
import 'package:portfolio/screens/quick_buy.dart';
import 'package:portfolio/widget/carousal.dart';
import 'package:portfolio/widget/small_carousal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController controller = ScrollController();
  final candle = Candle(
      date: DateTime.now(),
      open: 1780.36,
      high: 1873.93,
      low: 1755.34,
      close: 1848.56,
      volume: 0);
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   forceMaterialTransparency: true,
      //   automaticallyImplyLeading: false,
      //   title: const Text("Wealth Wise"),
      // ),
      body: (currentPageIndex == 0)
          ? HomeScreenWidget(size: size)
          : (currentPageIndex == 2)
              ? const QuickBuy()
              : const MutualFundScreen(),
      bottomNavigationBar: NavigationBar(
        height: 65,
        backgroundColor: Colors.white,
        elevation: 0,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.white,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 12.0),
            child: NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(
                Icons.home,
                color: Colors.blueGrey,
              ),
              label: 'Home',
            ),
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.group),
            icon: Icon(
              Icons.portable_wifi_off_rounded,
              color: Colors.blueGrey,
            ),
            label: 'Mutual Fund',
          ),
          NavigationDestination(
            selectedIcon: Badge(child: Icon(Icons.home)),
            icon: Icon(
              Icons.electric_bike,
              color: Colors.blueGrey,
            ),
            label: 'Quick Buy',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(
              Icons.person,
              color: Colors.blueGrey,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {

bool isnewNews = false;

  void timeer()async{
    setState(() {
      isnewNews = true;
    });
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      isnewNews = false;
    });
  }

  @override
  void initState() {
    timeer();
    BlocProvider.of<HomeScreenBloc>(context).add(GetTopGainers());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            if(!isnewNews)
            AppBar(
              forceMaterialTransparency: true,
              automaticallyImplyLeading: false,
              title: const Text("Wealth Wise"),
            ),
            if(isnewNews)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
              child: Material(
                borderRadius: const BorderRadius.all(Radius.circular(13)),
                elevation: 4,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(29, 32, 34, 0.733),
                      borderRadius: BorderRadius.all(Radius.circular(13))),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                    child: Center(
                        child: Text(
                            "You have received message from",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: Colors.white))),
                  ),
                ),
              ),
            ),
            const Carousal(),
            const SizedBox(
                height: 40, width: double.infinity, child: SmallCaruosal()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 120,
                    width: widget.size.width * 0.42,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade900,
                          blurRadius: 5,
                          offset: const Offset(1, 2),
                        )
                      ],
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    height: 120,
                    width: widget.size.width * 0.42,
                    decoration: BoxDecoration(
                      // border: Border.all(),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade900,
                          blurRadius: 5,
                          offset: const Offset(1, 2),
                        )
                      ],
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            GridViewWidget(size: widget.size, title: "Top Gainers"),
            GridViewWidget(
              size: widget.size,
              title: "Top Losers",
            ),
            GridViewWidget(
              size: widget.size,
              title: "Highest Price",
            ),
            GridViewWidget(
              size: widget.size,
              title: "Lowest Price",
            ),
          ],
        ),
      ),
    );
  }
}

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({
    super.key,
    required this.size,
    required this.title,
  });

  final Size size;
  final String title;

  @override
  Widget build(BuildContext context) {
    // final candle =  Candle(date: DateTime.now(), open: 1780.36, high: 1873.93, low: 1755.34, close: 1848.56, volume: 0);
    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(title,
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: size.width * 0.065,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          SizedBox(
            height: 340,
            child: GridView.count(
              primary: false,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(25),
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
              crossAxisCount: 2,
              childAspectRatio: 1,
              children: <Widget>[
                for (int i = 0; i < 4; i++)
                  Material(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    elevation: 6,
                    child: Container(
                      // height: 60,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Reliance",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "abc",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14),
                              textAlign: TextAlign.center,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: SizedBox(
                                height: 60,
                                // child: LineChartSample2(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),

          const SizedBox(
            height: 300,
            child: LineChartt(
              isShowingMainData: true,
            ),
          ),
          // SizedBox(
          //   height: 250,
          //   child: Candlesticks(
          //     candles: [candle],
          //   ),
          // ),
          // LineChartSample7()
        ],
      ),
    );
  }
}

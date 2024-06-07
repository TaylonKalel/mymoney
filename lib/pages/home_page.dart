import 'package:mymoney/pages/home_service.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _homeService = HomeService();
  late Future _future;

  @override
  void initState() {
    super.initState();

    _future = Future.wait([_homeService.loadAds()]);
  }

  @override
  Widget build(BuildContext context) {
    // return testBody();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                await _homeService.logout();
                if (mounted) {
                  // ignore: use_build_context_synchronously
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/', ModalRoute.withName("/"));
                }
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: FutureBuilder(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return container();
            } else {
              return const CircularProgressIndicator();
            }
          }),
    );
  }

  Widget container() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        columnLeftContainer(),
        columnCenterContainer(),
        columnRightContainer()
      ],
    );
  }

  Widget columnLeftContainer() {
    return Container(
      width: 15.w,
      height: 100.h,
      color: Colors.blue,
      alignment: Alignment.centerLeft,
      child: const Center(child: Text('Propaganda')),
    );
  }

  Widget columnCenterContainer() {
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      width: 60.w,
      height: 100.h,
      child: ListView.builder(
        itemCount: _homeService.ads.length,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 10.h,
            child: ListTile(
              title: Text(_homeService.ads[index].title ?? ""),
            ),
          );
        },
      ),
    );
  }

  Widget columnRightContainer() {
    return Container(
      width: 15.w,
      height: 100.h,
      color: Colors.blue,
      alignment: Alignment.centerRight,
      child: const Center(child: Text('Propaganda')),
    );
  }
}

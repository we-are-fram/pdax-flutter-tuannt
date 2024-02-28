
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persons_exam/data/model/repo/model.dart';
import 'package:persons_exam/screen/home/bloc/bloc.dart';
import 'package:persons_exam/screen/home/widget_home_toolbar.dart';
import 'package:persons_exam/screen/profile/profile_page.dart';

import '../../utils/my_const/COLOR_CONST.dart';
import '../custom_ui/custom_ui.dart';


class MyHomePage extends StatefulWidget {


  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MyHomePage> {

  late ScrollController _controller;

  late HomeBloc dataBloc;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController()..addListener(_scrollListener);
    dataBloc = BlocProvider.of<HomeBloc>(context);
    dataBloc.add(LoadHome());
  }
  void _scrollListener() {

    if (_controller.position.atEdge) {
      // Load more items when reaching the end
      bool isBottom = _controller.position.pixels == _controller.position.maxScrollExtent;

      if (isBottom) {
        print('HomeBloc At the bottom');
        dataBloc.add(LoadMoreHome());
      } else {
        print('HomeBloc At the top');
        //loadMore
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
         BlocProvider(
            create: (context) =>
                BlocProvider.of<HomeBloc>(context),
         lazy: false,),

      ],
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              body: Container(
                color: COLOR_CONST.WHITE,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    WidgetHomeToolbar(),
                    _buildContent(state),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildContent(HomeState state) {

    if (state is HomeLoaded) {
      return Expanded(
        child: RefreshIndicator(
          onRefresh: () async{
            BlocProvider.of<HomeBloc>(context).add(RefreshHome());
          },
          child: _buildListView(state),
        ),
      );
    } else if (state is HomeLoading) {
      return const Expanded(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else if (state is HomeNotLoaded) {

      return const Expanded(
        child: Center(
          child: Text('Cannot load data'),
        ),
      );
    } else {
      return const Expanded(
        child: Center(
          child: Text('Unknown state'),
        ),
      );
    }
  }

  Widget _buildListView(HomeLoaded state) {

    var oldsize = MediaQuery.of(context).size;
    final double navigationBarHeight = MediaQuery.of(context).padding.bottom;
    final statusBarHeight = MediaQuery.of(context).viewPadding.top;
    var size = Size(oldsize.width,
        oldsize.height - navigationBarHeight  - statusBarHeight);
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.01),
      width: size.width,
      height: size.height,
      child:
      ListView.builder(
          controller: _controller,
          itemCount: state.peoples.length+1,
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            if (index == state.peoples.length) {
              return const Center(child: CircularProgressIndicator());
            }
            People current =
            state.peoples[index];
            return GestureDetector(
              onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(personData: current),
              ),
            ),
              child: Container(
                margin: const EdgeInsets.all(8.0),
                width: size.width,
                height: size.height * 0.15,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: current.lastName,
                      child: Container(
                        margin: const EdgeInsets.all(8.0),
                        width: size.width * 0.28,
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(15),
                          image:DecorationImage(
                            image: Image.network(current.image).image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.02),
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: size.height * 0.035,
                          ),
                          AppText(
                            text: "${current.lastName}",
                            size: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                          SizedBox(
                            height: size.height * 0.005,
                          ),
                          AppText(
                            text: "Email: ${current.email}",
                            size: 14,
                            color:
                            Colors.black.withOpacity(0.5),
                            fontWeight: FontWeight.w300,
                          ),
                          AppText(
                            text:"Age: ${current.age}",
                            size: 14,
                            color:
                            Colors.black.withOpacity(0.5),
                            fontWeight: FontWeight.w300,
                          ),
                          AppText(
                            text: "Phone: ${current.phone}",
                            size: 14,
                            color:
                            Colors.black.withOpacity(0.5),
                            fontWeight: FontWeight.w300,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),

    );
  }
}
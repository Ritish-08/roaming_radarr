import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roaming_radarr/pages/RegisterPage/ui/register_page.dart';
import 'package:roaming_radarr/pages/navpages/HomePage/bloc/home_page_bloc.dart';
import '../../../../colors/colors.dart';
import '../../../../widgets/app_large_text.dart';
import '../../../../widgets/app_text.dart';
import '../../../DetailPage/ui/detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  Map images = {
    "balloning.png": "Balloning", //key value pair
    "hiking.png": "Hiking",
    "kayaking.png": "Kayaking",
    "snorkling.png": "Snorkling"
  };
  HomePageBloc homePageBloc = HomePageBloc();
  @override
  void initState() {
    // TODO: implement initState
    homePageBloc.add(HomeInitialEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return BlocConsumer<HomePageBloc, HomePageState>(
      bloc: homePageBloc,
      listenWhen: (previous, current) => current is HomePageActionState,
      buildWhen: (previous, current) => current is! HomePageActionState,
      listener: (context, state) {
        if (state is BacktoRegisterPageState) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => RegisterPage(),
            ),
          );
        }
        else if(state is MovingOnDetailPageState){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage(product: state.product)));
        }
      },
      builder: (context, state) {
        switch(state.runtimeType){
          case HomePageLoadingState:
            return Center(child: CircularProgressIndicator(),);
          case HomePageLoadedSuccessState:
            final SuccessState = state as HomePageLoadedSuccessState;
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //menu text
                  Container(
                    padding: EdgeInsets.only(top: 70, left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Logout'),
                                  content: Text('Are you sure you want to logout.'),
                                  actions: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(Icons.close,color: Colors.red,),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        homePageBloc.add(MovingToRegisterPage());
                                        Navigator.pop(context); // Close the dialog after moving to register page
                                      },
                                      icon: Icon(Icons.check,color: Colors.green,),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          icon: Icon(
                            Icons.exit_to_app_sharp,
                            size: 30,
                            color: Colors.red,
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(right: 20),
                          width: 50.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.withOpacity(.2),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image(
                              image: AssetImage('img/Ritish.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  //discover text
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: AppLargeText(
                      text: 'Discover',
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  //tabbar
                  Container(
                    //width: MediaQuery.sizeOf(context).width,
                    margin: EdgeInsets.only(left: 20),
                    child: TabBar(
                        tabAlignment: TabAlignment.start,
                        dividerColor: Theme.of(context).colorScheme.background,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorPadding: EdgeInsets.only(left: 15, right: 15),
                        labelPadding: EdgeInsets.only(left: 0, right: 15),
                        indicatorColor: Colors.purple,
                        controller: _tabController,
                        isScrollable: true,
                        tabs: [
                          Tab(text: 'Places'),
                          Tab(text: 'Inspiration'),
                          Tab(text: 'Emotions'),
                        ]),
                  ),

                  //tabbarview ka container
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    height: 300,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        ListView.builder(
                            itemCount: 5,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              // index 0 se itemcount-1 tak
                              return GestureDetector(
                                onTap: () {
                                  homePageBloc.add(ClickingonEachProductImage(clickedProduct: SuccessState.products[index]));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 15, top: 10),
                                  width: 200,
                                  height: 300,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    image: DecorationImage(
                                      image: NetworkImage('http://mark.bslmeiyu.com/uploads/'+ SuccessState.products[index].img),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            }),
                        Tab(text: 'Inspiration'),
                        Tab(text: 'Emotions'),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(
                          text: 'Explore More',
                          size: 22,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        AppText(text: 'See all', color: AppColors.textColor1)
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 120,
                    margin: EdgeInsets.only(left: 20),
                    child: ListView.builder(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (Context, index) {
                          return Container(
                            margin: EdgeInsets.only(right: 20),
                            child: Column(
                              children: [
                                Container(
                                  //margin: EdgeInsets.only(right:50),
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "img/" + images.keys.elementAt(index)),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Container(
                                  child: AppText(
                                    text: images.values.elementAt(index),
                                    color: AppColors.textColor2,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              ),
            );
          default:
            return Container();
        }
      },
    );
  }
}

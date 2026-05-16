import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_mvvm/data/response/status.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view_models/controller/home/home_view_models.dart';

import 'package:getx_mvvm/view_models/controller/user_preference/user_prefrence_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final homeController = Get.put(HomeController());
  UserPreference userPreference = UserPreference();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  actions: [
    IconButton(onPressed: (){
userPreference.removeUser().then((value){Get.toNamed(RoutesName.LoginView);
});
    }, icon: Icon(Icons.logout))
  ],
),
      body: Obx((){
        switch(homeController.rxRequestStatus.value){
          case Status.LOADING:
            return Center(child: CircularProgressIndicator());
          case Status.ERROR:
            return Text('Something went wrong');
          case Status.COMPLETED:
            return ListView.builder(itemCount: homeController.userList.value.data!.length,
                    itemBuilder: (context, index){
              return Card(
                child: ListTile(
                  title: Text(homeController.userList.value.data![index].firstName.toString()),
                  subtitle: Text(homeController.userList.value.data![index].firstName.toString()),
                ),
              );

            });

        }
        return SizedBox();
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mvvm/data/response/status.dart';

import 'package:mvvm/utilities/routes/routes_name.dart';

import 'package:mvvm/view_model/services/home_view_model.dart';
import 'package:mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewViewModel homeViewViewModel = HomeViewViewModel();

  @override
  void initState() {
    homeViewViewModel.fetchUserListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userPreference = Provider.of<UserViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Users List'),
          centerTitle: true,
          actions: [
            InkWell(
                onTap: () {
                  userPreference.remove().then((value) {
                    Navigator.pushReplacementNamed(context, RoutesName.login);
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [Icon(Icons.logout), Text('Logout')],
                )),
            SizedBox(
              width: 20,
            )
          ],
        ),
        backgroundColor: Color.fromARGB(255, 151, 105, 101),
        body: ChangeNotifierProvider<HomeViewViewModel>(
            create: ((context) => homeViewViewModel),
            child: Consumer<HomeViewViewModel>(
              builder: ((context, value, child) {
                switch (value.userList.status) {
                  case Status.LOADING:
                    return const Center(child: CircularProgressIndicator());

                  case Status.ERROR:
                    return Center(
                        child: Text(value.userList.message.toString()));

                  case Status.COMPLETED:
                    return ListView.builder(
                        itemCount: value.userList.data!.user!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                child: Text(value.userList.data!.user![index].id
                                    .toString()),
                              ),
                              title: Text(value.userList.data!.user![index].name
                                  .toString()),
                              subtitle: Text(value
                                  .userList.data!.user![index].email
                                  .toString()),
                            ),
                          );
                        });
                }
                return Container();
              }),
            )));
  }
}

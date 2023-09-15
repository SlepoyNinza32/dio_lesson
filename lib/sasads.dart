import 'package:dio/dio.dart';
import 'package:dio_lesson/ApiModel.dart';
import 'package:flutter/material.dart';

class SendingPage extends StatefulWidget {
  const SendingPage({super.key});

  @override
  State<SendingPage> createState() => _SendingPageState();
}

class _SendingPageState extends State<SendingPage> {
  TextEditingController userInController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  Dio dio = Dio();

  //Future<ApiModel> api = ApiModel() as Future<ApiModel>;

  Future<List<ApiModel>> getData() async {
    var response = await dio.get(
      "https://58f6-84-54-115-212.ngrok-free.app/api/employees",
    );
    print(response.data);
    return listFromJson(response.data);
  }

  void sendData(
      String name, String email, String password, String phone) async {
    var response = await dio.post(
      "https://58f6-84-54-115-212.ngrok-free.app/api/employees",
      data: {
        //'id': id,
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      },
    );
    print(response.data);
  }void putData(
      String name, String email, String password, String phone) async {
    var response = await dio.put(
      "https://58f6-84-54-115-212.ngrok-free.app/api/employees/50",
      data: {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      },
    );
    print(response.data);
  }

  Future deletePost(int id) async {
    var res = await dio
        .delete("https://58f6-84-54-115-212.ngrok-free.app/api/employees/$id");

    if (res.statusCode == 200) {
      print("Deleted");
    } else {
      throw "Sorry! Unable to delete this post.";
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //sendData('Name', 'email@gmail.com', '11111111', '+phone');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
          return RefreshIndicator(
            color: Colors.teal,
            backgroundColor: Colors.transparent,
            onRefresh: () {
              setState(() {
                //return getData();

              },);
              return getData();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*0.9,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemBuilder: (context, index) => Container(
                      color: Colors.purpleAccent,
                      margin: EdgeInsets.all(8),
                      height: MediaQuery.of(context).size.height*0.2,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Text('id: ${snapshot.data![index].id}'),
                          Text('name: ${snapshot.data![index].name}'),
                          Text('email: ${snapshot.data![index].email}'),
                          Text('password: ${snapshot.data![index].password}'),
                          Text('phone: ${snapshot.data![index].phone}'),
                        ],
                      ),
                    ),
                    itemCount: snapshot.data!.length,
                  ),
                ),
                MaterialButton(
                  color: Colors.teal,
                  height: MediaQuery.of(context).size.height*0.1,
                  minWidth: MediaQuery.of(context).size.width,
                  onPressed: () {
                    setState(
                      () {
                        putData('name', 'email@gmail.com', 'password', 'phone');
                      },
                    );
                  },
                  child: Text('send'),
                ),
              ],
            ),
          );}
          else{
            return Center(child: CircularProgressIndicator(color: Colors.teal,));
          }
        },
      ),
    );
  }
}

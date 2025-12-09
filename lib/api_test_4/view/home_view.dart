import 'package:api/api_test_4/model/multi_data_api.dart';
import 'package:api/api_test_4/services/api_services.dart';
import 'package:flutter/material.dart';

class HomeView4 extends StatefulWidget {
  const HomeView4({super.key});

  @override
  State<HomeView4> createState() => _HomeView4State();
}

class _HomeView4State extends State<HomeView4> {

  MultiData multiData = MultiData();
  bool isReady = false;
  _getMultiData(){
     isReady = true;
    ApiServices4().getMultiDataWithModel().then((value){
      setState(() {
        multiData = value!;
         isReady = false;
      });
    }).onError((error, stackTrack){
      print(error);
    });
  }

  @override
  void initState() {
    _getMultiData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Multi Data Api'),backgroundColor: Colors.deepOrange),

      body: isReady == true
        ? const Center(child: CircularProgressIndicator())
        :Column(
        children: [
          Text(multiData.page.toString(), style: const TextStyle(color: Colors.teal, fontSize: 18),),
          Text(multiData.total.toString(), style: const TextStyle(color: Colors.teal, fontSize: 18),),
          Text(multiData.totalPages.toString(), style: const  TextStyle(color: Colors.teal, fontSize: 18),),
          Text(multiData.support!.text.toString(), style: const TextStyle(color: Colors.teal, fontSize: 18),),
          Expanded(
            child: ListView.builder(
              itemCount: multiData.data!.length,
              itemBuilder: (_, i){
                return Card(
                  child: ListTile(
                    title: Text(multiData.data![i].name.toString()),
                    subtitle: Text(multiData.data![i].pantoneValue.toString()),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

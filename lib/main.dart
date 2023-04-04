import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Slidable Listview'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<String> dataList=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataList.add("Monday");
    dataList.add("Tuesday");
    dataList.add("Wedensday");
    dataList.add("Thursday");
    dataList.add("Friday");
    dataList.add("Saturday");
    dataList.add("Sunday");
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child:ListView.builder(
          itemCount: dataList.length,
          itemBuilder: (BuildContext context, int index) {
          return Slidable(
            key: ValueKey(index),
            startActionPane: ActionPane(
              motion: ScrollMotion(),
              dismissible: DismissiblePane(onDismissed: (){
              },),
              children: [
                SlidableAction(onPressed: (_){
                  setState(() {
                    dataList.removeAt(index);
                  });
                },backgroundColor: Colors.red,foregroundColor: Colors.white,icon: Icons.delete,label: "Delete",)
              ],
            ),
            endActionPane: ActionPane(
              motion: ScrollMotion(),
              dismissible: DismissiblePane(onDismissed: (){},),
              children: [
                SlidableAction(onPressed: (_){},backgroundColor: Colors.green,foregroundColor: Colors.white,icon: Icons.share,label: "Share",)
              ],
            ),
            child: ListTile(title: Text(dataList[index]),),
          );
        },),
      ),
    );
  }
}

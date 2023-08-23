
// ignore_for_file: prefer_const_constructors



import 'package:e_commerce_app_ui/provider/data_class.dart';
import 'package:e_commerce_app_ui/provider/focus_node.dart';
import 'package:e_commerce_app_ui/routes.dart';
import 'package:e_commerce_app_ui/screens/profile_screen/profile_screen.dart';
import 'package:e_commerce_app_ui/screens/splash/splash_screen.dart';
import 'package:e_commerce_app_ui/screens/test.dart';
import 'package:e_commerce_app_ui/size_config.dart';
import 'package:e_commerce_app_ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=>DataClass(),),
    Provider(create: (context)=>MyProviderController()),
  ],child: const MyApp(),));
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-commerce UI',
        theme:theme(),
        home:ProfileScreen(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}

class ProviderDemoScreen extends StatefulWidget {
  const ProviderDemoScreen({Key? key}) : super(key: key);

  @override
  _ProviderDemoScreenState createState() => _ProviderDemoScreenState();
}

class _ProviderDemoScreenState extends State<ProviderDemoScreen> {
  @override
  void initState() {
    super.initState();
    final postModel = Provider.of<DataClass>(context, listen: false);
    postModel.getPostData();
  }

  @override
  Widget build(BuildContext context) {
    final postModel = Provider.of<DataClass>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Demo"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: postModel.isLoadingToGetPostsData?Center(
          child: Container(
            child: SpinKitThreeBounce(
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: index.isEven ? Colors.red : Colors.green,
                  ),
                );
              },
            ),
          ),
        ):postModel.isSuccessGettingPostsData?Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 40, bottom: 20),
                child: Text(
                  postModel.postModel?.title ?? "",
                  style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Container(
                child: Text(postModel.postModel?.body ?? ""),
              )
            ],
          ),
        ):Center(child: Text("try another time",style: TextStyle(fontSize: 30),),),
      ),
    );
  }
}

class MyProvider extends StatelessWidget {
  const MyProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         Consumer<MyProviderController>(builder: (context,myProvider, child){
           return  Center(child: Text("current value is ${myProvider.val}"),);
         }),

          TextButton(onPressed: (){
            Provider.of<MyProviderController>(context, listen: false).incrementVal();

          }, child: const Text("tap me"))
        ],
      ),
    );
  }
}
class MyProviderWithValueNotifier extends StatelessWidget {
  const MyProviderWithValueNotifier({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    MyProviderControllerWithValueNotifier counter = MyProviderControllerWithValueNotifier(0);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         ValueListenableBuilder(builder: (context,myProvider, child){
           return  Center(child: Text("current value is ${myProvider}"),);
         },valueListenable:counter),

          TextButton(onPressed: (){
            counter.incrementVal();

          }, child: const Text("tap me"))
        ],
      ),
    );
  }
}

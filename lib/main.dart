import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_overview_06/model/dogs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Dog>(
      create: (context) => Dog(name: 'dog5', breed: 'breed05'),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Provider Overview 05',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider 05'),
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
             Text('- name: ${context.watch<Dog>().name}', style: TextStyle(fontSize: 20.0,),),
             const SizedBox( height: 20.0,),
             BreedAndAge(),
          ],
        ),
      ),
    );
  }
}

class BreedAndAge extends StatelessWidget {
  const BreedAndAge({super.key,});

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
              Text('- breed: ${context.select<Dog, String>((Dog dog) => dog.breed)}', style: TextStyle(fontSize: 20.0,),),
             const SizedBox( height: 20.0,),
             Age(),
          ],
        ),
    );
  }
}

class Age extends StatelessWidget {
  const Age({super.key,});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
             Text('- age: ${context.select<Dog, int>((Dog dog) => dog.age)}', style: const TextStyle(fontSize: 20.0,),),
             const SizedBox(height: 20.0,),
              ElevatedButton(onPressed: () => context.read<Dog>().grow(), 
              child: const Text('Grow', style:  TextStyle(fontSize: 20.0,),),),

          ],
        ),
    );
  }
}
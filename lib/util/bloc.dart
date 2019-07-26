import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BlocProvider extends StatelessWidget {
  List<ChangeNotifier> blocs;
  Widget child;
  BlocProvider({Key key, @required this.blocs, this.child}):super(key:key);


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: blocs.map((bloc) {
        return ChangeNotifierProvider.value(
          value: bloc,
        );
      }).toList(),
      child: child,
    );
  }
}
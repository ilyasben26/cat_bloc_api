import 'dart:developer';

import '../bloc/bloc/cat_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetButton extends StatelessWidget {
  final bool isActive;

  const ResetButton({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: isActive
          ? () {
              BlocProvider.of<CatBloc>(context).add(LoadApiEvent());
              log("button pressed");
            }
          : () {},
      color: Colors.white60,
      child: const Text(
        'New Cat',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}

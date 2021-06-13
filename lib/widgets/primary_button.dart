import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moscow/modules/app/bloc/loading_cubit.dart';
import 'package:moscow/styles/colors.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool loading;
  final Widget child;
  final Color? color;
  PrimaryButton(
      {Key? key,
      this.onPressed,
      this.loading = false,
      required this.child,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: onPressed != null ? primaryGradient : null,
          color: onPressed == null ? secondaryWhite : null,
          borderRadius: BorderRadius.circular(12)),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            padding: const EdgeInsets.all(10), primary: Colors.transparent),
        child: Center(child: BlocBuilder<LoadingCubit, bool>(
          builder: (context, state) {
            if (state) {
              return SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 1,
                  backgroundColor: Colors.white,
                ),
              );
            }
            return DefaultTextStyle(
              child: child,
              style: TextStyle(color: Colors.black, fontSize: 16),
            );
          },
        )),
      ),
    );
  }
}

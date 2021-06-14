import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moscow/modules/app/bloc/loading_cubit.dart';
import 'package:moscow/styles/colors.dart';
import 'package:moscow/widgets/shimmers/container.dart';
import 'package:shimmer/shimmer.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final bool? loading;
  final Color? color;
  PrimaryButton({
    Key? key,
    this.onPressed,
    required this.child,
    this.color,
    this.loading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadingCubit, bool>(
      builder: (context, state) {
        final _loading = state || (loading ?? false);
        return AnimatedContainer(
            duration: Duration(milliseconds: 200),
            decoration: BoxDecoration(
                gradient: onPressed != null && color == null && !_loading
                    ? primaryGradient
                    : null,
                color: secondaryWhite,
                borderRadius: BorderRadius.circular(16)),
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 200),
              child: _loading
                  ? Stack(
                      children: [
                        ContainerShimmer(
                          height: 50,
                        ),
                        Positioned.fill(
                          child: Center(
                            child: DefaultTextStyle(
                              child: child,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ),
                        )
                      ],
                    )
                  : Container(
                      height: 50,
                      child: Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(16),
                          onTap: _loading ? null : onPressed,
                          child: Center(child: BlocBuilder<LoadingCubit, bool>(
                            builder: (context, state) {
                              return DefaultTextStyle(
                                child: child,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              );
                            },
                          )),
                        ),
                      ),
                    ),
            ));
      },
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moscow/domain/models/project.dart' as models;
import 'package:moscow/domain/models/user.dart';
import 'package:moscow/modules/home/screens/profile/widgets/skills_widget.dart';
import 'package:moscow/modules/start_team/bloc/project_cubit.dart';
import 'package:moscow/modules/start_team/bloc/project_state.dart';
import 'package:moscow/styles/colors.dart';
import 'package:moscow/widgets/primary_icon_button.dart';
import 'package:moscow/widgets/shimmers/container.dart';
import 'package:moscow/widgets/widgets.dart';
import 'package:shimmer/shimmer.dart';

const double _kMinFlingVelocity = 700.0;
const double _kMinFlingVelocityDelta = 400.0;
const double _kFlingVelocityScale = 1.0 / 300.0;
const double _kDismissThreshold = 0.4;

class SwipeView extends StatefulWidget {
  const SwipeView({Key? key, required this.project}) : super(key: key);

  final models.Project project;

  @override
  _SwipeViewState createState() => _SwipeViewState();
}

class _SwipeViewState extends State<SwipeView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: Text(widget.project.name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          BlocBuilder<ProjectCubit, ProjectState>(
            builder: (context, state) {
              final s = state as ProjectStateLoaded;
              final p = [...s.myProjects, ...s.projects]
                  .firstWhere((element) => element.id == widget.project.id);

              if (p.state == models.ProjectState.loading) {
                return ContainerShimmer(
                  height: 350,
                );
              }
              if (p.state == models.ProjectState.loaded) {
                print('applicants');
                print(p.applicants);
                return Container(
                  child: SwipeCards(
                    onLiked: (index) {
                      context
                          .read<ProjectCubit>()
                          .acceptRequest(p, p.applicants![index]);
                    },
                    onDismissed: (index) {
                      context
                          .read<ProjectCubit>()
                          .removeRequest(p, p.applicants![index]);
                    },
                    width: MediaQuery.of(context).size.width,
                    itemsCount: p.applicants!.length,
                    builder: (context, index) => Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: UserSwipeCard(
                        user: p.applicants![index],
                        skills: p.skills ?? [],
                      ),
                    ),
                  ),
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}

class SwipeCards extends StatefulWidget {
  SwipeCards(
      {Key? key,
      required this.builder,
      required this.itemsCount,
      required this.width,
      required this.onLiked,
      required this.onDismissed})
      : super(key: key);

  final IndexedWidgetBuilder builder;
  final int itemsCount;
  final double width;
  final ValueChanged<int> onLiked;
  final ValueChanged<int> onDismissed;

  @override
  _SwipeCardsState createState() => _SwipeCardsState();
}

class _SwipeCardsState extends State<SwipeCards> with TickerProviderStateMixin {
  int _index = 0;
  late AnimationController _moveController;
  late AnimationController _opactiryController;
  late Animation<Offset> _moveAnimation;
  late Animation<double> _rotationAnimation;
  bool _dragUnderway = false;

  double _dragExtent = 0.0;
  bool _completed = false;

  @override
  void initState() {
    super.initState();
    if (widget.itemsCount == 0) {
      setState(() {
        _completed = true;
      });
    }
    _opactiryController = AnimationController(
      value: 1,
      vsync: this,
      duration: Duration(milliseconds: 200),
    )..addStatusListener((status) {
        if (status == AnimationStatus.reverse) {
          _opactiryController.forward();
        }
        if (status == AnimationStatus.completed) {
          context.read<ProjectCubit>();
        }
      });
    _moveController =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this)
          ..addStatusListener(_handleDismissStatusChanged);
    _updateMoveAnimation();
    _updateDragAnimation();
  }

  bool get _canDrag => _dragUnderway;

  void _handleDragStart(DragStartDetails details) {
    _dragUnderway = true;
    if (_moveController.isAnimating) {
      _dragExtent =
          _moveController.value * _overallDragAxisExtent * _dragExtent.sign;
      _moveController.stop();
    } else {
      _dragExtent = 0.0;
      _moveController.value = 0.0;
    }
    setState(() {
      _updateMoveAnimation();
      _updateDragAnimation();
    });
  }

  double get _overallDragAxisExtent {
    final Size size = context.size!;
    return size.height;
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    if (_moveController.isAnimating) {
      return;
    }
    // Dismissible

    final delta = details.primaryDelta!;
    final oldDragExtent = _dragExtent;
    _dragExtent += delta;
    if (oldDragExtent.sign != _dragExtent.sign) {
      if (_canDrag) {
        setState(() {
          _updateMoveAnimation();
        });
      }
    }
    _updateDragAnimation();
    if (!_moveController.isAnimating) {
      _moveController.value = _dragExtent.abs() / _overallDragAxisExtent;
    }
  }

  _FlingGestureKind _describeFlingGesture(Velocity velocity) {
    if (_dragExtent == 0.0) {
      return _FlingGestureKind.none;
    }
    final vx = velocity.pixelsPerSecond.dx;
    final vy = velocity.pixelsPerSecond.dy;
    DismissDirection flingDirection;
    if (vy.abs() - vx.abs() < _kMinFlingVelocityDelta ||
        vy.abs() < _kMinFlingVelocity) {
      return _FlingGestureKind.none;
    }
    assert(vy != 0.0);
    flingDirection = _extentToDirection(vy);
    if (flingDirection == _dismissDirection) {
      return _FlingGestureKind.forward;
    }
    return _FlingGestureKind.reverse;
  }

  DismissDirection _extentToDirection(double extent) {
    if (extent == 0.0) {
      return DismissDirection.none;
    }
    return extent > 0 ? DismissDirection.down : DismissDirection.up;
  }

  DismissDirection get _dismissDirection => _extentToDirection(_dragExtent);

  void _handleDragEnd(DragEndDetails details) {
    if (_moveController.isAnimating) {
      return;
    }
    _dragUnderway = false;
    final flingVelocity = details.velocity.pixelsPerSecond.dy;
    switch (_describeFlingGesture(details.velocity)) {
      case _FlingGestureKind.forward:
        assert(_dragExtent != 0.0);
        assert(!_moveController.isDismissed);
        print('forward');
        if ((_kDismissThreshold) >= 1.0) {
          _moveController.reverse();
          _opactiryController.reverse();
          break;
        }
        _dragExtent = flingVelocity.sign;
        _moveController.fling(
            velocity: flingVelocity.abs() * _kFlingVelocityScale);
        break;
      case _FlingGestureKind.reverse:
        assert(_dragExtent != 0.0);
        assert(!_moveController.isDismissed);
        print('backward');
        _dragExtent = flingVelocity.sign;
        _moveController.fling(
            velocity: -flingVelocity.abs() * _kFlingVelocityScale);
        break;
      case _FlingGestureKind.none:
        if (!_moveController.isDismissed) {
          print('none');
          if (_moveController.value > (_kDismissThreshold)) {
            _moveController.forward();
            _opactiryController.reverse();
          } else {
            _moveController.reverse();
          }
        }
        break;
    }
  }

  void _handleDismissStatusChanged(AnimationStatus status) {
    if (status == AnimationStatus.forward) {}
    if (status == AnimationStatus.completed) {
      if (_dragExtent.sign < 0) {
        widget.onDismissed(_index);
      } else {
        widget.onLiked(_index);
      }
      if (_index == widget.itemsCount - 1) {
        setState(() {
          _completed = true;
        });
        return;
      }
      _dragExtent = 0.0;
      _moveController.value = 0.0;
      setState(() {
        _index = _index + 1;
        _updateMoveAnimation();
      });
    }
  }

  void _updateDragAnimation() {
    _rotationAnimation = _moveController.drive(
        Tween<double>(begin: 0, end: _dragExtent.sign / widget.width * 8));
  }

  void _updateMoveAnimation() {
    final end = _dragExtent.sign;
    // _rotationAnimation = _moveController
    //     .drive(Tween<double>(begin: 0, end: _dragExtent / widget.width * 2));
    _moveAnimation = _moveController.drive(
      Tween<Offset>(
        begin: Offset.zero,
        end: Offset(end, 0.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_completed) {
      return Center(
        child: Text('Вы посмотрели все заявки'),
      );
    }
    return GestureDetector(
      onHorizontalDragStart: _handleDragStart,
      onHorizontalDragUpdate: _handleDragUpdate,
      onHorizontalDragEnd: _handleDragEnd,
      child: Stack(children: [
        if (_index + 1 < widget.itemsCount) widget.builder(context, _index + 1),
        FadeTransition(
          opacity: _opactiryController,
          child: SlideTransition(
            position: _moveAnimation,
            child: RotationTransition(
              turns: _rotationAnimation,
              child: widget.builder(context, _index),
            ),
          ),
        ),
      ]),
    );
  }
}

class UserSwipeCard extends StatelessWidget {
  const UserSwipeCard({Key? key, required this.user, required this.skills})
      : super(key: key);
  final User user;
  final List<String> skills;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: primaryShadow,
          borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ImageCard(
              width: null,
              height: 200,
              editable: false,
              imageUrl: user.photoUrl,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(user.name, style: TextStyle(fontSize: 22)),
              ),
            ),
            Text(user.about ??
                'Талантливый, успешный, обеспеченный и амбициозный разработчик крутых проектов, а главное - очень скромный!'),
            ProjectSkillsWidget(
              skills: user.skills,
              hightlight: skills,
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PrimaryIconButton(
                    decorate: false,
                    icon: Icons.close,
                    onPressed: () {},
                    size: 32),
                PrimaryIconButton(
                    icon: Icons.person_add, onPressed: () {}, size: 32)
              ],
            )
          ],
        ),
      ),
    );
  }
}

enum _FlingGestureKind { none, forward, reverse }

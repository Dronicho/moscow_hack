import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:moscow/domain/models/user.dart';
import 'package:moscow/domain/services/api.dart';
import 'package:moscow/modules/app/bloc/loading_cubit.dart';
import 'package:moscow/styles/colors.dart';
import 'package:moscow/widgets/widgets.dart';

typedef LikedFunction = void Function(bool, bool, bool);

class LikeModal extends StatefulWidget {
  const LikeModal({
    Key? key,
    required this.onPressed,
    required this.user,
    this.allowLeadership = true,
  }) : super(key: key);

  final LikedFunction onPressed;
  final User user;
  final bool allowLeadership;

  @override
  _LikeModalState createState() => _LikeModalState();
}

class _LikeModalState extends State<LikeModal> {
  bool _satisfied = false;
  bool _competent = false;
  bool _leadership = false;
  final _api = GetIt.I<Api>();
  late UserStats _stats;

  @override
  void initState() {
    super.initState();
    _stats = widget.user.stats;
  }

  Future<void> _like() async {
    context.read<LoadingCubit>().startLoading();
    if (_satisfied)
      await _api.client
          .post(Uri.parse(_api.baseUrl + '/user/${widget.user.id}/stats/friendly'));
    if (_competent)
      await _api.client
          .post(Uri.parse(_api.baseUrl + '/user/${widget.user.id}/stats/competent'));
    if (_leadership)
      await _api.client
          .post(Uri.parse(_api.baseUrl + '/user/${widget.user.id}/stats/leadership'));
    context.read<LoadingCubit>().stopLoading();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
        child: Container(
          height: 240,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Похвалить',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500)),
                        Text(widget.user.name, style: TextStyle(fontSize: 12))
                      ],
                    ),
                    Text('в i.moscow с 15.05.2021')
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        PrimaryIconButton(
                            size: 36,
                            decorate: _satisfied,
                            onPressed: () {
                              setState(() {
                                _satisfied = !_satisfied;
                                _stats = _stats.copyWith(
                                    friendly: widget.user.stats.friendly +
                                        (_satisfied ? 1 : 0));
                              });
                            },
                            icon: Icons.sentiment_satisfied_alt),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(_stats.friendly.toString()),
                        ),
                        Text('Дружелюбен', style: TextStyle(fontSize: 12))
                      ],
                    ),
                    Column(
                      children: [
                        PrimaryIconButton(
                            size: 36,
                            decorate: _competent,
                            onPressed: () {
                              setState(() {
                                _competent = !_competent;
                                _stats = _stats.copyWith(
                                    competent: widget.user.stats.competent +
                                        (_competent ? 1 : 0));
                              });
                            },
                            icon: Icons.school),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(_stats.competent.toString()),
                        ),
                        Text('Компетентен', style: TextStyle(fontSize: 12))
                      ],
                    ),
                    Opacity(
                      opacity: widget.allowLeadership ? 1 : 0.3,
                      child: Column(
                        children: [
                          IgnorePointer(
                            ignoring: !widget.allowLeadership,
                            child: PrimaryIconButton(
                                size: 36,
                                decorate: _leadership,
                                onPressed: () {
                                  setState(() {
                                    _leadership = !_leadership;
                                    _stats = _stats.copyWith(
                                        leadership:
                                            widget.user.stats.leadership +
                                                (_leadership ? 1 : 0));
                                  });
                                },
                                icon: Icons.groups),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(_stats.leadership.toString()),
                          ),
                          Text('Хороший лидер', style: TextStyle(fontSize: 12))
                        ],
                      ),
                    )
                  ],
                ),
                PrimaryButton(
                  child: Text('Похвалить'),
                  onPressed: _leadership || _competent || _satisfied
                      ? () async {
                          await _like();
                          Navigator.of(context).pop();
                        }
                      : null,
                )
              ],
            ),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: Colors.white),
        ),
      ),
    );
  }
}

class ErrorModal extends StatelessWidget {
  const ErrorModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
        child: Container(
          height: 160,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: Center(
                    child: Text('Нечестно!',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500))),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: PrimaryButton(
                  color: secondaryWhite,
                  child: Text('Понятно'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: Colors.white),
        ),
      ),
    );
  }
}

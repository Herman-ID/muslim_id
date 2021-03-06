import 'package:flutter/material.dart';
import 'package:muslim_id/egg_timer/egg_timer.dart';
import 'package:muslim_id/egg_timer/egg_timer_button.dart';
import 'package:muslim_id/egg_timer/egg_timer_controls.dart';
import 'package:muslim_id/egg_timer/egg_timer_dial.dart';
import 'package:muslim_id/egg_timer/egg_timer_time_display.dart';
import 'package:flutter/material.dart';
import 'package:fluttery/framing.dart';

final Color GRADIENT_TOP = const Color(0xFFF5F5F5);
final Color GRADIENT_BOTTOM = const Color(0xFFE8E8E8);

class HomePage extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<HomePage> {
  EggTimer eggTimer;

  _MyAppState() {
    eggTimer = new EggTimer(
      maxTime: const Duration(minutes: 35),
      onTimerUpdate: _onTimerUpdate,
    );
  }

  _onTimeSelected(Duration newTime) {
    setState(() {
      eggTimer.currentTime = newTime;
    });
  }

  _onDialStopTurning(Duration newTime) {
    setState(() {
      eggTimer.currentTime = newTime;
      eggTimer.resume();
    });
  }

  _onTimerUpdate() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
          child: new Center(
            child: new Column(
              children: [
                new EggTimerTimeDisplay(
                  eggTimerState: eggTimer.state,
                  selectionTime: eggTimer.lastStartTime,
                  countdownTime: eggTimer.currentTime,
                ),
                new EggTimerDial(
                  eggTimerState: eggTimer.state,
                  currentTime: eggTimer.currentTime,
                  maxTime: eggTimer.maxTime,
                  ticksPerSection: 5,
                  onTimeSelected: _onTimeSelected,
                  onDialStopTurning: _onDialStopTurning,
                ),
                new Expanded(child: new Container()),
                new EggTimerControls(
                  eggTimerState: eggTimer.state,
                  onPause: () {
                    setState(() => eggTimer.pause());
                  },
                  onResume: () {
                    setState(() => eggTimer.resume());
                  },
                  onRestart: () {
                    setState(() => eggTimer.restart());
                  },
                  onReset: () {
                    setState(() => eggTimer.reset());
                  },
                ),
              ],
            ),
          ),
    );
  }
}

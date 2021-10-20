import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro_mobx/components/cronometro.dart';
import 'package:pomodoro_mobx/components/entrada_tempo.dart';
import 'package:pomodoro_mobx/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class Pomodoro extends StatefulWidget {
  const Pomodoro({Key? key}) : super(key: key);

  @override
  State<Pomodoro> createState() => _PomodoroState();
}

class _PomodoroState extends State<Pomodoro> {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return Scaffold(
      body: SafeArea(
        top: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Expanded(
              child: Cronometro(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Observer(
                builder: (_) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    EntradaTempo(
                      titulo: "Trabalho",
                      valor: store.tempoTrabalho,
                      inc: store.iniciado && store.estaTrabalhando()
                          ? null
                          : store.incrementarTempoTrabalho,
                      dec: store.iniciado && store.estaTrabalhando()
                          ? null
                          : store.decrementarTempoTrabalho,
                    ),
                    EntradaTempo(
                      titulo: "Descanso",
                      valor: store.tempoDescanso,
                      inc: store.iniciado && store.estaDescansando()
                          ? null
                          : store.incrementarTempoDescanso,
                      dec: store.iniciado && store.estaDescansando()
                          ? null
                          : store.decrementarTempoDescanso,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

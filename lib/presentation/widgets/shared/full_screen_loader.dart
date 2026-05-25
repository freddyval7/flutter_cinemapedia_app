import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    final messages = <String>[
      "Cargando películas",
      "Comprando palomitas de maíz",
      "Cargando populares",
      "Llamando a la novia",
      "La espera es una virtud...",
      "Ya casi...",
      "Por qué está tardando tanto :(",
    ];

    Stream<String> getLoadingMessages() {
      return Stream.periodic(Duration(milliseconds: 1200), (step) {
        return messages[step];
      }).take(messages.length);
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Espere"),
          SizedBox(height: 10),
          CircularProgressIndicator(strokeWidth: 4),
          SizedBox(height: 15),
          StreamBuilder(
            stream: getLoadingMessages(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Text("Cargando...");

              return Text(snapshot.data!);
            },
          ),
        ],
      ),
    );
  }
}

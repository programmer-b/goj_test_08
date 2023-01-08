import 'package:flutter/material.dart';
import 'package:goj_test_08/extensions.dart';
import 'package:goj_test_08/state.dart';
import 'package:goj_test_08/web_component.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppState>(
      create: (context) => AppState(),
      child: MaterialApp(
        title: 'goj_test_08',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: const MyHomePage(title: 'Goojara'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final url = context.watch<AppState>().ifUrl;
    final appstate = context.watch<AppState>();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  child: const Text('show web'),
                  onPressed: () => showDialog(
                      context: context,
                      builder: (context) => const WebComponent(
                          url: 'https://www.goojara.to/mqGZk5'))),
              8.height,
              if (url.isNotEmpty)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(url).paddingAll(8),
                    8.height,
                    appstate.loading
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: () => appstate.grdurl(),
                            child: const Text('load grabd url')),
                    8.height,
                    if (appstate.grdUrl != null)
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(appstate.grdUrl!.grdurl).paddingAll(8),
                          8.height,
                          appstate.loading
                              ? const CircularProgressIndicator()
                              : ElevatedButton(
                                  onPressed: () => appstate.getMstUrl(),
                                  child: const Text('load master url')),
                          8.height,
                          if (appstate.masterUrl != null)
                            Text(appstate.masterUrl!).paddingAll(8),
                        ],
                      ),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/add_album/add_album_bloc.dart';

class AddAlbumPage extends StatefulWidget {
  const AddAlbumPage({super.key});

  @override
  State<AddAlbumPage> createState() => _AddAlbumPageState();
}

class _AddAlbumPageState extends State<AddAlbumPage> {
  late TextEditingController controller;
  late AddAlbumBloc bloc;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: '');
    bloc = sl.get<AddAlbumBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add Album'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            TextFormField(
              controller: controller,
              decoration: const InputDecoration(hintText: 'Enter title'),
            ),
            const SizedBox(
              height: 20,
            ),
            BlocListener<AddAlbumBloc, AddAlbumState>(
                bloc: bloc,
                listenWhen: (previousState, state) {
                  return state is AlbumSuccessState || state is AlbumErrorState;
                },
                listener: (_, state) {
                  if (state is AlbumErrorState) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Dialog Title'),
                          content: Text(state.err),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Close'),
                            ),
                          ],
                        );
                      },
                    );
                  } else if (state is AlbumSuccessState) {
                    Navigator.pop(context, "result");
                  }
                },
                child: MaterialButton(
                  onPressed: () {
                    bloc.add(SubmitAddAlbumEvent(controller.text));
                  },
                  minWidth: double.infinity,
                  color: Colors.cyan,
                  child: const Text('Submit'),
                ))
          ],
        ),
      ),
    );
  }
}

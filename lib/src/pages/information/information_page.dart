import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prova_flutter/src/controllers/task_mobx.dart';
import 'package:prova_flutter/src/core/styles/colors_app.dart';
import 'package:prova_flutter/src/core/styles/text_styles.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController editController = TextEditingController();
  final TaskMobx taskMobx = TaskMobx();

  Future<void> _showEditDialog(BuildContext context,
      {required String title,
      String? labelText,
      required int index,
      TextEditingController? controller,
      required bool isDelete,
      void Function()? onPressed}) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: context.textStyles.textLight.copyWith(
              color: context.colors.secondary,
              fontSize: 16,
            ),
          ),
          content: isDelete
              ? Text(
                  "Deseja realmente excluir a tarefa?",
                  style: context.textStyles.textLight.copyWith(
                    color: context.colors.secondary,
                    fontSize: 16,
                  ),
                )
              : TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                    labelText: labelText,
                    labelStyle: context.textStyles.textLight.copyWith(
                      color: context.colors.greyAux,
                      fontSize: 12,
                    ),
                  ),
                ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancelar',
                style: context.textStyles.textLight.copyWith(
                  color: context.colors.secondary,
                  fontSize: 16,
                ),
              ),
            ),
            TextButton(
              onPressed: onPressed,
              child: isDelete
                  ? Text(
                      'Excluir',
                      style: context.textStyles.textLight.copyWith(
                        color: context.colors.secondary,
                        fontSize: 16,
                      ),
                    )
                  : Text(
                      "Salvar",
                      style: context.textStyles.textLight.copyWith(
                        color: context.colors.secondary,
                        fontSize: 16,
                      ),
                    ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            context.colors.backgroundLinearOne,
            context.colors.backgroundLinearTwo,
            context.colors.backgroundLinearThree,
          ],
        )),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Observer(
                  builder: (context) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: taskMobx.tasks.length,
                      itemBuilder: (context, index) {
                        final task = taskMobx.tasks[index];
                        return Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(task),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        Icons.edit,
                                        color: context.colors.secondary,
                                      ),
                                      onPressed: () => _showEditDialog(
                                        context,
                                        title: "Editar tarefa",
                                        labelText: "edite sua tarefa",
                                        index: index,
                                        controller: editController,
                                        isDelete: false,
                                        onPressed: () {
                                          final updatedTask =
                                              editController.text;
                                          if (updatedTask.isNotEmpty) {
                                            taskMobx.editTask(
                                                index, updatedTask);
                                            editController.clear();
                                            Navigator.of(context).pop();
                                          }
                                        },
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.close,
                                        color: context.colors.redAux,
                                      ),
                                      onPressed: () => _showEditDialog(
                                        context,
                                        title: "Excluir tarefa",
                                        index: index,
                                        isDelete: true,
                                        onPressed: () {
                                          taskMobx.removeTask(index);
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              taskMobx.tasks.length - 1 == index
                                  ? const SizedBox.shrink()
                                  : Divider(
                                      color: context.colors.greyAux,
                                      endIndent: 10,
                                      indent: 10,
                                    ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _textController,
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            label: Center(
                              child: Text(
                                "Digite seu texto",
                                style: context.textStyles.textLight.copyWith(
                                  color: context.colors.secondary,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          onFieldSubmitted: (value) {
                            final taskText = _textController.text;
                            if (taskText.isNotEmpty) {
                              taskMobx.addTask(taskText);
                              _textController.clear();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

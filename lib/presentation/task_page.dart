import 'package:flutter/material.dart';
import 'package:my_weather_app/api/models/task_data.dart';
import 'package:my_weather_app/api/services/api_provider.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  bool isLoading = true;
  bool isError = false;
  late TaskData taskData;

  _init() async {
    try {
      isLoading = true;
      setState(() {});
      taskData = await ApiProvider.getTaskData();
      isLoading = false;
      isError = false;
      setState(() {});
    } catch (error) {
      isLoading = false;
      isError = true;
      setState(() {});
    }
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Task Screen"),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            _init();
          },
          child: Expanded(child: ListView(
            children: [
              isLoading
                  ? const Center(
                child: CircularProgressIndicator(),
              )
                  : isError
                  ? const Center(
                child: Text("error"),
              )
                  : Center(
                child: Text(taskData.countryName),
              ),
            ],
          ),)
        ));
  }
}

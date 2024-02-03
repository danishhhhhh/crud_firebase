import 'package:crud_project/todo_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TodoController controller = Get.put(TodoController());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              TextFormField(
                controller: controller.title,
                cursorColor: Colors.blueGrey,
                decoration: InputDecoration(
                  hintText: "Tambahkan Judul",
                  hintStyle: const TextStyle(color: Colors.grey),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.blueGrey, // Change the border color here
                      width: 2.0, // Change the border width here
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.blueGrey, // Change the border color here
                      width: 2.0, // Change the border width here
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.blueGrey, // Change the border color here
                      width: 2.0, // Change the border width here
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller.note,
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.blueGrey,
                              // Change the border color here
                              width: 2.0, // Change the border width here
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.blueGrey,
                              // Change the border color here
                              width: 2.0, // Change the border width here
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.blueGrey,
                              // Change the border color here
                              width: 2.0, // Change the border width here
                            ),
                          ),
                          hintText: "Tambahkan Catatan",
                          hintStyle: const TextStyle(color: Colors.grey)),
                      cursorColor: Colors.blueGrey,
                    ),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      controller.addTodo();
                    },
                    child: Container(
                      height: 48.5,
                      width: 48.5,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.done,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              const Text("ALL NOTES"),
              const SizedBox(height: 10),
              Expanded(
                child: Obx(
                  () => ListView(
                    children: controller.todoList
                        .map((e) => Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 25),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFFdbdbdb)
                                          .withOpacity(1),
                                      offset: const Offset(8, 8),
                                      blurRadius: 20,
                                      spreadRadius: -10,
                                    ),
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      e.title!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      e.note!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                InkWell(
                                    onTap: () {
                                      controller.deleteTodo(e.id!);
                                    },
                                    child: const Icon(Icons.delete)),
                                const SizedBox(width: 10),
                                InkWell(
                                  onTap: () {
                                    controller.updatedTitle.text = e.title!;
                                    controller.updatedNote.text = e.note!;
                                    Get.defaultDialog(
                                      title: "UPDATE TODO",
                                      titleStyle: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 0, horizontal: 30),
                                      backgroundColor: Colors.blueGrey,
                                      radius: 35,
                                      titlePadding:
                                          const EdgeInsets.only(top: 35),
                                      content: StatefulBuilder(
                                        builder: (BuildContext context,
                                            StateSetter setState) {
                                          return SizedBox(
                                            height: 200,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                TextFormField(
                                                  cursorColor: Colors.white,
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  controller:
                                                      controller.updatedTitle,
                                                  decoration: InputDecoration(
                                                      filled: true,
                                                      fillColor: Colors.white10,
                                                      contentPadding:
                                                          const EdgeInsets
                                                              .symmetric(
                                                              horizontal: 12),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        borderSide:
                                                            const BorderSide(
                                                          color: Colors.white,
                                                          width: 2,
                                                        ),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        borderSide:
                                                            const BorderSide(
                                                          color: Colors.white,
                                                          width: 2,
                                                        ),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        borderSide:
                                                            const BorderSide(
                                                          color: Colors.white,
                                                          width: 2,
                                                        ),
                                                      ),
                                                      hintText:
                                                          "Tambahkan Catatan",
                                                      hintStyle:
                                                          const TextStyle(
                                                              color:
                                                                  Colors.grey)),
                                                ),
                                                const SizedBox(height: 10),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: TextFormField(
                                                        cursorColor:
                                                            Colors.white,
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                        controller: controller
                                                            .updatedNote,
                                                        decoration:
                                                            InputDecoration(
                                                                filled: true,
                                                                fillColor: Colors
                                                                    .white10,
                                                                contentPadding:
                                                                    const EdgeInsets
                                                                        .symmetric(
                                                                        horizontal:
                                                                            12),
                                                                border:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 2,
                                                                  ),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 2,
                                                                  ),
                                                                ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 2,
                                                                  ),
                                                                ),
                                                                hintText:
                                                                    "Tambahkan Catatan",
                                                                hintStyle: const TextStyle(
                                                                    color: Colors
                                                                        .grey)),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        controller
                                                            .updateTodo(e);
                                                        Get.back();
                                                      },
                                                      child: Container(
                                                        height: 48.5,
                                                        width: 48.5,
                                                        decoration: BoxDecoration(
                                                            color: Colors
                                                                .transparent,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            border: Border.all(
                                                                color: Colors
                                                                    .white,
                                                                width: 2)),
                                                        child: const Icon(
                                                          Icons.done,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: const Icon(Icons.edit),
                                )
                              ]),
                            ))
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {},
        child: Icon(Icons.abc),
      ),
    );
  }
}

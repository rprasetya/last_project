// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ModalBottom extends StatelessWidget {
  ModalBottom({super.key});
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _readedPageController = TextEditingController();
  final TextEditingController _totalPageController = TextEditingController();

  final supabase = Supabase.instance.client;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          shadowColor: WidgetStateProperty.all<Color>(
              const Color.fromARGB(0, 255, 255, 255)),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          )),
          minimumSize: const WidgetStatePropertyAll(Size.fromHeight(170)),
          backgroundColor: WidgetStateProperty.all<Color>(
              const Color.fromARGB(255, 230, 230, 230)),
          foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
        ),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Column(
                  children: [
                    Container(
                      height: 3.5,
                      width: 27,
                      margin: const EdgeInsets.only(top: 3.5),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 169, 169, 169),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    const SizedBox(
                      height: 22.5,
                    ),
                    const Text(
                      'Add A New Book',
                      style:
                          TextStyle(fontSize: 15, fontFamily: 'Benzin-Medium'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      child: Form(
                          child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 15, right: 10),
                                child: const Icon(
                                  Icons.book_outlined,
                                  size: 40,
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  style: const TextStyle(fontSize: 13.5),
                                  controller: _titleController,
                                  decoration: const InputDecoration(
                                      hintText: 'Title',
                                      hintStyle: TextStyle(fontSize: 14)),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 15, right: 10),
                                child: const Icon(
                                  Icons.first_page_rounded,
                                  size: 40,
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  style: const TextStyle(fontSize: 13.5),
                                  keyboardType: TextInputType.number,
                                  controller: _readedPageController,
                                  decoration: const InputDecoration(
                                      hintText: 'Readed Pages',
                                      hintStyle: TextStyle(fontSize: 14)),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 15, right: 10),
                                child: const Icon(
                                  Icons.last_page_rounded,
                                  size: 40,
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  controller: _totalPageController,
                                  style: const TextStyle(fontSize: 13.5),
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                      hintText: 'Total Pages',
                                      hintStyle: TextStyle(fontSize: 14)),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                        style: ButtonStyle(
                                          padding: const WidgetStatePropertyAll(
                                              EdgeInsets.symmetric(
                                                  vertical: 17)),
                                          shape: WidgetStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          )),
                                          backgroundColor:
                                              WidgetStateProperty.all<Color>(
                                                  const Color.fromARGB(
                                                      255, 19, 19, 19)),
                                        ),
                                        onPressed: () => showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              if (_readedPageController
                                                      .text.isEmpty ||
                                                  _titleController
                                                      .text.isEmpty ||
                                                  _totalPageController
                                                      .text.isEmpty) {
                                                return CupertinoAlertDialog(
                                                  title:
                                                      const Text('Warning !'),
                                                  content: const Text(
                                                      'Fill All The Blank Form'),
                                                  actions: [
                                                    CupertinoDialogAction(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: const Text(
                                                          'Close',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 13.5),
                                                        ))
                                                  ],
                                                );
                                              } else if (int.parse(
                                                      _readedPageController
                                                          .text) >
                                                  int.parse(_totalPageController
                                                      .text)) {
                                                return CupertinoAlertDialog(
                                                  title: const Text('Warning!'),
                                                  content: const Text(
                                                      "Readed Pages can't be more than Total Pages"),
                                                  actions: [
                                                    CupertinoDialogAction(
                                                        child: TextButton(
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child: const Text(
                                                              'Close',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      13.5),
                                                            )))
                                                  ],
                                                );
                                              }
                                              return CupertinoAlertDialog(
                                                title: const Text('Accept?'),
                                                content: const Text(
                                                    'Do you accept the book?'),
                                                actions: [
                                                  CupertinoDialogAction(
                                                      child: TextButton(
                                                    child: const Text(
                                                      'Nope',
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  )),
                                                  CupertinoDialogAction(
                                                      child: TextButton(
                                                    child: const Text(
                                                      'Hell Yeah',
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                    onPressed: () async {
                                                      final auth =
                                                          supabase.auth;
                                                      final user =
                                                          await auth.getUser();
                                                      final userId =
                                                          user.user?.id;
                                                      await supabase
                                                          .from('books')
                                                          .insert({
                                                        'title':
                                                            _titleController
                                                                .text,
                                                        'readedPages': int.parse(
                                                            _readedPageController
                                                                .text),
                                                        'totalPages': int.parse(
                                                            _totalPageController
                                                                .text),
                                                        'isFinished': int.parse(
                                                                _totalPageController
                                                                    .text) ==
                                                            int.parse(
                                                                _readedPageController
                                                                    .text),
                                                        'userId': userId
                                                      });
                                                      showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return CupertinoAlertDialog(
                                                              title: const Text(
                                                                  'Success'),
                                                              content: const Text(
                                                                  'The book has been added!'),
                                                              actions: [
                                                                CupertinoDialogAction(
                                                                    child: TextButton(
                                                                        onPressed: () {
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                          DefaultTabController.of(context)
                                                                              .animateTo(1);
                                                                        },
                                                                        child: const Text(
                                                                          'Close',
                                                                          style:
                                                                              TextStyle(color: Colors.black),
                                                                        )))
                                                              ],
                                                            );
                                                          });
                                                    },
                                                  )),
                                                ],
                                              );
                                            }),
                                        child: const Text(
                                          'Add Book',
                                          style: TextStyle(
                                              fontFamily: 'Benzin',
                                              fontSize: 11.5,
                                              color: Colors.white),
                                        )),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 18,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                        style: ButtonStyle(
                                          padding: const WidgetStatePropertyAll(
                                              EdgeInsets.symmetric(
                                                  vertical: 17)),
                                          shape: WidgetStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          )),
                                          backgroundColor:
                                              WidgetStateProperty.all<Color>(
                                                  const Color.fromARGB(
                                                      255, 94, 0, 0)),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text(
                                          'Cancel',
                                          style: TextStyle(
                                              fontFamily: 'Benzin',
                                              fontSize: 11.5,
                                              color: Colors.white),
                                        )),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      )),
                    )
                  ],
                );
              });
        },
        child: const SizedBox(
          width: double.infinity,
          height: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '+',
              ),
              Text(
                'Add New Book',
              ),
            ],
          ),
        ));
  }
}

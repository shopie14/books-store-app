import 'package:flutter/material.dart';

import '../../models/author.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({
    super.key,
    this.author,
  });
  Author? author;

  @override
  State<ProfileScreen> createState() => _ProfilScreenState();
}

// david

class _ProfilScreenState extends State<ProfileScreen> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  TextEditingController? _nameCtrl;
  TextEditingController? _emailCtrl;
  TextEditingController? _authornameCtrl;

  @override
  void initState() {
    _nameCtrl = TextEditingController(text: widget.author!.name);
    _authornameCtrl = TextEditingController(text: widget.author!.authorName);
    _emailCtrl = TextEditingController(text: widget.author!.email);
    super.initState();
  }

  @override
  void dispose() {
    _nameCtrl!.dispose();
    _emailCtrl!.dispose();
    _authornameCtrl!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Profile Screen"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          NetworkImage(widget.author!.profileImage!),
                    ),
                  ),
                  Form(
                      key: _globalKey,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  flex: 2,
                                  child: TextFormField(
                                    controller: _nameCtrl,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Silahkan isi nama lengkap';
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      hintText: 'Nama Lengkap',
                                      label: Text("Nama Lengkap"),
                                      filled: true,
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Flexible(
                                  child: TextFormField(
                                    initialValue: "${widget.author!.id}",
                                    enabled: false,
                                    textAlign: TextAlign.center,
                                    decoration: const InputDecoration(
                                      hintText: 'Id',
                                      label: Text("ID"),
                                      filled: true,
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _authornameCtrl,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Isi authorname';
                                } else if (value.length > 8 ||
                                    value.length < 3) {
                                  return "min. 3-8 huruf";
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                hintText: 'authorname',
                                label: Text("authorname"),
                                filled: true,
                                border: InputBorder.none,
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _emailCtrl,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Silahkan isi email';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                hintText: 'Alamat Email',
                                label: Text("Alamat Email"),
                                filled: true,
                                border: InputBorder.none,
                              ),
                            )
                          ],
                        ),
                      )),
                ])),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  if (_globalKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: Colors.green,
                        content: Text("Profile berhasil di simpan!")));
                  }
                },
                child: const Text('Simpan Perubahan'),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ));
  }
}

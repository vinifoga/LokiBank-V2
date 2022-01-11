import 'package:flutter/material.dart';
import 'package:lokibankv2/components/app_bar_loki.dart';
import 'package:lokibankv2/database/dao/contact_dao.dart';
import 'package:lokibankv2/models/contact.dart';
import 'package:lokibankv2/screens/contact_form.dart';

class ContactsList extends StatelessWidget {
  final ContactDao _contactDao = ContactDao();

  ContactsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarLoki(
        appBarTitle: 'Transfer',
        mostraImagem: true,
      ),
      body: FutureBuilder<List<Contact>>(
          future: _contactDao.findAll(),
          initialData: const [],
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(
                        color: Colors.amber,
                      ),
                      Text('Loading')
                    ],
                  ),
                );
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                Contact contactTest = Contact('',122);
                List<Contact>? contacts = snapshot.data;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final Contact contact = contacts?[index] ?? contactTest;
                    return _ContactItem(contact);
                  },
                  itemCount: contacts?.length ?? 0,
                );
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                  Text('Unknown error')
                ],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const ContactForm()),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final Contact contact;

  const _ContactItem(this.contact);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contact.name,
          style: const TextStyle(fontSize: 24.0),
        ),
        subtitle: Text(
          contact.accountNumber.toString(),
          style: const TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}

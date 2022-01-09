import 'package:flutter/material.dart';
import 'package:lokibankv2/components/app_bar_loki.dart';
import 'package:lokibankv2/models/contact.dart';
import 'package:lokibankv2/screens/contact_form.dart';

class ContactsList extends StatelessWidget {
  final List<Contact> contacts = [];

  @override
  Widget build(BuildContext context) {
    contacts.add(Contact('vini', 1999))
    return Scaffold(
      appBar: const AppBarLoki(
        appBarTitle: 'Contacts',
        mostraImagem: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final Contact contact = contacts[index];
          return _ContactItem(contact);
        },
        itemCount: contacts.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ContactForm()))
              .then((newContact) => debugPrint(newContact.toString()));
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

  _ContactItem(this.contact);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contact.name,
          style: TextStyle(fontSize: 24.0),
        ),
        subtitle: Text(
          contact.accountNumber.toString(),
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}

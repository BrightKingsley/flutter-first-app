import "package:flutter/material.dart";
import 'quote.dart';

class QuoteCard extends StatelessWidget {
  final quote;
  final delete;

  final Color _color = Colors.red;

  Quote myQuote = Quote(text: "", author: "");

  QuoteCard({this.quote = "", this.delete = ""});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(quote.text,
                style: TextStyle(fontSize: 18, color: Colors.grey[600])),
            const SizedBox(
              height: 6,
            ),
            Text(
              quote.author,
              style: TextStyle(fontSize: 14, color: Colors.grey[800]),
            ),
            const SizedBox(
              height: 8,
            ),
            TextButton.icon(
                onPressed: delete,
                icon: const Icon(Icons.delete),
                label: const Text("delete"))
          ],
        ),
      ),
    );
  }
}

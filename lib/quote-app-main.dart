import "package:flutter/material.dart";
import 'quote.dart';
import 'quote_card.dart';

void main() => runApp(const MaterialApp(
      home: QuoteList(),
    ));

class QuoteList extends StatefulWidget {
  const QuoteList({super.key});

  @override
  State<QuoteList> createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List<Quote> quotes = [
    Quote(
        author: "Oscar Wilde",
        text: "Be yourself; everyone else is already taken"),
    Quote(
        author: "Oscar Wilde",
        text: "I have nothing to declare except my genius"),
    Quote(
        author: "Oscar Wilde",
        text: "The truth is rarely pure and never simple"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text(
          "Awesome Quotes",
        ),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: quotes
            .map((q) => QuoteCard(
                quote: q,
                delete: () {
                  setState(() {
                    quotes.remove(q);
                  });
                }))
            .toList(),
      ),
    );
  }
}

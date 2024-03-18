import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class AIRecipe extends StatefulWidget {
  const AIRecipe({Key? key}) : super(key: key);

  @override
  State<AIRecipe> createState() => _AIRecipeState();
}

class _AIRecipeState extends State<AIRecipe> {
  TextEditingController userInput = TextEditingController();
  String recipe = "";
  bool isLoading = false;

  Future<String?> getRecipe(String recipeItem) async {
    if (recipeItem.isEmpty) return null;
    final apiKey =
        'AIzaSyAMi94IpFu79SNbNI243RCDbMFJFl0xZt0'; // Replace with your actual API key
    if (apiKey == null) {
      print('No \$API_KEY environment variable');
      exit(1);
    }
    // For text-only input, use the gemini-pro model
    final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
    final content = [
      Content.text('Tell me recipe of ' + recipeItem + "with proper headings")
    ];
    final response = await model.generateContent(content);
    //  print(response.)
    print(response.text);
    return response.text;
  }

  Widget _buildRichText(String text) {
    List<TextSpan> textSpans = [];
    bool bold = false;
    String buffer = '';

    for (int i = 0; i < text.length; i++) {
      if (text[i] == '*' && i + 1 < text.length && text[i + 1] == '*') {
        if (buffer.isNotEmpty) {
          textSpans.add(TextSpan(text: buffer));
          buffer = '';
        }
        bold = !bold;
        i++; // Skip the second '*'
      } else {
        buffer += text[i];
        if (bold) {
          textSpans.add(TextSpan(
              text: buffer,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)));
          buffer = '';
        }
      }
    }

    if (buffer.isNotEmpty) {
      textSpans.add(TextSpan(text: buffer));
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RichText(
        text: TextSpan(
          style: TextStyle(color: Colors.black, fontSize: 18),
          children: textSpans,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AI Recipe Generator"),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              height: 70,
              width: 350,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: userInput,
                  decoration: InputDecoration(
                    label: Text(" Dish Name"),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Clear focus to dismiss the keyboard
              FocusManager.instance.primaryFocus?.unfocus();
              setState(() {
                recipe = ''; // Clear previous recipe text
                isLoading = true;
              });
              getRecipe(userInput.text).then((recipeText) {
                setState(() {
                  recipe = recipeText ?? '';
                  isLoading = false;
                });
              });
            },
            child: Text("Generate Recipe"),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                // color: Colors.tr,
                child: Container(
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                      opacity: 0.15,
                      image: NetworkImage(
                          'https://img.freepik.com/free-vector/empanada-recipe-concept_52683-39843.jpg?size=626&ext=jpg&ga=GA1.1.1700460183.1708041600&semt=ais'), // Your image asset
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: isLoading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : SingleChildScrollView(child: _buildRichText(recipe)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

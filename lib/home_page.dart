import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FilePickerResult? result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('File Picker'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
       if(result!=null)
       Padding(
        
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Picker App',style: TextStyle(
              fontSize: 16,fontWeight: FontWeight.bold
            ),
            ),
              ListView.builder(
                          shrinkWrap: true,
                          itemCount: result?.files.length ?? 0,
                            itemBuilder: (context, index) {
                          return Text(result?.files[index].name ?? '', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold));
                        })
                      ],
                    ),),
              Center(
                child: ElevatedButton(
                  onPressed: () async{
                     result = await FilePicker.platform.pickFiles(allowMultiple: true );
                      if (result == null) {
                          print("No file selected");
                        } else {
                        setState(() {
                        });
                         result?.files.forEach((element) {
                           print(element.name);
                         });
                        }
                  },
                  child: const Text("File Picker"),
                ),

          
        ),
        
                
        
          
        ],
        
      ),
    
    );
  }
}
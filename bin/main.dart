//"I, Ethan Wolcott, did not share code or talk to other students about this exam"

// Test EX2_Map_Reduce: Dart Take-home Test Part 2
import 'dart:async';
import 'dart:io';

main() async {

    // Read in the entire text of the entire Bible
    // NOTE: This will only work on campus! If you want to test your program off campus
    // you will need to copy the kjv.txt to a flash drive and take it home. You will
    // also need to change the following path to the file!
    String bible;

    bible = await new File('\\\\cs1\\CS_ClassData\\172\\DATA\\kjv.txt').readAsString().then((String contents) {
      return contents;
    });
    
    // Split the bible string into a list of words
    // Get rid of all special characters
    List<String> words = bible
      .replaceAll("-"," ")
      .replaceAll(","," ")
      .replaceAll("."," ")
      .replaceAll(":"," ")
      .replaceAll(";"," ")
      .replaceAll("'"," ")      
      .replaceAll('"'," ")  
      .replaceAll(']'," ")    
      .replaceAll('['," ") 
      .replaceAll(r"[\w][\w]*","")     
      .split(" ")
      .map( (w) => w.trim() )    
      .map( (w) => w.toLowerCase() )
      .toList();


    // Take the list of words and fold into map. 
    Map<String,int> count_all = words.fold( Map<String,int>(), 
      (Map<String,int> counts, String w) {

         
          // lookup w in counts and add 1 to it.
           // if w is not in counts, set the count of w to w in the map

        counts.update(w, (value) => value+1, ifAbsent: () => 0,);
          return counts;
      });
 
    // Output the count for all the times the word jesus appears
    print( count_all["jesus"] );

}

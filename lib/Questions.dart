class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question({this.id, this.question, this.answer, this.options});
}

const List sample_data =[
    {
     "id":1,
      "question":  "What is the output? \n\n function sayHi() { \n console.log(name);\n console.log(age);\n var name = 'Lydia';\n let age = 21;\n }\n sayHi();",
      "options":  [
        "Lydia and undefined",
        "Lydia and ReferenceError",
        "undefined and ReferenceError",
        "ReferenceError and 21"
      ],
      "answer_index": 3,
    },
    {
      "id":2,
      "question":"What is the output? \n\n for (var i = 0; i < 3; i++) {\n setTimeout(() => console.log(i), 1);\n }\n for (let i = 0; i < 3; i++) {\n setTimeout(() => console.log(i), 1);\n }",
      
      "options": [
          "3 3 3 and 0 1 2",
        "0 1 2 and 0 1 2",
        "0 1 2 and 3 3 3",
        "null"
      ],
      "answer_index": 1,

    },
    {
      "id":3,
      "question": "What is the output? \n\n const shape = { \n radius: 10,\n diameter() {\n   return this.radius * 2;\n },\n perimeter: () => 2 * Math.PI * this.radius,\n }; \n console.log(shape.diameter()); \n console.log(shape.perimeter());",

      "options": ["20 and 62.83185307179586", "20 and NaN", "NaN and 63", "20 and 63"],
      "answer_index": 2,
    },
    {
      "id":4,
      "question": "What is the output? \n\n +true;\n !'Lydia';",
      "options": [
        'false and NaN',
        '1 and false',
        'false and false',
        'null'
      ],
      "answer_index":2,
    },
    {
     "id":5,
      "question": "Which one is true? \n\n const bird = {\n  size: 'small',\n};\n\nconst mouse = {\n name: 'Mickey',\n  small: true,\n};",
      "options": ["mouse.bird.size is not valid","mouse[bird.size] is not valid", "mouse[bird['size']] is not valid", "All of them are valid"],
       "answer_index": 1,
    },
    {
     "id":6,
      "question": "What is the output? \n\n let c = { greeting: 'Hey!' };\nlet d;\n\nd = c;\nc.greeting = 'Hello';\nconsole.log(d.greeting);",
      "options": ["Hey!", "undefined","Hello", "TypeError"],
      "answer_index": 3,
    },
    {
     "id":7,
      "question": "What is the output? \n\n let a = 3;\nlet b = new Number(3);\nlet c = 3;\n\nconsole.log(a == b);\nconsole.log(a === b);\nconsole.log(b === c);",
      
      "options": ["true false true",  "true false false","false false true", "false true true"],
       "answer_index": 2,
    },
    {
      "id":8,
      "question": " Which one of the following also known as Conditional Expression:",
      "options": ["Alternative to if-else","Switch statement","immediate if","If-then-else statement"],
       "answer_index": 3,
    },
    {
    "id":9,
      "question": "What is the output? \n\n let greeting;\n greetign = {}; // Typo!\n console.log(greetign);",
      "options": [
        "ReferenceError: greetign is not defined",
        "undefined",
        "{}",
        "null",
      ],
       "answer_index": 3,
    },
    {
      "id":10,
      "question": "All objectd do not have prototypes. ",
      "options": ["true","false"],
       "answer_index": 1,
    },
  ];
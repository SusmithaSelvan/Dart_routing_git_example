import 'package:hangman_problem/hangman_problem.dart' as hangman_problem;

import 'dart:io';
import 'dart:math';

void main(List<String> arguments) {
  print('Hello world: ${hangman_problem.calculate()}!');

  
  // Define a list of words
  List<String> words = ['apple', 'banana', 'cherry', 'durian', 'elderberry'];

  // Select a random word from the list
  Random random = Random();
  String selectedWord = words[random.nextInt(words.length)];
  print(selectedWord);

  // Initialize game variables
  int maxGuesses = 6;
  int remainingGuesses = maxGuesses;
  List<String> guessedLetters = [];
  bool gameWon = false;

  print('Welcome to Hangman!');
  print('Guess the word:');

  while (remainingGuesses > 0) {
    // Display the word with blanks for unguessed letters
    String displayWord = '';
    for (int i = 0; i < selectedWord.length; i++) {
      String letter = selectedWord[i];
      if (guessedLetters.contains(letter)) {
        displayWord += '$letter ';
      } else {
        displayWord += '_ ';
      }
    }
    print(displayWord);

    // Display game status
    print('Remaining Guesses: $remainingGuesses');
    print('Guessed Letters: ${guessedLetters.join(', ')}');
    String? guess = '';
    // Prompt for a letter guess
    stdout.write('Enter your guess: ');
    guess = stdin.readLineSync()?.toLowerCase();

    // Validate the input
    if (guess == null || guess.isEmpty || guess.length > 1) {
      print('Please enter a single letter.');
      continue;
    }

    // Check if the letter has already been guessed
    if (guessedLetters.contains(guess)) {
      print('You already guessed that letter.');
      continue;
    }

    // Add the guessed letter to the list
    guessedLetters.add(guess);

    // Check if the guess is correct
    if (selectedWord.contains(guess)) {
      print('Correct guess!');
      if (selectedWord
          .split('')
          .every((letter) => guessedLetters.contains(letter))) {
        gameWon = true;
        break;
      }
    } else {
      print('Incorrect guess!');
      remainingGuesses--;
    }

    print('----------------');
  }

  // Game over, display the result
  print('----------------');
  if (gameWon) {
    print('Congratulations! You guessed the word: $selectedWord');
  } else {
    print('Game over! The word was: $selectedWord');
  }
print('-------FINISHED---------');
}

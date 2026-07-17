#include <complex>
#include <cstdio>
#include <forward_list>
#include <iostream>
using namespace std;

union num {
  int i;
  float f;
  complex<float> c(float, float);
};

typedef forward_list<string> slist;
typedef forward_list<num> nlist;

int main() {
  string output;

  do {
    // Declare parameters
    num stt_base;
    num end_base;
    slist numbers;

    // Title
    printf("\033[93;1mOlivia's Universal Base Converter\033[0m\n\n");

	// Rules
	printf("%s", (string("This calculator allows for inputs of:\n") +
		"Integers, decimals, and complex numbers (of the form xxx + xxxi).\n" +
		"Powers are also allowed using b^n - where b is the base, n is the number.\n" +
		"Surds are also allowed using b;n - where b is the base, n is the number.\n" +
		"Special symbols must be preceeded by a ':'. Special symbols inc.: pi, phi, e.\n" +
		"To quit at any time, enter !q. To restart, enter !r. To exit the number loop, enter '!'." +
		"\n\n").c_str()
	);

    // Get the initial base
    string stt_base_str;
    printf("\033[92mEnter the base:\033[0m ");
    cin >> stt_base_str;

	string number;
	do {

    	// Get numbers to convert
    	printf("\033[94mEnter an array or one number:\033[0m ");
    	cin >> number;

	} while (number != "!");

	// Get the final base
    string end_base_str;
    printf("\033[92mEnter the base:\033[0m ");
    cin >> end_base_str;

	// Exit code
    printf("\033[91mWould you like to run another calculation?\033[0m ([y]/n): ");
    cin >> output;

  } while (output != "!q");

  return 0;
}

num read_and_parse_base(string base_str) {
  num out;
  out.i = 1;
  return out;
}
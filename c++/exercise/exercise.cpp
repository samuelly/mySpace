#include <iostream>
#include <cstring>
 
using namespace std;

#define EXERCISE_1

char a[] = "123456";

void exercise_1()
{
	cout << "length is " << strlen(a) << endl;
	cout << "a[6] is " << a[6] << endl;   // should be zero? bug under codeblock compiler it shows 'None' 
}



int main(void)
{
	exercise_1();
	return 1;
}
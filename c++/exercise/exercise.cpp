#include <iostream>
#include <cstring>
 
using namespace std;

//#define EXERCISE_1
//#define EXERCISE_2
#define EXERCISE_3 

#if defined EXERCISE_1
char a[] = "123456";

void exercise_1(void)
{
	cout << "length is " << strlen(a) << endl;
	cout << "a[6] is " << a[6] << endl;   // should be zero? bug under codeblock compiler it shows 'None' 
}
#endif

#if defined EXERCISE_2
class Base {
	public:
		virtual void g() {cout << "Base:: g()" << endl ;}
		void f() {cout << "Base:: f()" << endl;}
};

class Derived : public Base {
	public: 
		virtual void g() {cout << "Derived:: g()" << endl ;}
		void f() {cout << "Derived:: f()" << endl;}
};

void exercise_2(void)
{
	Base *ptr1 = new Base();
	Base *ptr2 = new Derived();
	//Derived *ptr3 = new Base(); // error
	
	ptr1->g();
	ptr1->f();
	
	ptr2->g();
	ptr2->f(); // still call the f() in Base class
}
#endif

#if defined EXERCISE_3
void coutString(const char* str)
{
	if (*str)
	{
		str++;
		coutString(str);
		cout << "the string is: " << *str << endl;
		//cout << "the string is: " << str << endl; // pay attention to the difference with the 'str' and '*str'
	}
}
void exercise_3(void)
{
	char *str = "hello, jack";
	coutString(str);
}
#endif

int main(void)
{
	#if defined EXERCISE_1
		exercise_1();
	#elif defined EXERCISE_2
		exercise_2();
	#elif defined EXERCISE_3
		exercise_3();
	#endif

	
	return 1;
}
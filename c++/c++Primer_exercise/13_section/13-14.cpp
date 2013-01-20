#include <iostream>

using namespace std;

class Exmpl{
public:
	// default constructor
	Exmpl(){
		cout << "Exmpl()" << endl;}

	// copy constructor
	Exmpl(const Exmpl& ){
		cout << "Exmpl(const Exmpl& obj)" << endl;}

	Exmpl& operator = (const Exmpl& obj)
	{
		cout << "Exmpl& operator = (const Exmpl&)" << endl;
		return *this;
	}

	// Destructor
	~Exmpl(){
		cout <<"~Exmpl()" << endl; }
		
private:
	
};

void func1(Exmpl tobj) // parameter is Exmpl object
{

}

void func2(Exmpl& tobj) // parameter is reference of Exmpl object
{

}

Exmpl func3()
{
	Exmpl obj;
	return obj;  // return Exmpl object
}

int main()
{	
	// call the default constructor to create a Exmpl object:obj
	Exmpl obj; 
	
	cout << "~~~~~~~~~~~~~~~~~" << endl;

	// 1.call the copy constructor; 2.将形参Exmpl对象创建为实参Exmpl对象的一个副本;3.函数执行完毕后调用析构函数撤销形参Exmpl对象
	//func1(obj); 
	cout << "----------------------" << endl;

	// 形参是Exmpl对象的引用，无须调用copy构造函数来传递实参
	//func2(obj); 
	cout << "@@@@@@@@@@@@@@@@@@@@@@" << endl;

	// 调用默认构造函数创建局部Exmpl对象
	// 函数返回时，调用copy构造函数来创建作为返回值副本的Exmpl对象 (重要)
	// 然后调用析构函数销毁局部Exmpl对象
	// 然后调用赋值操作符
	// 执行完赋值操作后，调用析构函数销毁作为返回值副本的Exmpl对象。
	obj = func3();
	
	return 0;
}


#include <iostream>
using namespace std;
class A{
  public: void p()
  {
    cout << "A" << endl;
  }
};

class B : public A
{
  public: void p()
  { cout << "B" << endl;
  }
};

int main()
{
  A * a = new A;
  A * b = new B;
  a->p();
  b->p();
  delete a;
  delete b;
  return 0;
}

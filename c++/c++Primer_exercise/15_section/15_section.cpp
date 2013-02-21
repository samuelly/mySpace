#include <iostream>
#include <vector>
#include <list>
#include <string>

using namespace std;

//#define EXERCISE_15_14
#define EXERCISE_15_28
//#define EXERCISE_15_29

/*
** exercise 15.14 重新定义 Bulk_item 和 Iterm_base类，使每个类只需定义一个构造函数。
*/
class Item_base { // 不使用折扣策略的基类
	public:
         Item_base (const std::string &book = "",
					double sale_price = 0.0) : isbn(book), price(sale_price) {}

		std::string book() const
		{
			return isbn;
		}

		// 返回特定购书量的总价格，派生类将重载该函数以应用不同的折扣策略。
		virtual double net_price(size_t n) const
		{
			return n * price;
		}

		virtual ~Item_base() {}

	private:
		std::string		isbn;
	protected:
		double			price;  // price is needed by derived class,so it need declared as protected

     };

class Bulk_item : public Item_base {// 批量购买折扣类
	public:
		Bulk_item (const std::string& book,double sales_price,
					std::size_t qty = 0, double disc_rate = 0.0) :
					Item_base(book,sales_price),
					min_qty(qty), discount(disc_rate) {
					
					}
					

		// 重定义基类版本以实现批量购买折扣策略：若购书量高于下限，则使用折扣价格
		double net_price(size_t cnt) const
		{
			if (cnt >= min_qty)
				return cnt * (1 - discount) * price;
			else
				return cnt * price;
		}

	private:
		size_t			min_qty; // 可打折的最小购买量
		double			discount; // 折扣率
};
/*
** exercise 15.14  end
*/

/*
** exercise 15.28 定义一个 vector 保存 Item_base 类型的对象，并将一些 Bulk_item 类型对象复制的到 vector 中。
** 遍历并计算容器中元素的总和。
** test: input name 34 30 0.1, so this will call the base class's net_price() function and the result is 3400.
*/
void exercise_15_28(void)
{
	cout << "here is exercise 15.28:" << endl;

	#define MAX_BULK 10
	//Bulk_item bulk[MAX_BULK];

	//vector<Item_base> ItemVec(bulk,bulk + MAX_BULK);

	//Bulk_item bulk1("how to say", 54.89, 0, 0.0);


	vector<Item_base> ItemVec;
	string isbn;
	double price,qty,discount;
	int count = 0;

	// read the Bulk objects and copy to vector.
	cout << "Enter some Bulk objects (Ctrl + z to end)" << endl;
	while (cin >> isbn >> price >> qty >> discount)
	{
		ItemVec.push_back(Bulk_item(isbn,price,qty,discount));
	}
 
	double sum;
	vector<Item_base>::iterator iter = ItemVec.begin();
	for (; iter != ItemVec.end(); iter++)  
		sum += (*iter).net_price(100);   // call Item_base class's function for it using Base class object.

	cout << "summation of the price :" << sum << endl;
}


/*
** exercise 15.29 重复程序，但这次存储 Item_base 类型对象的指针。比较结果总和.
** test: input name 34 30 0.1, so this will call the bulk class's net_price() function, 
** for it call the virtual function in Bulk class () by using base class's pointer. and the result is 3060.
*/
void exercise_15_29(void)
{
	cout << "here is exercise 15.29:" << endl;

	vector<Item_base*> ItemVec;
	string isbn;
	double price,qty,discount;
	int count = 0;

	// read the Bulk objects and copy to vector.
	cout << "Enter some Bulk objects (Ctrl + z to end)" << endl;
	while (cin >> isbn >> price >> qty >> discount)
	{
		// dynomic create Bulk objects by pointer which points Base class Item_base.
		Item_base *p = new Bulk_item(isbn,price,qty,discount);
		ItemVec.push_back(p);  // add to vector
	}

	double sum;
	vector<Item_base*>::iterator iter = ItemVec.begin();
	for (; iter < ItemVec.end(); iter++)  
		sum += (*iter)->net_price(100);  // call Bulk_item class's function for it using the pointer of Base class

	cout << "summation of the price :" << sum << endl;
	
	for (vector<Item_base*>::iterator it = ItemVec.begin(); it != ItemVec.end(); it++)
		delete (*it);   // release the pointer
}


int main()
{
	cout << "prepare to exercise." << endl;

	#ifdef EXERCISE_15_14
		//don't need
	#elif defined EXERCISE_15_28
		exercise_15_28();
	#elif defined EXERCISE_15_29
		exercise_15_29();		
	#else
	#endif

	return 1;
}

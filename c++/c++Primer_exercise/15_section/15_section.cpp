﻿#include <iostream>
#include <vector>
#include <list>
#include <string>

using namespace std;

#define EXERCISE_15_14

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
		
		// 返回特定购书量的总价格，派生类将重载该函数咦应用不同的折扣策略。
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
	 
class Bulk_item : Item_base {// 批量购买折扣类
	public:
		Bulk_item (const std::string& book,double sales_price,
					std::size_t qty = 0, double disc_rate = 0.0) :
					Item_base(book,sales_price),
					min_qty(qty), discount(disc_rate) {}
					
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

	
void exercise_14_7(void)
{
	cout << "here is exercise 14.7:" << endl;

}



int main()
{
	cout << "prepare to exercise." << endl;

	#ifdef EXERCISE_15_14
		exercise_14_7();
	#elif defined EXERCISE_
			
	#else
	#endif

	return 1;
}

// BpsPusher.cpp : 此文件包含 "main" 函数。程序执行将在此处开始并结束。
//

#include "pch.h"
#include <iostream>
#include <string>
#include "Game.h"
#include <fstream>
#include <sstream>


int main()
{
	Game game;
	game.showIndex();
	game.showCatagory();
	
	/*std::string style[] = { "++++++++","+  00  +","+  00  +","++++++++" };
	std::string *p = style;
	char buffer[256] = "ddd";
	*p = buffer;
	p++;
	*p = buffer;
	p++;
	*p = buffer;
	p++;
	*p = buffer;
	p = style;
	int i = 0;
	while (i++ < 4) {
		std::cout << *p++ <<"  ";
	}*/

	/*int index = 1;
	std::stringstream stream;
	stream << index;

	std::string url("./map_"+stream.str()+".txt");
	std::cout << url;*/
	
	/*std::string s;
	char buffer[256];
	std::ifstream in("./map_1.txt");
	if (!in.is_open()) {
		std::cout << "Error"<<std::endl;
		
	}
	while (!in.eof()) {
		in.getline(buffer, 100);
		s = buffer;
		std::cout << s << std::endl;
		std::cout << buffer << std::endl;
	}*/

	//std::cout << s;
	//std::ifstream myf;
	//myf.open("./map.txt");
	//std::string s;
	//myf >> s;
	//std::cout << s;


	
	

	/*std::list<std::string> list;
	list.push_back("hello");
	std::list<std::string>::iterator iter = list.begin();
	(*iter)[1] = '?';
	std::cout << *iter;*/

	/*std::list<Block> mylist = map.getList();
	std::list<Block>::iterator iter = mylist.begin();
	for (; iter != mylist.end(); ++iter) {
		Block b = *iter;
		std::list<std::string> blist = b.getlist();
		std::list<std::string>::iterator biter;
		for (biter = blist.begin(); biter != blist.end(); ++biter) {
			std::cout << *biter;
		}
	}*/

	/*StyleBox sb;
	Block b = sb.getBlock('u');
	std::list<std::string> blist = b.getlist();
	std::list<std::string>::iterator iter;
	for (iter = blist.begin(); iter != blist.end(); ++iter) {
		std::cout << *iter << "o" << std::endl;
	}*/

	/*std::string style[] = { "++++++++","+  00  +","+  00  +","++++++++" };
	std::string *p = style;
	fun(p,4);
	fun(p,4);*/

	
	/*std::string style[] = { "++++++++","+  00  +","+  00  +","++++++++" };
	size_t bblen = sizeof(style) / sizeof(style[0]);

	Block b("box",style,bblen);
	std::list<std::string> blist = b.list;
	std::list<std::string>::iterator iter;

	for (iter = blist.begin(); iter != blist.end(); ++iter) {
		std::cout << *iter << "o" << std::endl;
	}
*/


	/*
	std::string bb[] = { "++++++++","+  00  +","+  00  +","++++++++" };
	std::string *cc;
	cc = &bb[0];
	cc++;
	cc++;
	cc++;
	cc++;
	if(cc->empty)
	std::cout << *cc;

	std::cout << std::endl << "----------------------" << std::endl;

	size_t bblen = sizeof(bb) / sizeof(*bb);
	for (int i = 0; i != bblen; ++i) {
		std::cout << bb[i] <<"HHH" <<std::endl;
	}
	return 0;*/
}


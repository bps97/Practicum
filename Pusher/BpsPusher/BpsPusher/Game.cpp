#include "pch.h"
#include "Game.h"
#include <sstream>
#include <fstream>
Game::Game()
{
	this->index = 1;
	this->flag = true;
}


Game::~Game()
{
}

//ddssssdssaawddsdwawdddsdwwsaaaawwwwaasdwdssssdssaawddsdwawdddsdwaaaawwwaasdwdsssdssaassaawddsdwawddds
//ddssddwwawwaaaassasdwdsawwwddddssaaadddwwaaaassasdwddddddwasaaaaawwddddswaaaassdddssddwwaaaadddwwaaaassswdddddssawdwaaaadddwwaaaas
void Game::start(int index)
{

	this->index = index;
	
	Plat map = Plat::importMap(this->index);

	map.generateMap();
	map.ParamShow();
	map.ViewShow();

	Opeara(map);
}

void Game::Opeara(Plat &map)
{
	
	static int  re = 0;
	while (this->flag) {
		
		if (re == 1) {
			
			++this->index;
			if (this->index-1 == this->getMaxIndex()) {
				this->showCatagory();
			}
			else {
				std::cout << "过关了！下一关";
				system("pause");
				re = 0;
				this->start(this->index);
				
			}
		}
		

		char op;
		std::cin >> op;
		if (op == '~') {
			this->flag = false;
			this->showCatagory();
		}
		else if (op == 'r') {
			map = Plat::importMap(this->index);
			map.generateMap();
			re = map.ParamShow();
			map.ViewShow();
		}
		else {
			map.move(op);
			map.generateMap();
			re = map.ParamShow();
			map.ViewShow();
		}
		

	}
	
	
}

void Game::append(int index,Plat map)
{
	this->ctn.insert(std::pair<int, Plat>(index, map));
	
}

Plat Game::getMap(int index)
{
	std::map<int, Plat>::iterator iter = this->ctn.find(index);
	if (iter != this->ctn.end())
		return iter->second;
	else
		return Plat();
}

void Game::showIndex()
{
	Plat index = Plat::importMap(-1);
	index.generateMap();
	index.ViewShow();
	std::cout  << std::endl << std::endl << std::endl << std::endl
		<< "---------------------" << std::endl<<"游戏即将开始";
	system("pause");
}

void Game::showCatagory()
{
	system("cls");
	std::cout << "This is catagory" << std::endl;
	std::cout << "1.start(直接开始)" << std::endl;
	std::cout << "2.option(关卡选择)" << std::endl;
	std::cout << "3.define(自制地图)" << std::endl;
	std::cout << "4.exit(退出目录)" << std::endl;
	char ch;
	std::cin >> ch;
	if (ch == '1') {
		this->start(1);
	}
	else if (ch == '2') {
		std::cout << "目前拥有的关卡为1-" << this->getMaxIndex()-1<<std::endl;
		std::cout << "please input option" << std::endl;
		int i;
		std::cin >> i;
		this->flag = true;
		this->start(i);
	}
	else if (ch == '3') {
		//Plat map;
		this->flag = false;
		this->showDefineMap();

	}
	else if (ch == '4') {
		this->flag = true;
		this->start(this->index);
	}
	else {
		this->showCatagory();
	}

}

void Game::showDefineMap()
{

	int maxindex = this->getMaxIndex();
	
	Plat module = Plat::importMap(0);
	std::list<std::string> slist = module.getsample();
	std::list<std::string>::iterator iter = slist.begin();
	
	//复制内容
	std::ofstream outFile(Plat::getUrl(maxindex), std::ios::out);
	if (!outFile.is_open()) {
		std::cout << "Error" << std::endl;
	}
	
	for (int i = 0;iter!=slist.end(); ++i,++iter) {
		if(i==0){
			outFile<<*iter;
		}
		else {
			outFile << std::endl << *iter;
		}
		
	}
	outFile.close(); 

	Plat map = Plat::importMap(maxindex);
	
	map.generateMap();
	map.setCoved('h');
	system("cls");
	std::cout << "新建地图编号("<< maxindex << ") [1(空白) 2(箱子) 3(漏洞) 4(补丁) 5(墙) q(保存)]" << std::endl;
	map.ViewShow();
	while (true) {
		char ch;
		std::cin >> ch;
		int pos = map.getPos();
		if (ch == '1') {
			map.setBlock(pos, 'a');
		}
		else if (ch == '2') {
			map.setBlock(pos, 'b');
		}
		else if (ch == '3') {
			map.setBlock(pos, 'h');
		}
		else if (ch == '4') {
			map.setBlock(pos, 'p');
		}
		else if (ch == '5') {
			map.setBlock(pos, 'w');
		}
		else if (ch == 'q') {
			this->saveMap(map);
			this->showCatagory();
		}
		else if (ch == '~') {
			this->showCatagory();
		}
		else {
			map.moveAdmin(ch);
		}
		map.generateMap();
		map.ParamShow();
		std::cout << " [1(空白) 2(箱子) 3(漏洞) 4(补丁) 5(墙) q(保存)]";
		map.ViewShow();
	}
	return;
}

void Game::saveMap(Plat map)
{
	std::list<std::string> slist = map.getsample();
	std::list<std::string>::iterator iter= slist.begin();

	std::ofstream outFile(Plat::getUrl(map.getIndex()), std::ios::out);
	if (!outFile.is_open()) {
		std::cout << "Error" << std::endl;
	}

	for (int i = 0; iter != slist.end(); ++i, ++iter) {
		if (i == 0) {
			outFile << *iter;
		}
		else {
			outFile << std::endl << *iter;
		}

	}
	outFile.close();

}

int Game::getMaxIndex()
{
	int num = 0;
	
	while(true){
		std::stringstream stream;
		stream.clear();
		stream << ++num;
		std::string url("./map_" + stream.str() + ".txt");
		std::ifstream in(url);
		
		if (!in.is_open()) {
			return num; //打不开就返回最大地图号
		}
		in.close();
	}
}

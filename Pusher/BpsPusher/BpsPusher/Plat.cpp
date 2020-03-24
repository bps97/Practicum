#include "pch.h"
#include "Plat.h"
#include <windows.h>

#include <fstream>
#include <sstream>


Plat::Plat(std::string *basestrs, size_t width, size_t height, int index)
{
	this->coved = 'a';
	this->count = 0;
	
	this->height = (int)height;
	this->width = (int)width; 
	this->InitMap(basestrs, height); 
	int pos = isExist('u');
	this->pX = pos % (this->width);
	this->pY = pos / (this->width);
	this->index = index;
	
}
Plat::Plat()
{

}
std::string Plat::getUrl(int index)
{
	std::stringstream stream;
	stream << index;
	std::string url("./map_" + stream.str() + ".txt");
	return url;
}
Plat Plat::importMap(int index)
{
	
	std::string url = getUrl(index);
	std::string s[256];
	std::string *p = s;
	char buffer[256];
	std::ifstream in(url);
	if (!in.is_open()) {
		std::cout << "Error" << std::endl;
		in.close();
		return Plat();
	}
	while (!in.eof()) {
		in.getline(buffer, 100);
		*p = buffer;
		++p;

	}
	int len = (int)(p - s);
	p = s;
	in.close();
	return Plat(p, (*p).size(), len, index);
}








void Plat::InitMap(std::string *basestrs,size_t len)
{
	
	for (int i = 0; i != len; ++i) {
		this->sampleSet.push_back(basestrs[i]);
	}
	
}
void Plat::generateMap()
{

	this->ctn.clear();
	std::list<std::string>::iterator iter = this->sampleSet.begin();

	for (int i = 0; iter != sampleSet.end(); ++iter, ++i) {
		for (int j = 0; j != this->width; ++j) {

			this->ctn.push_back(StyleBox().getBlock((*iter)[j]));
		}
	}
}
void Plat::addBlock(char op)
{
	setBlock(this->pX, this->pY, 'b');
	this->generateMap();
	this->ParamShow();
	this->ViewShow();
}
void Plat::moveAdmin(char op)
{
	
	switch (op) {
	case 'w':
	case 'W':
		this->moveUpAdmin(op);
		break;
	case 's':
	case 'S':
		this->moveDownAdmin(op);
		break;
	case 'a':
	case 'A':
		this->moveLeftAdmin(op);
		break;
	case 'd':
	case 'D':
		this->moveRightAdmin(op);
		break;
	}
	if ((this->pX == 0 || this->pX == this->width - 1 || this->pY == 0 || this->pY == this->height - 1)) {
		if (op == 'w' || op == 'W') {
			this->setBlock(this->pX, this->pY, 'w');
			this->moveAdmin('s');
		}
		else if (op == 's' || op == 'S') {
			this->setBlock(this->pX, this->pY, 'w');
			this->moveAdmin('w');
		}
		else if (op == 'a' || op == 'A') {
			this->setBlock(this->pX, this->pY, 'w');
			this->moveAdmin('d');
		}
		else if (op == 'd' || op == 'D') {
			this->setBlock(this->pX, this->pY, 'w');
			this->moveAdmin('a');
		}
	}
}

void Plat::moveUpAdmin(char op)
{
	char cur = getType(this->getPos());
	if (cur == 'u') {
		this->setBlock(this ->pX, this->pY, this->coved);
		char aim = getType(this->getPos() - this->width);
		this->coved = aim;
		
	}
	this->pY--;
	this->setBlock(this->pX, this->pY, 'u');
}

void Plat::moveDownAdmin(char op)
{
	char cur = getType(this->getPos());
	if (cur == 'u') {
		this->setBlock(this->pX, this->pY, this->coved);
		char aim = getType(this->getPos() + this->width);
		this->coved = aim;

	}
	this->pY++;
	this->setBlock(this->pX, this->pY, 'u');
}

void Plat::moveLeftAdmin(char op)
{
	char cur = getType(this->getPos());
	if (cur == 'u') {
		this->setBlock(this->pX, this->pY, this->coved);
		char aim = getType(this->getPos() - 1);
		this->coved = aim;

	}
	this->pX--;
	this->setBlock(this->pX, this->pY, 'u');
}

void Plat::moveRightAdmin(char op)
{
	char cur = getType(this->getPos());
	if (cur == 'u') {
		this->setBlock(this->pX, this->pY, this->coved);
		char aim = getType(this->getPos() + 1);
		this->coved = aim;

	}
	this->pX++;
	this->setBlock(this->pX, this->pY, 'u');
}

void Plat::move(char op)
{
	switch (op) {
		case 'w': 
		case 'W':
			moveUp(op);
			break;
		case 's': 
		case 'S':
			moveDown(op);
			break;
		case 'a':
		case 'A':
			moveLeft(op);
			break;
		case 'd':
		case 'D': 
			moveRight(op);
			break;
	}
}

void Plat::moveRight(char op)
{
	char aim = this->getType(this->getPos() + 1);
	if (aim == 'a') {
		this->setBlock(this->pX, this->pY, this->coved);
		this->pX++;
		this->setBlock(this->pX, this->pY, 'u');
		this->coved = aim;
	}
	else if (aim == 'w') {
		//动不了呀
	}
	else if (aim == 'b') {

		char next = this->getType(this->getPos() + 2);
		if (next == 'a') {  //箱子后面无物
			this->setBlock(this->pX, this->pY, this->coved);
			this->pX++;
			this->setBlock(this->pX, this->pY, 'u');
			this->setBlock(this->pX + 1, this->pY, aim);
			this->coved = next;
		}
		else if (next == 'w' || next == 'p' || next == 'b') {
			//动不了呀
		}
		else if (next == 'h') {
			this->setBlock(this->pX, this->pY, this->coved);
			this->pX++;
			this->setBlock(this->pX, this->pY, 'u');
			this->setBlock(this->pX + 1, this->pY, 'p');
			this->coved = 'a';//
		}
		else {
			//！！清空缓冲区
		}
	}
	else if (aim == 'h') {
		this->setBlock(this->pX, this->pY, this->coved);
		this->pX++;
		this->setBlock(this->pX, this->pY, 'u');
		this->coved = aim;
	}
	else if (aim == 'p') {
		char next = this->getType(this->getPos() + 2);
		if (next == 'a') {
			this->setBlock(this->pX, this->pY, this->coved);
			this->pX++;
			this->setBlock(this->pX, this->pY, 'u');
			this->setBlock(this->pX + 1, this->pY, aim);
			this->coved = 'h';
		}
		else if (next == 'w' || next == 'p' || next == 'b') {
			//动不了呀
		}
		else if (next == 'h') {
			std::cout << "？？？？”";
			this->setBlock(this->pX, this->pY, this->coved);
			this->pX++;
			this->setBlock(this->pX, this->pY, 'u');
			this->setBlock(this->pX + 1, this->pY, 'p');
			this->coved = 'h';
		}
		else {
			//！！清空缓冲区
		}
	}
	else {
		//!!清空缓冲区
	}
}
void Plat::moveLeft(char op)
{
	char aim = this->getType(this->getPos() - 1);
	if (aim == 'a') {
		this->setBlock(this->pX, this->pY, this->coved);
		this->pX--;
		this->setBlock(this->pX, this->pY, 'u');
		this->coved = 'a';
	}
	else if (aim == 'w') {
		//动不了呀
	}
	else if (aim == 'b') {

		char next = this->getType(this->getPos() - 2);
		if (next == 'a') {
			this->setBlock(this->pX, this->pY, this->coved);
			this->pX--;
			this->setBlock(this->pX, this->pY, 'u');
			this->setBlock(this->pX - 1, this->pY, aim);
			this->coved = 'a';
		}
		else if (next == 'w' || next == 'p' || next == 'b') {
			//动不了呀
		}
		else if (next == 'h') {
			this->setBlock(this->pX, this->pY, this->coved);
			this->pX--;
			this->setBlock(this->pX, this->pY, 'u');
			this->setBlock(this->pX - 1, this->pY, 'p');
			this->coved = 'a';
		}
		else {
			//！！清空缓冲区
		}
	}
	else if (aim == 'h') {
		this->setBlock(this->pX, this->pY, this->coved);
		this->pX--;
		this->setBlock(this->pX, this->pY, 'u');
		this->coved = aim;
	}
	else if (aim == 'p') {
		char next = this->getType(this->getPos() - 2);
		if (next == 'a') {
			this->setBlock(this->pX, this->pY, this->coved);
			this->pX--;
			this->setBlock(this->pX, this->pY, 'u');
			this->setBlock(this->pX - 1, this->pY, 'b');
			this->coved = 'h';
		}
		else if (next == 'w' || next == 'p' || next == 'b') {
			//动不了呀
		}
		else if (next == 'h') {
			this->setBlock(this->pX, this->pY, this->coved);
			this->pX--;
			this->setBlock(this->pX, this->pY, 'u');
			this->setBlock(this->pX - 1, this->pY, 'p');
			this->coved = 'h';
		}
		else {
			//！！清空缓冲区
		}
	}
	else {
		//!!清空缓冲区
	}
}

void Plat::moveDown(char op)
{
	char aim = this->getType(this->getPos() + this->width);
	if (aim == 'a') {
		this->setBlock(this->pX, this->pY, this->coved);
		this->pY++;
		this->setBlock(this->pX, this->pY, 'u');
		this->coved = 'a';
	}
	else if (aim == 'w') {
		//动不了呀
	}
	else if (aim == 'b') {
		char next = this->getType(this->getPos() + this->width * 2);
		if (next == 'a') {
			this->setBlock(this->pX, this->pY, this->coved);
			this->pY++;
			this->setBlock(this->pX, this->pY, 'u');
			this->setBlock(this->pX, this->pY + 1, aim);
			this->coved = 'a';
		}
		else if (next == 'w' || next == 'p' || next == 'b') {
			//动不了呀
		}
		else if (next == 'h') {
			this->setBlock(this->pX, this->pY, this->coved);
			this->pY++;
			this->setBlock(this->pX, this->pY, 'u');
			this->setBlock(this->pX, this->pY + 1, 'p');
			this->coved = 'a';
		}
		else {
			//！！清空缓冲区
		}
	}
	else if (aim == 'h') {
		this->setBlock(this->pX, this->pY, this->coved);
		this->pY++;
		this->setBlock(this->pX, this->pY, 'u');
		this->coved = aim;
	}
	else if (aim == 'p') {
		char next = this->getType(this->getPos() + this->width * 2);
		if (next == 'a') {
			this->setBlock(this->pX, this->pY, this->coved);
			this->pY++;
			this->setBlock(this->pX, this->pY, 'u');
			this->setBlock(this->pX, this->pY + 1, 'b');
			this->coved = 'h';
		}
		else if (next == 'w' || next == 'p' || next == 'b') {
			//动不了呀
		}
		else if (next == 'h') {
			this->setBlock(this->pX, this->pY, this->coved);
			this->pY++;
			this->setBlock(this->pX, this->pY, 'u');
			this->setBlock(this->pX, this->pY + 1, 'p');
			this->coved = 'h';
		}
		else {
			//！！清空缓冲区
		}
	}

	else {
		//!!清空缓冲区
	}
}

void Plat::moveUp(char op)
{
	char aim = this->getType(this->getPos() - this->width);
	if (aim == 'a') {
		this->setBlock(this->pX, this->pY, this->coved);
		this->pY--;
		this->setBlock(this->pX, this->pY, 'u');
		this->coved = 'a';
	}
	else if (aim == 'w') {
		//动不了呀
	}
	else if (aim == 'p') {
		char next = this->getType(this->getPos() - this->width * 2);
		if (next == 'a') {
			this->setBlock(this->pX, this->pY, this->coved);
			this->pY--;
			this->setBlock(this->pX, this->pY, 'u');
			this->setBlock(this->pX, this->pY - 1, 'b');
			this->coved = 'h';
		}
		else if (next == 'w' || next == 'p' || next == 'b') {
			//动不了呀
		}
		else if (next == 'h') {
			this->setBlock(this->pX, this->pY, this->coved);
			this->pY--;
			this->setBlock(this->pX, this->pY, 'u');
			this->setBlock(this->pX, this->pY - 1, 'p');
			this->coved = 'h';
		}
		else {
			//！！清空缓冲区
		}
	}
	else if (aim == 'b') {
		char next = this->getType(this->getPos() - this->width * 2);
		if (next == 'a') {
			this->setBlock(this->pX, this->pY, this->coved);
			this->pY--;
			this->setBlock(this->pX, this->pY, 'u');
			this->setBlock(this->pX, this->pY - 1, aim);
			this->coved = 'a';
		}
		else if (next == 'w' || next == 'p' || next == 'b') {
			//动不了呀
		}
		else if (next == 'h') {
			this->setBlock(this->pX, this->pY, this->coved);
			this->pY--;
			this->setBlock(this->pX, this->pY, 'u');
			this->setBlock(this->pX, this->pY - 1, 'p');
			this->coved = 'a';
		}
		else {
			//！！清空缓冲区
		}
	}
	else if (aim == 'h') {
		this->setBlock(this->pX, this->pY, this->coved);
		this->pY--;
		this->setBlock(this->pX, this->pY, 'u');
		this->coved = aim;
	}
	
	else {
		//!!清空缓冲区
	}

}






//改成友元就不需要这样写了
std::list<Block> Plat::getList()
{
	return this->ctn;

}

std::list<std::string> Plat::getsample()
{
	return this->sampleSet;
}

int Plat::getPos()
{
	return ((this->pY) * this->width + this->pX);
}

char Plat::getType(int pos)
{
	int x = pos % this->width;
	int y = pos / this->width;
	std::list<std::string>::iterator iter = this->sampleSet.begin();
	int i = 0;
	while (i++ != y) {
		++iter;
	}
	return (*iter)[x];
}

char Plat::setBlock(int x, int y, char s)
{
	std::list<std::string>::iterator iter = this->sampleSet.begin();
	int i = 0;
	while (i != y) {
		++iter;
		++i;
	}
	(*iter)[x] = s;
	return s;
}

char Plat::setBlock(int pos, char s)
{
	std::list<std::string>::iterator iter = this->sampleSet.begin();
	int i = 0;
	while (i != (pos / (this->width))) {
		++iter;
		++i;
	}
	(*iter)[(pos % (this->width))] = s;
	return s;
}



int Plat::ViewShow()
{
	

	int timeout = (this->count++ != 0) ? 0 : 100;

	std::list<Block>::iterator iter = this->ctn.begin();
	std::cout << std::endl;
	for (int l = 0; l != this->height; ++l) {
		std::string temp[4];
		for (int i = 0; iter != this->ctn.end() && i != this->width; ++iter, ++i) {  

			Block b = *iter;
			std::list <std::string> blist = b.getlist();
			std::list<std::string>::iterator biter = blist.begin();
			for (int j = 0; biter != blist.end(); ++biter, ++j) {
				temp[j] += *biter;
			}

		}
		std::cout << temp[0] << std::endl;
		Sleep(timeout);
		std::cout << temp[1] << std::endl;
		Sleep(timeout);
		std::cout << temp[2] << std::endl;
		Sleep(timeout);
		std::cout << temp[3] << std::endl;
		Sleep(timeout);
	}
	return 0;
}

int Plat::ParamShow()
{
	system("cls");
	if (this->checkSucceed()) {
	return 1;
	}
	std::cout << std::endl << "(" << this->pX << "," << this->pY << ")";
	std::cout << "  count:" << this->count;

	return -1;
}

int Plat::isExist(char ch)
{
	std::list<std::string>::iterator iter = this->sampleSet.begin();
	for (int i = 0; iter != sampleSet.end(); ++iter, ++i) {
		for (int j = 0; j != this->width; ++j) {  //j对应着x
			if (ch == (*iter)[j]) {
				return(j + (i * this->width));
			}
		}
	}

	return -1;
}
int Plat::getIndex()
{
	return this->index;
}
char Plat::setCoved(char op)
{
	this->coved = op;
	return op;
}
bool Plat::checkSucceed()
{
	if (this->isExist('h') == -1 && this->coved!='h' && this->index >0 ) {
		return true;
	}
	else {
		return false;
	}
}

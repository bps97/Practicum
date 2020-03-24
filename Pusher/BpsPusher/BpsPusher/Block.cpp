#include "pch.h"
#include "Block.h"
#include <iostream>

Block::Block()
{
}

Block::Block(std::string type, std::string *p, size_t len)
{
	this->type = type;
	for (int i = 0; i != len; ++i,++p) {
		//std::cout <<type<< "构造函数：" << *p << std::endl;
		this->ctn.push_back(*p);
	}
}


Block::~Block()
{
}

std::list<std::string> Block::getlist()
{
	return this->ctn;
}

Block Block::generateBox()
{
	std::string style[] = { "++++++++","+  00  +","+  00  +","++++++++" };
	size_t slen = sizeof(style) / sizeof(style[0]);
	Block b("box", style, slen);
	return b;
}

Block Block::generateWall()
{
	std::string style[] = { "¤¤¤¤","¤¤¤¤","¤¤¤¤","¤¤¤¤" };
	size_t slen = sizeof(style) / sizeof(style[0]);
	Block b("wall", style, slen);
	return b;
}

Block Block::generateHole()
{
	std::string style[] = { "        ","  $$$$$ ","  $$$$$ ","        " };
	size_t slen = sizeof(style) / sizeof(style[0]);
	Block b("hole", style, slen);
	return b;
}

Block Block::generatePatch()
{
	std::string style[] = { "■■■■","■over■","■ride■","■■■■" };
	size_t slen = sizeof(style) / sizeof(style[0]);
	Block b("patch", style, slen);
	return b;
}

Block Block::generateAir()
{
	std::string style[] = { "        ","        ","        ","        " };
	size_t slen = sizeof(style) / sizeof(style[0]);
	Block b("air", style, slen);
	return b;
}

Block Block::generatePlayer()
{
	std::string style[] = { "    o   ","  *-+-* ","    |   ","   / \\  " };
	size_t slen = sizeof(style) / sizeof(style[0]);
	Block b("palyer", style, slen);
	return b;
}



Block Block::generateIII()
{
	std::string style[] = { "▇▃▃▇","▇      ","▇      ","▇      " };
	size_t slen = sizeof(style) / sizeof(style[0]);
	Block b("i", style, slen);
	return b;
}

Block Block::generateOOO()
{
	std::string style[] = { "    ","▃▃▃▃","▇    ▇","▇    ▇" };
	size_t slen = sizeof(style) / sizeof(style[0]);
	Block b("o", style, slen);
	return b;
}



Block Block::generateUUU()
{
	std::string style[] = { "     ","▃  ▃ ","▇  ▇ ","▇▃▇ " };
	size_t slen = sizeof(style) / sizeof(style[0]);
	Block b("u", style, slen);
	return b;
}

Block Block::generateSSS()
{
	std::string style[] = { "         ","▃▃▃ ","▇▃▃ ","▃▃▇ " };
	size_t slen = sizeof(style) / sizeof(style[0]);
	Block b("s", style, slen);
	return b;
}

Block Block::generateHHH()
{
	std::string style[] = { "▇     ","▇▃▃ ","▇  ▇ ","▇  ▇ " };
	size_t slen = sizeof(style) / sizeof(style[0]);
	Block b("h", style, slen);
	return b;
}



Block Block::generateEEE()
{
	std::string style[] = { "         ","▃▃▃ ","▇▃▇ ","▇▃▃ " };
	size_t slen = sizeof(style) / sizeof(style[0]);
	Block b("e", style, slen); //符号一
	return b;
}

Block Block::generateRRR()
{
	std::string style[] = { "         ","▃  ▃ ","▇▃ ","▇     " };
	size_t slen = sizeof(style) / sizeof(style[0]);
	Block b("r", style, slen); 
	return b;
}




#include "pch.h"
#include "StyleBox.h"


StyleBox::StyleBox()
{
	this->ctn.insert(std::pair<char, Block>('u', Block::generatePlayer()));
	this->ctn.insert(std::pair<char, Block>('a', Block::generateAir()));
	this->ctn.insert(std::pair<char, Block>('b', Block::generateBox()));
	this->ctn.insert(std::pair<char, Block>('w', Block::generateWall()));
	this->ctn.insert(std::pair<char, Block>('p', Block::generatePatch()));
	this->ctn.insert(std::pair<char, Block>('h', Block::generateHole()));

	this->ctn.insert(std::pair<char, Block>('O', Block::generateOOO()));
	this->ctn.insert(std::pair<char, Block>('I', Block::generateIII()));
	this->ctn.insert(std::pair<char, Block>('U', Block::generateUUU()));
	this->ctn.insert(std::pair<char, Block>('S', Block::generateSSS()));
	this->ctn.insert(std::pair<char, Block>('H', Block::generateHHH()));
	this->ctn.insert(std::pair<char, Block>('E', Block::generateEEE()));
	this->ctn.insert(std::pair<char, Block>('R', Block::generateRRR()));

}


StyleBox::~StyleBox()
{

}

Block StyleBox::getBlock(char key)
{
	
	std::map<char, Block>::iterator iter = this->ctn.find(key);
	if (iter != ctn.end()) {
		return iter->second;
	}else {	
		return Block();
	}
}


//���ڴ洢Block�ĸ�����ʽ
#include<map>
#include<utility>
#include"Block.h"
class StyleBox
{
public:
	StyleBox();
	~StyleBox();
	std::map<char, Block> ctn;//container��д
	Block getBlock(char key);

};


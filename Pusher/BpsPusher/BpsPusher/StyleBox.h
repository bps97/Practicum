//用于存储Block的各种样式
#include<map>
#include<utility>
#include"Block.h"
class StyleBox
{
public:
	StyleBox();
	~StyleBox();
	std::map<char, Block> ctn;//container缩写
	Block getBlock(char key);

};


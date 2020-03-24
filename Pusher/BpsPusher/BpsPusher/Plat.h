
#include "StyleBox.h"
#include <list>
//
class Plat
{
public:
	Plat(std::string *basestrs, size_t width, size_t height, int index);
	Plat();

	static Plat importMap(int index);
	static std::string getUrl( int index);
	
	void generateMap();
	
	int ViewShow();
	int ParamShow();

	bool checkSucceed();
	int isExist(char ch);

	int getPos();
	int getIndex();
	std::list<Block> getList();
	std::list<std::string> getsample();
	char getType(int pos);
	char setCoved(char op);

	char setBlock(int x, int y, char s);
	char setBlock(int pos, char s);
	void addBlock(char op);//在地图上添加方块

//管理员移动
	void moveAdmin(char op);
	void moveUpAdmin(char op);
	void moveDownAdmin(char op);
	void moveLeftAdmin(char op);
	void moveRightAdmin(char op);
//玩家移动
	void move(char op);
	void moveRight(char op);
	void moveLeft(char op);
	void moveDown(char op);
	void moveUp(char op);

private:
	int width,height;//高  地图尺寸
	int pX, pY;//玩家坐标
	char coved;//需要存储被人覆盖的方块类型
	int count;
	int index;
	void InitMap(std::string *basestrs,size_t len);
	std::list<std::string> sampleSet; 
	std::list<Block> ctn;//数据容器
};

#include"Plat.h"
#include <utility>
class Game
{
public:
	Game();
	~Game();
	void start(int index);
	void Opeara(Plat &map);
	
	void showIndex();
	void showCatagory();
	void showDefineMap();

	void saveMap(Plat map);
	int getMaxIndex();

	void append(int index, Plat map);
	Plat getMap(int index);
	
private:
	int index;
	bool flag;
	std::map<int, Plat> ctn;
};


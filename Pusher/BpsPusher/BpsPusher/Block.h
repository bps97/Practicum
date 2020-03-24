#include <string>
#include <utility>
#include <list>
#include <iostream>
class Block
{
public:
	Block();
	Block(std::string type, std::string *p, size_t len);
	
	~Block();

	std::list<std::string> getlist();

	static Block generateBox();
	static Block generateWall();
	static Block generateHole();
	static Block generatePatch();
	static Block generateAir();
	static Block generatePlayer();

	static Block generateOOO();
	static Block generateIII();
	static Block generateUUU();
	static Block generateSSS();
	static Block generateHHH();
	static Block generateEEE();
	static Block generateRRR();
private:
	std::string type;
	std::list<std::string>  ctn;
};


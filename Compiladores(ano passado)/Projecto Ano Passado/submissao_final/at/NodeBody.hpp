#ifndef _NODEBODY_HH_
#define _NODEBODY_HH_

#include "NodeQuad.hpp"

class NodeBody : public NodeQuad {
public:
	inline NodeBody(Node& arg1, Node& arg2, Node& arg3, Node& arg4, int lineno = 0) :
		NodeQuad (arg1, arg2, arg3, arg4, lineno) { }
	void accept(Compiler& c);
	void print(std::ostream *out = 0);
};
#endif /* _NODEBODY_HH_ */

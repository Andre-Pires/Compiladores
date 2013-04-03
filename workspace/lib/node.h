/* $Id: node.h,v 1.3 2004/12/09 17:24:33 prs Exp $ */
#ifndef __NODE_H__ 
#define __NODE_H__ 

#include <stdio.h> /* for FILE argument to printNode and scanNode */

#ifdef _64bits_
typedef long long regint;
#define PRTREG "%lld"
#define strtol strtoll
#else
typedef int regint;
#define PRTREG "%d"
#endif


typedef enum{ nodeNil, nodeInt, nodeStr, nodeReal, nodeData, nodeOpr }NodeType; 
 
typedef struct typeNode Node;
struct typeNode { 
    NodeType type;              /* type of node */ 
    void *user;			/* pointer to any user data */ 
    int   attrib;		/* user defined attributes */
    int   line;			/* input file parse line */
    void *state;		/* for the instruction selector (burg) */ 
    int   place;		/* register used */
    union {
      regint i;                 /* value of literal integer */ 
      double r;                 /* value of literal real number */ 
      char *s;                  /* value of literal string (null terminated) */ 
      struct {
	int size;		/* size of data */
	void *data;             /* pointer to data */ 
      } d;			/* value of any opaque data (untyped) */
      struct {
	int num;		/* number os subnode in this node */
	Node *n[1];  		/* subnodes (expandable) */ 
      } sub;
    } value;
}; 

/* prototypes */
Node *uniNode(int attrib, Node *n1);
Node *binNode(int attrib, Node *n1, Node *n2);
Node *triNode(int attrib, Node *n1, Node *n2, Node *n3);
Node *subNode(int attrib, int nops, ...);
Node *nilNode(int attrib);
Node *intNode(int attrib, regint i);
Node *realNode(int attrib, double d);
Node *dataNode(int attrib, int size, void *user);
Node *strNode(int attrib, char *s);
Node *addNode(Node *base, Node *node, unsigned pos);
Node *removeNode(Node *base, unsigned pos);
void *userNode(Node *p, void *user);
void freeNode(Node *p);
void printNode(Node *p, FILE *fp, char *tab[]);
Node *newNode(NodeType t, int attrib, int nops);
 
#endif /* __NODE_H__ */

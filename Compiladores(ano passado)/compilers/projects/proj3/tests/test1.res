 Number of Registers: 4
	r3 = ARP + 8
	r3 = *r3
	r0 = r3 + 1
	*r3 = r0
	r2 = ARP + 12
	r2 = *r2
	r0 = r3 + r2
	r1 = ARP + 4
	*r1 = r0
	r0 = r2
	r1 = ARP + 16
	*r1 = r0
	r1 = ARP + 4
	r1 = *r1
	r0 = r1 + r3
	r1 = ARP + 20
	*r1 = r0
 Number Load Operations: 3
 Number Store Operations: 4

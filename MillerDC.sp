AC Simulation of an NMOS input single-ended diff pair 

* Calling the technology file
.lib './TSMC_90nm.l' TT

* Amplifier nestlist

M1	3	vin-	2	dd	pch	W=3.7u	L=0.1u	M=1
M2	4	vin+	2	dd	pch	W=3.7u	L=0.1u	M=1

M3	3	3	ss	ss	nch	W=0.925u	L=0.1u	M=1
M4	4	3	ss	ss	nch	W=0.925u	L=0.1u	M=1

M5	vout	4	ss	ss	nch	W=0.577u	L=0.1u	M=1
M6	vout	1	dd	dd	pch	W=2.311u	L=0.1u	M=1

M7	2	1	dd	dd	pch	W=2.311u	L=0.1u	M=1
M8	1	1	dd	dd	pch	W=18.488u	L=0.1u	M=1

Ib	1	ss	dc=1000u

vdd	dd	0	dc=1.2
vss	ss	0	dc=0

Cc	5	vout	1p
Cl	vout	ss	1p
Rc	4	5	383.74

***********************************************************
** DC simulation
.param vin=0

.dc	vin	0	1.2	0.0001

v1	vin+	ss	dc=vin
v2	vin-	ss	dc=vin

.probe
.end
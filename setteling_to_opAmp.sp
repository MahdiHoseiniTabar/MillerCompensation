Transiaent simulation of a NMOS input single-ende diff pair

* Calling the technology file
.lib './TSMC_90nm.l' TT

* Amplifier nestlist


M1	3	vin-	2	dd	pch	W=10.5u	L=0.2u	M=2
M2	4	vin+	2	dd	pch	W=10.5u	L=0.2u	M=2

M3	3	3	ss	ss	nch	W=2.675u	L=0.2u	M=2
M4	4	3	ss	ss	nch	W=2.675u	L=0.2u	M=2

M5	vout	4	ss	ss	nch	W=18.09u	L=0.2u	M=2
M6	vout	1	dd	dd	pch	W=72.36u	L=0.2u	M=2

M7	2	1	dd	dd	pch	W=21u	L=0.2u	M=2
M8	1	1	dd	dd	pch	W=0.5u	L=0.2u	M=2

Ib	1	ss	dc=15.50u

vdd	dd	0	dc=1.2
vss	ss	0	dc=0

Cc	vout	5	1p
Cl	vout	ss	1p
Rc	4	5	30

***********************************************************
** Transient simulation	

vpulse1	    vin+	0	pulse(0 	0.4	0n	0n	0n	6n	6n)
v0	vin-	0 dc=0	

.option accurate=1
.tran 0.02n 5.5n
.probe
.end
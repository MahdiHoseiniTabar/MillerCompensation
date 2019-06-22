Transiaent simulation of a NMOS input single-ende diff pair

* Calling the technology file
.lib './TSMC_90nm.l' TT

* Amplifier nestlist


M1	3	vin-	2	dd	pch	W=23u	L=0.2u	M=1
M2	4	vin+	2	dd	pch	W=23u	L=0.2u	M=1

M3	3	3	ss	ss	nch	W=6u	L=0.2u	M=1
M4	4	3	ss	ss	nch	W=6u	L=0.2u	M=1

M5	vout	4	ss	ss	nch	W=36.18u	L=0.2u	M=1
M6	vout	1	dd	dd	pch	W=144.75u	L=0.2u	M=1

M7	2	1	dd	dd	pch	W=46u	L=0.2u	M=1
M8	1	1	dd	dd	pch	W=1u	L=0.2u	M=1

Ib	1	ss	dc=12.50u

vdd	dd	0	dc=1.2
vss	ss	0	dc=0

Cc	vout	5	1p
Cl	vout	ss	1p
Rc	4	5	50

***********************************************************
** Transient simulation	

vpulse1	    vin+	0	pulse(0 	0.4	0n	0n	0n	5n	5n)
v0	vin-	0 dc=0	

.option accurate=1
.tran 0.02n 5.5n
.probe
.end
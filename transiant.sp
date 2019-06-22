Transiaent simulation of a NMOS input single-ende diff pair

* Calling the technology file
.lib './TSMC_90nm.l' TT

* Amplifier nestlist

M1	3	vin-	2	dd	pch	W=18.5u	L=0.5u	M=1
M2	4	vin+	2	dd	pch	W=18.5u	L=0.5u	M=1

M3	3	3	ss	ss	nch	W=4.625u	L=0.5u	M=1
M4	4	3	ss	ss	nch	W=4.625u	L=0.5u	M=1

M5	vout	4	ss	ss	nch	W=144.75u	L=0.5u	M=1
M6	vout	1	dd	dd	pch	W=579.05u	L=0.5u	M=1

M7	2	1	dd	dd	pch	W=37u	L=0.5u	M=1
M8	1	1	dd	dd	pch	W=3.7u	L=0.5u	M=1

Ib	1	ss	dc=12.50u

vdd	dd	0	dc=1.2
vss	ss	0	dc=0

Cc	vout	5	1p
Cl	vout	ss	1p
Rc	4	5	21.8

***********************************************************
** Transient simulation	

CH	im0	vin-	1p

*Ideal switches in Hspice
g1	input	im0	vcr	pwl(1)	ph1	0	0.0v,10meg	1.2v,10
g2	im0	vout	vcr	pwl(1)	ph2	0	0.0v,10meg	1.2v,10
g3	vin-	vout	vcr	pwl(1) 	ph1	0	0.0v,10meg	1.2v,10

*clock	phases
vph1	ph1	0 	pulse(0		1.2	0	0.2n	0.2n	5.35n	12.5n)
vph2	ph2	0 	pulse(0		1.2	6.25n	0.2n	0.2n	5.35n	12.5n)

vpulse1	    input	0	pulse(0.7	1	0	0.1n	0.1n	5n	10n)
*vpulse2    input	0	pulse(1		0.7	0	0.1n	0.1n	5n	10n)
vcmi	vin+		dc=0.3

.option accurate=1
.tran 0.002n 50n
.probe
.end













 
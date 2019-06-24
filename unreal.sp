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

CH	vin-	im0	1p

*Ideal switches in Hspice
M9	im0	vp1+	input	ss	nch	W=1u	L=0.2u	M=1
M10	input	vp1-	im0	dd	pch	W=1u	L=0.1u	M=2
M11	vout	vp2+	im0	ss	nch	W=1u	L=0.2u	M=1
M12	im0	vp2-	vout	dd	pch	W=1u	L=0.1u	M=2
M13	v0	vp1+	vin-	ss	nch	W=1u	L=0.2u	M=1
M14	vin-	vp1-	v0	dd	pch	W=1u	L=0.1u	M=2
*g1	input	im0	vcr	pwl(1)	ph1	0	0.0v,10meg	1.2v,10
*g2	im0	vout	vcr	pwl(1)	ph2	0	0.0v,10meg	1.2v,10
*g3	vin-	v0	vcr	pwl(1) 	ph1	0	0.0v,10meg	1.2v,10

*clock	phases
vph1	ph1	0 	pulse(0		1.2	0	0.2n	0.2n	5.35n	12.5n)
vph2	ph2	0 	pulse(0		1.2	6.25n	0.2n	0.2n	5.35n	12.5n)

vpulse1	    input	0	pulse(0 	0.4	0	0n	0n	6.25n	12.5n)
vp1	vp1+	0	pulse(0	1.2	0	0.2n	0.2n	5.35n	12.5n)
vp1B	vp1-	0	pulse(0	1.2	5.55n	0.2n	0.2n	6.75n	12.5n)
vp2	vp2+	0	pulse(0	1.2	6.25n	0.2n	0.2n	5.35n	12.5n)
vp2B	vp2-	0	pulse(0	1.2	11.8n	0.2n	0.2n	6.75n	12.5n)
*vpulse2    input	0	pulse(1		0.7	0	0.1n	0.1n	5n	10n)

vcmi	vin+	0	dc=0.3
vdc	vout	v0	dc=0.3

.option accurate=1
.tran 0.02n 36n
.probe
.end













 
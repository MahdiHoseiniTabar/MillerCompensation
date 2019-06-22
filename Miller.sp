AC Simulation of an NMOS input single-ended diff pair 

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
M8	1	1	dd	dd	pch	W=4.6u	L=0.2u	M=1

Ib	1	ss	dc=12.50u

vdd	dd	0	dc=1.2
vss	ss	0	dc=0

Cc	vout	5	1p
Cl	vout	ss	1p
Rc	4	5	300

***********************************************************
** AC simulation

vinac	vin+	im0	ac=1
vindc1    im0       ss      dc=0.3
vindc2    vin-      ss      dc=0.3

.ac   dec  50  10    2g
.option  acout=0
.probe   vdb(vout, ss)
.probe   vp(vout, ss)

.measure   ac  gain           find  vdb(vout, ss) at=15
.measure   ac  unity_gain     when  vdb(vout, ss)=0
.measure   ac  phase_margin   find  vp(ss, vout) when vdb(vout, ss)=0
.probe
.end
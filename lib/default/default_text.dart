String defaultKirishTili = """A	аффикс	affiks
A1	аффиксы образующие слова	so`z yasovchi affikslar
A2	аффиксы образующие форму	shakl yasovchi affikslar
A3	аффиксы изменяющие слова	so`z o`zgartiruvchi affikslar
A4	аффикс для других оснований	boshqa asoslar uchun affiks
A5	аффикс "аро"	"aro" affiksi
A6	аффикс "умум"	"umum" affiksi
ADS	аффикс-предлог для существительного	ot uchun ko`makchi-affiks
AG	аффикс-глагол	fe`l-affiks
AC	аффикс-существительное	ot-affiks
ADP	аффикс-предлог для прилагательного	sifat uchun ko`makchi-affiks
B	постфикс	postfiks
C	сеществительное	ot so`z turkumi
CC	база слов принадлежащих к сеществительному	ot so`z turkumiga qarashli so`zlar ombori
D	предлог	ko`makchi
E	вспомогательные части предложения	gapning yordamchi bo`laklari
E1	повествовательные предложения	darak gaplar
E2	вопросительные предложения	so`roq gaplar
E3	восклицательные предложения	undov gaplar
E4	отрицательное предложение	inkor gaplar
E5	подлежащее	ega
E6	определитель	aniqlovchi
E7	дополнение	to`ldiruvchi
E8	обстоятельство	hol
EE1	база слов принадлежащих к повествовательному предложению	darak gapga qarashli so`zlar ombori
EE2	база слов принадлежащих к вопросительному предложению	so`roq gapga qarashli so`zlar ombori
EE3	база слов принадлежащих к восклицательному предложению	undov gapga qarashli so`zlar ombori
EE4	база слов принадлежащих к отрицательному предложению	inkor gapga qarashli so`zlar ombori
EVX	входное предложение	kirish gap
EVIX	выходное предложение	chiqish gap
F	числительное	son so`z turkumi
FF	база слов принадлежащих к числительному	son so`z turkumiga qarashli so`zlar ombori
G	глагол	fe`l
G1	послелог	ko`makchi (so`ng ko`makchi)
G2	сказуемое	kesim
GG	база слов принадлежащих к глаголу	fe`l so`z turkumiga qarashli so`zlar ombori
H	переменная	o`zgaruvchan
I	переменная	o`zgaruvchan
J	переменная	o`zgaruvchan
K	корень	o`zak
L	модальные слова	modal so`zlar
L1	слова	so`zlar
M	местоимение	olmosh
MM	база слов принадлежащих к местоимению	olmoshga qarashli so`zlar ombori
M1	личное местоимение	kishilik olmoshi
M2	возвратное местоимение	o`zlik olmoshi
M3	указательное местоимение	ko`rsatish olmoshi
M3A	аффиксы указательного местоимения	ko`rsatish olmoshi affikslari
M4	вопросительное местоимение	so`roq olmoshi
M4A	аффиксы вопросительного местоимения	so`roq olmoshi affikslari
M5	определительное местоимение	belgilash olmoshi
M6	местоимение отрицания	inkor olmoshi
M7	неопределленное местоимение	gumon olmoshi
M8	морфема "алла"	"alla" morfemasi
N	наречие	ravish
NN	база слов принадлежащих к наречию	ravishga oid so`zlar ombori
O	окончание	qo`shimcha
P	прилагательное	sifat so`z turkumi
P1	уменьшителная степень прилагательного	sifatning kichraytirish darajasi
P2	увеличительная степень прилагательного	sifatning ortirma darajasi
P3	причастие I	sifatdosh I
P4	причастие II	sifatdosh II
PP	база слов принадлежащих к прилагательному	sifatga oid so`zlar ombori
Q	специальные базы данных	maxsus ma`lumotlar ombori
Q1	база всех корневых слов языка	tilning barcha tub so`zlar ombori
Q2	база всех производных слов языка	tilning barcha yasama so`zlar ombori
Q3	база частей предложений языка	tilning gap bo`laklari ombori
Q4	база по типам слов языка	tilning so`z turlari ombori
R	предметные базы данных	fan ma`lumotlar ombori
R_I	база терминов и фраз по предметным областям	fan bo`yicha ibora va terminlar ombori
S	суффикс	so`z yasovchi qo`shimcha
SF	суффикс формирующий слов	so`zlarni shakllantiruvchi suffiks
T	приставка	old qo`shimcha
T1	приставки наречия	ravish old qo`shimchasi
T2	множество слов из входного языка А с их назначениями в предложении	A kirish tili ko`p so`zlarining gapdagi vazifasi
T3	множество слов из выходного языка В с их назначениями в предложении	B chiqish tili ko`p so`zlarining gapdagi vazifasi
U	частица	yuklama
U1	отрицательная частица	inkor yuklamasi
U2	залоговая частица	bog`lanish yuklamasi
U3	частицы наклонения	mayl yuklamasi
U4	частицы указывающие на время глагола	fe`lning vaqtini ko`rsatuvchi yuklamalar
U5	частицы лица 	shaxs yuklamalari
V	общие базы данных	umumiy ma`lumotlar ombori
W	морфема 	so`zning ma`noli qismi
X	суффиксы множественных чисел	ko`plikdagi so`z yasovchi qo`shimchalar
X2	суффиксы подлежащих	eganing so`z yasovchi qo`shimchalari
X3	суффиксы падежей	kelishiklarning so`z yasovchi qo`shimchalari
X4	восклицательные слова	undov so`zlar
X5	слова подражания	taqlid so`zlar
X6	слова обозначающие действия	harakatni bildiruvchi so`zlar
Y	союз	bog`lovchi
Z	слова единственных чисел	birlikdagi so`zlar""";

String otAfiksatsiya =
    "( \$[i,1/h1](C[i]) *↓\$[j,1/33]C(A1[j]) *↓X *↓\$[s,1/10](X2[s]) *↓\$[t,1/5](X3[t]) *↓\$[r,1/6]U(A1[r]) ) V "
    "( ↓C(A1) *\$[i,1/h1](C[i]) *↓\$[j,1/33]C(A1[j]) *↓X *↓\$[s,1/10](X2[s]) *↓\$[t,1/5](X3[t]) *↓\$[r,1/6]U(A1[r]) ) V "
    "( \$[i,1/h3](G[i]) *\$[j,1/47]C(A1[j]) *↓X *↓\$[s,1/10](X2[s]) *↓\$[t,1/5](X3[t]) *↓\$[r,1/6]U(A1[r]) ) V "
    "( \$[i,1/h2](P[i]) *\$[j,1/6]C(A1[j]) *↓X *↓\$[s,1/10](X2[s]) *↓\$[t,1/5](X3[t]) *↓\$[r,1/6]U(A1[r]) ) V "
    "( \$[i,1/h4](F[i]) *\$[j,1/6]C(A1[j]) *↓X *↓\$[s,1/10](X2[s]) *↓\$[t,1/5](X3[t]) *↓\$[r,1/6]U(A1[r]) ) V "
    "( \$[i,1/h4](M[i]) *\$[j,1/6]C(A1[j]) *↓X *↓\$[s,1/10](X2[s]) *↓\$[t,1/5](X3[t]) *↓\$[r,1/6]U(A1[r]) ) V "
    "( \$[i,1/h4](N[i]) *\$[j,1/6]C(A1[j]) *↓X *↓\$[s,1/10](X2[s]) *↓\$[t,1/5](X3[t]) *↓\$[r,1/6]U(A1[r]) )";

String otKompozitsiya =
    "( \$[i,1/h1](C[i]) *↓\$[j,1/h1](C[j]) *↓X *↓\$[s,1/10](X2[s]) *↓\$[t,1/5](X3[t]) *↓\$[r,1/6]U(A1[r]) ) V"
    "( \$[i,1/h2](P[i]) *↓\$[j,1/h1](C[j]) *↓X *↓\$[s,1/10](X2[s]) *↓\$[t,1/5](X3[t]) *↓\$[r,1/6]U(A1[r]) ) V"
    "( \$[i,1/h4](F[i]) *↓\$[j,1/h1](C[j]) *↓X *↓\$[s,1/10](X2[s]) *↓\$[t,1/5](X3[t]) *↓\$[r,1/6]U(A1[r]) ) V"
    "( \$[i,1/h1](F[i]) *↓\$[j,1/h3](G[j]) *↓X *↓\$[s,1/10](X2[s]) *↓\$[t,1/5](X3[t]) *↓\$[r,1/6]U(A1[r]) ) V"
    "( \$[i,1/h7](N[i]) *\$[j,1/h8](P3[j]) *↓\$[k,1/h9](X6[k]) *↓X *↓\$[s,1/10](X2[s]) *↓\$[t,1/5](X3[t]) *↓\$[r,1/6]U(A1[r]) ) V"
    "( \$[i,1/h1](C[i]) *\$[j,1/h8](P3[j]) *↓\$[k,1/h9](X6[k]) *↓X *↓\$[s,1/10](X2[s]) *↓\$[t,1/5](X3[t]) *↓\$[r,1/6]U(A1[r]) )";

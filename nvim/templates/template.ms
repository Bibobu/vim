.so macros.ms
\n[FAM] Hack
.TL
Groff cheat sheet
.AU
G.Clavier
.NH
Groff
.PP
Groff est un outil de formattage de documents pdf. Il existe plusieurs langage formattage, ce document défail le format ms.
.BL
La commande .TL précède le titre.
.BL
La commande .AU précède l'auteur.
.BL
La commande .PP précède les paragraphes.
.BL
La commande .NH précède les en-têtes numérotés.
.BL
La commande .SH précède les en-têtes non numérotés.
.BL
La commande .IP précède les éléments d'une liste. Elle prend le caractère de
liste en argument : .Pi \[bu] ou .PI \(bu fait une bullet list. On peut ajouter
un nombre qui gère l'écartement du texte.
.PP
Les commandes sont du texte à rentrer dans un fichier *.ms. Elles se situent en début de ligne. Certaines commandes peuvent prendre des arguments numériques.
.NH
Formattage du texte
.PP
On peut modifier du texte avec des commandes qui prennent en argument une
chaîne de caractères, ce qui suit la chaîne et ce qui vient avant (dans
l'ordre).  Par exemple
.B "gras" ) (
rendra le texte .B "gras" ) ( entre deux parenthèses normales.
On peut aussi utiliser:

.BL .UL pour
.UL "souligner"

.BL .BX pour 
.BX "encadrer"

.NH Les macros
.PP
On peut définir des macros entre ".de" et ".." (chacun en début de lignes). Ces macros peuvent éviter de
taper une commande avec les mêmes arguments de manière répétée.
Par exemple:
.BL .de BL \n .IP \[bu] 2 \n .. définit une macro .BL qui remplacera .IP \[bu] 2.
On peut stocker les macros dans un fichier et l'appeler avec la commande .so <adresse du fichier>.


# Proiect-Programare-Functionala
/*Anton Dumitrita 324CB*/

-TASK SET 2-
Task1:  myCompare2: functie de comparare a doua liste dupa a nr(dat ca parametru) valoare din ele
        myinsertBy2, insertSortBy2: aceleasi functii de sortare ca la primul taskset
        cu diferenta ca a fost adaugat parametrul nr folosit pentru ordonarea dupa coloana
        cu numarul nr
        countCol: returneaza numarul de ordine al coloanei cu numele dat caa parametru
        tsort: sorteaza tabela dupa coloana cu ordinul nr folosind insertSortBy2 si myCompare2

Task2: compareHeader: compara headerele a doua tabele, verificand fiecare element al acestora
        vunion: daca headerele celor doua tabele sunt egale concateneaza primul tabel
        cu cel de-al doilea tabel(fara header). In caz contrar, returneaza primul tabel

Task3: makeEmpty: creaza o lista cu k string-uri vide (k este lungimea unei liste din tabelul ce trebuie completat)
        completer: completeaza tabelul cu k liste cu stringuri vide (k este numarul de linii al tabelului cu mai multe elemente)
        unionSameLen: uneste liniile a doua tabele cu acelasi numar de elemente 
        hunion: completeaza mai intai tabelul mai scurt cu liste de stringuri vide apoi 
                foloseste unionSameLen pentru a realiza uniunea

Task5: helper: aplica operatia data ca parametru pe un rand al primului tabel si fiecare rand
                al celui de-al doilea tabel
        helper2: formeaza tabelul rezultat prin aplicarea operatiei pe fiecare rand al t1 si
                fiecare rand al t2 folosind prima funtie helper
        cartesian: concateneaza tabelul calulat anterior cu header-ul dat ca parametru

Task6: extract: extrage (sub forma de tabel) coloana cu numele dat ca parametru, din tabelul dat
                ca parametru
        projection: foloseste functia extract pentru a extrage fiecare coloana din lista
                de nume si functia unionSmeLen pentru a forma un singur tabel cu aceste coloane
        
Task7: filterTable: calculeaza nr de ordine al coloanei cu numele key_column 
                concateneaza header ul tabelului cu tabelul rezultat in urma filtrarii
                filtrarea se realizeaza cu functia filter, luand doar randurile a caror
                element din coloana cu ordinul nr, respecta conditia

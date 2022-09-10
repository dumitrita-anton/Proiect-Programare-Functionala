# Proiect-Programare-Functionala
/*Anton Dumitrita 324CB*/

--Anton Dumitrita 324CB--

Helpere pentru parsarea informatiei : functiile toString, toInt, toFloat -> conversie de tip

--Task1--
media_t1 -> calculeaza media pentru un rand si intoarce rezultatul in format String 
create_row_t1 -> creaza un rand de forma [Name, Average Number of Steps]
compute_average_steps -> creaza tabelul output prin aplicarea functiei create_row_t1 pe fiecare rand al tabelului input

--Task2--
suma -> calculeaza suma elementelor unui rand
get_passed_people_num -> verifica daca suma de pe fiecare rand indeplineste conditia din enunt si numara cate randuri indeplinesc aceasta conditie

get_passed_people_percentage -> calculeaza raportul dintre suma rezultata la prima parte a task-ului si numarul de randuri al tabelului

suma_medii -> calculeaza suma mediilor rezultate la task1
get_steps_avg -> media totala ca raportul dintre suma mediilor si numarul de randuri din tabel (aka numarul de medii)


--Task3--
media_t3 -> calculeaza media aritmetica pentru un rand
get_avg_steps_per_h -> transpune tabelul dat ca input pentru a calcula media pe fiecare coloana

--Task4--
range1, range2, range3 -> numara pentru o lista cate elemente se afla in range-ul din conditie
trunc_list, compute_activity -> creaza un tabel cu ultimele 3 coloane din tabelul input
create_VeryActiveMinutes, create_FairlyActiveMinutes, create_LightlyActiveMinutes -> retruneaza fiecare un rand cu 3 elemente ce reprezinta numarul de oameni din fiecare range pentru activitatea din numele functiei
get_activ_summary -> creaza tabelul output concatenand listele calculate anterior

--Task5--
alpha_order -> retruneaza relatia de ordine dintre doua string-uri
myCompare -> retruneaza relatia de ordine dintre doua randuri pe baza ultimului element din rand sau a primului
myinsertBy -> insereaza crescator (pe baza functiei comparator) un rand intr-o tabela
insertSortBy -> functia de sortare insertion sort, folosind functiile implementate anterior
create_list -> returneaza un rand construit cu primele doua elemente ale randului input
create_unsorted_table -> creaza tabela output cu primele doua coloane ale tabelei input
get_ranking -> sorteaza tabela creata anterior

--Task6--
mediat6 -> calculeaza media unei liste cu 4 elemente
create_row_t6 -> creaza un rand, calculand media primeleor 4 elemente din coada listei(care reprezinta primele 4h), media ultimelor 4 elemente din coada listei(ultimele 4h) si diferenta dintre cele doua
get_steps_diff_table -> aplica create_row_t6 pe fiecare rand al tabelului si sorteaza tabelul rezultat cu functia de sortare implementata la task5

--Task7--
vmap -> aplica functia data pe fiecare element al unui rand din tabel

--Task8--
rmap -> aplica functia data pe ficare rand al tabelului si concateneaza cu stringul input
get_sleep_total -> concateneaza primul element al randului cu suma elementelor din restul randului

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

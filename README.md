## Auteur
Coralie Boyer

## Explication
Le contract est lock et le but est de l'unlock. Pour ça il faut connaitre le contenue de data[2].
Le tableau est une variable privé donc il faut accéder au storage du contract. Data se trouve dans le slot 3 du storage et chaque valeur du tableau prend un slot car c'est bytes31. On veut acceder a l'index 2 du tableau coup 3+2 = 5 donc on accede au slot 5 pour avoir la data qui nous interesse
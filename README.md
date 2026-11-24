# my_printf

Bienvenue dans mon repository **my_printf** ! Ce projet consiste à recoder en C la fonction `printf` de la bibliothèque standard. L'objectif est de comprendre le fonctionnement des fonctions variadiques, la conversion de nombres dans différentes bases et l'écriture bas niveau sur la sortie standard.

## Sommaire

- [À propos](#à-propos)
- [Fonctionnalités](#fonctionnalités)
- [Installation](#installation)
- [Utilisation](#utilisation)
- [Structure du projet](#structure-du-projet)
- [Contributions](#contributions)

## À propos

**my_printf** reproduit le comportement de `printf` à partir de zéro, en utilisant uniquement `write` et les macros de `<stdarg.h>` (`va_start`, `va_arg`, `va_end`). En réalisant ce projet, on apprend à gérer un nombre variable d'arguments, à parcourir une chaîne de format et à afficher des nombres en base 10 et 16. Comme `printf`, la fonction renvoie le nombre de caractères affichés.

La bibliothèque est compilée sous forme d'archive statique (`libmyprintf.a`) pour être réutilisée dans d'autres projets.

## Fonctionnalités

### 1. Conversions supportées

- `%c` – Affiche un caractère.
- `%s` – Affiche une chaîne de caractères (`(null)` si le pointeur est `NULL`).
- `%p` – Affiche une adresse mémoire en hexadécimal, préfixée par `0x` (`(nil)` si `NULL`).
- `%d` / `%i` – Affiche un entier signé en base 10.
- `%u` – Affiche un entier non signé en base 10.
- `%x` – Affiche un nombre en hexadécimal minuscule.
- `%X` – Affiche un nombre en hexadécimal majuscule.
- `%%` – Affiche le caractère `%`.

### 2. Fonctions utilitaires

- `my_putchar`, `my_putstr` – Affichage de caractères et de chaînes.
- `my_putnbr`, `my_unsigned_putnbr` – Affichage d'entiers signés et non signés.
- `my_putnbr_base`, `my_putnbr_basemaj` – Affichage en hexadécimal (minuscule / majuscule).
- `my_putptr` – Affichage d'une adresse mémoire.

Chaque fonction renvoie le nombre de caractères écrits, ce qui permet à `my_printf` de calculer sa valeur de retour.

> Les flags, la largeur de champ et la précision (`%-5d`, `%.2s`, etc.) ne sont pas gérés.

## Installation

```sh
git clone https://github.com/AxelPj/Printf.git
cd Printf
make
```

Cette commande génère `libmyprintf.a`, la bibliothèque compilée à inclure dans d'autres projets.

Autres règles disponibles :

```sh
make clean    # supprime les fichiers objets
make fclean   # supprime les objets et la bibliothèque
make re       # recompile tout
```

## Utilisation

Dans le code source, incluez l'en-tête :

```c
#include "my_printf.h"

int main(void)
{
    int n;

    n = my_printf("Bonjour %s, tu as %d ans (0x%x)\n", "Axel", 25, 255);
    my_printf("%d caractères affichés\n", n);
    return (0);
}
```

Compilez votre programme avec l'archive :

```sh
gcc -Wall -Wextra -Werror votre_fichier.c libmyprintf.a -o votre_programme
```

## Structure du projet

- `my_printf.h` : en-tête contenant les prototypes de toutes les fonctions.
- `my_printf.c` : fonction principale, parcourt la chaîne de format.
- `my_parse_printf.c` : choisit la fonction d'affichage selon le caractère de conversion.
- `string_utils.c` : affichage de caractères et de chaînes.
- `conversion_utils.c` : affichage des nombres et des pointeurs.
- `Makefile` : règles `all`, `clean`, `fclean`, `re`.

## Contributions

Les contributions sont les bienvenues ! Pour proposer une modification :

1. Forker ce repository.
2. Créer une branche : `git checkout -b feature/nouvelle-fonctionnalite`
3. Committer : `git commit -m "Ajout d'une nouvelle fonctionnalité"`
4. Pousser : `git push origin feature/nouvelle-fonctionnalite`
5. Ouvrir une Pull Request.

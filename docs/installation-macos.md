# Installation de l'environnement de développement sur macOS

Vous allez prochainement participer à une édition Rails Girls, et c'est une très chouette nouvelle. Pour bien préparer votre venue et gagner du temps le jour J, nous vous *recommandons* de suivre ces instructions, depuis chez vous, quelques jours avant l'évènement.

Si vous rencontrez le moindre problème ou avez la moindre question, n'hésitez pas à nous contacter par email : contact@rubynantes.org. Nous pourrons vous aider à distance et débloquer à peu près n'importe quelle situation.

Enfin, sachez que cette procédure d'installation n'est pas du tout représentative de ce que vous allez apprendre pendant Rails Girls, où l'on réalisera ensemble des choses bien plus intéressantes !

---

## 1. Installation de Docker

1. Rendez-vous à l'adresse suivante : https://www.docker.com/products/docker-desktop

2. Si vous possédez un mac avec processeur M1, cliquez sur le bouton **Download for Mac with Apple Chip**. Sinon, cliquez sur le bouton **Download for Mac with Intel Chip**

3. Une fois téléchargé, lancez le programme d'installation **Docker.dmg**, et déplacer le programme **Docker** dans le répertoire **Applications** comme suggéré.

<p align="center">
  <img src="assets/macos-docker-1.png" width="788">
</p>

1. Lancez l'application **Docker** et acceptez les conditions d'utilisation.

<p align="center">
  <img src="assets/windows-docker-2.png" width="644">
</p>

5. L'installation de Docker est terminée. Félicitations !

---

## 2. Mise en place de l'application Touiteur

> *Touiteur* est l'application web que nous allons développer ensemble pendant la journée du samedi. Il s'agit d'une version *très* simplifiée de Twitter, que vous connaissez déjà.

1. Télécharger le code source de l'application à cette adresse : https://github.com/nantesrb/touiteur-docker/archive/refs/heads/main.zip

2. Décompressez l'archive ZIP dans le répertoire de votre choix en double-cliquant sur le fichier `touiteur-docker-main.zip`.

3. Lancez Spotlight (touches `cmd` + `espace`), puis recherchez et lancez l'application **Terminal**.

<p align="center">
  <img src="assets/macos-docker-2.png" width="792">
</p>

> :information_source: Vous pouvez également trouver l'application **Terminal** dans le répertoire **Applications** situé à la racine.

4. Dans la fenêtre **Terminal**, tapez `cd`, espace, puis glissez / déposez le dossier `touiteur-docker-main` à partir de l'explorateur de fichiers dans cette fenêtre.

Vous devriez alors avoir quelque chose qui ressemble à ceci :

<p align="center">
  <img src="assets/macos-docker-3.png" width="703">
</p>

5. Appuyez sur la touche **Entrée**.

6. Entrez ensuite la commande suivante :

```
docker-compose up --build
```

Puis appuyez sur **Entrée**. Cette étape peut prendre plusieurs minutes, selon la vitesse de votre connexion Internet.

<p align="center">
  <img src="assets/macos-docker-4.png" width="703">
</p>

7. L'installation et la mise en place sont terminées une fois que vous voyez `Listening on http://0.0.0.0:3000` :

8. Depuis votre navigateur, rendez-vous à l'adresse http://localhost:3000. Vous devriez alors voir la page d'accueil suivante :

<p align="center">
  <img src="assets/windows-docker-11.png" width="765">
</p>

---

## 3. Installer un éditeur de code

Nous recommandons l'utilisation des éditeurs suivants :

- Sublime Text (léger et largement suffisant) : https://www.sublimetext.com/
- VSCode (plus complet) : https://code.visualstudio.com/

---

Et voilà, tout est prêt ! On se revoit donc très vite pour la suite.

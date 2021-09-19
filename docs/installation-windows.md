# Installation de l'environnement de développement sur Windows

Vous allez prochainement participer à une édition Rails Girls, et c'est une très chouette nouvelle. Pour bien préparer votre venue et gagner du temps le jour J, nous vous *recommandons* de suivre ces instructions, depuis chez vous, quelques jours avant l'évènement. Cette opération devrait prendre

Si vous rencontrez le moindre problème ou avez la moindre question, n'hésitez pas à nous contacter par email : contact@rubynantes.org. Nous pourrons vous aider à distance et débloquer à peu près n'importe quelle situation.

Enfin, sachez que cette procédure d'installation n'est pas du tout représentative de ce que vous allez apprendre pendant Rails Girls, où l'on réalisera ensemble des choses bien plus intéressantes !

> :warning: Vous allez peut-être rencontrer des messages d'erreur pendant l'installation. Pas d'inquiétude : ils sont connus, et on sait comment les contourner. Tout ceci est expliqué plus bas.

---

## 1. Installation de Docker

1. Rendez-vous à l'adresse suivante : https://www.docker.com/products/docker-desktop

2. Cliquez sur le bouton **Download for Windows**.

3. Une fois téléchargé, lancez le programme d'installation **Docker Desktop Installer**.

4. Vérifiez que les options **Install required Windows components for WSL2** et **Add shortcut to desktop** sont sélectionnées, et cliquez sur **Ok**.

<p align="center">
  <img src="assets/windows-docker-1.png" width="360">
</p>

5. Acceptez les conditions d'utilisation.

<p align="center">
  <img src="assets/windows-docker-2.png" width="644">
</p>

6. Si vous rencontrez le message d'erreur suivant :

<p align="center">
  <img src="assets/windows-docker-3.png" width="442">
</p>

- Cliquez sur **Continuer**
  
- Cliquez sur le lien présent dans la boîte de dialogue (ne la fermez pas !) : https://docs.microsoft.com/fr-fr/windows/wsl/install-win10#step-4---download-the-linux-kernel-update-package

<p align="center">
  <img src="assets/windows-docker-4.png" width="515">
</p>

- Cliquez sur le lien **Package de mise à jour du noyau Linux WSL2 pour machines x64**. Cela déclenchera le téléchargement d'un petit utilitaire qui va débloquer la situation.

- Installer l'utilitaire **wsl_update_x64.msi**. Cette opération ne prend que quelques secondes.

<p align="center">
  <img src="assets/windows-docker-5.png" width="386">
</p>

- Une fois l'utilitaire installé, vous pouvez cliquer sur le bouton **Restart** de la boîte de dialogue d'erreur apparue juste avant.

7. L'installation de Docker est terminée. Félicitations !

---

## 2. Mise en place de l'application Touiteur

> *Touiteur* est l'application web que nous allons développer ensemble pendant la journée du samedi. Il s'agit d'une version *très* simplifiée de Twitter, que vous connaissez déjà.

1. Télécharger le code source de l'application à cette adresse : https://github.com/nantesrb/touiteur-docker/archive/refs/heads/main.zip

2. Décompressez l'archive ZIP dans le répertoire de votre choix : clic-droit + **Extraire tout**.

<p align="center">
  <img src="assets/windows-docker-6.png" width="320">
</p>

> :information_source: Dans la boîte de dialogue qui s'affiche, nous vous conseillons d'effacer la dernière partie `touiteur-docker-main` pour éviter que ce répertoire se retrouve en double.

<p align="center">
  <img src="assets/windows-docker-7.png" width="440">
</p>

3. Dans la barre de recherche Windows, tapez **cmd**. Puis lancez l'application **Invite de commande** qui apparaît en résultat.

<p align="center">
  <img src="assets/windows-docker-8.png" width="590">
</p>

4. Dans la fenêtre **Invite de commandes**, tapez `cd`, espace, puis glissez / déposez le dossier `touiteur-docker-main`  à partir de l'explorateur de fichiers dans cette fenêtre.

Vous devriez alors avoir quelque chose qui ressemble à ceci :

<p align="center">
  <img src="assets/windows-docker-9.png" width="402">
</p>

5. Appuyez sur la touche **Entrée**.

6. Entrez ensuite la commande suivante :

```
docker-compose up --build
```

Puis appuyez sur **Entrée**. Cette étape peut prendre plusieurs minutes, selon la vitesse de votre connexion Internet.

7. L'installation et la mise en place sont terminées une fois que vous voyez la ligne suivante apparaître `Listening on http://0.0.0.0:3000` :

<p align="center">
  <img src="assets/windows-docker-10.png" width="672">
</p>

8. Depuis votre navigateur, rendez-vous à l'adresse http://localhost:3000. Vous devriez alors voir la page d'accueil suivante :

<p align="center">
  <img src="assets/windows-docker-11.png" width="765">
</p>

---

## 3. Installer un éditeur de code

Nous vous recommandons d'installer l'un des éditeurs suivants :

- Sublime Text (léger et largement suffisant) : https://www.sublimetext.com/
- VSCode (plus complet) : https://code.visualstudio.com/

---

Et voilà, tout est prêt ! On se revoit donc très vite pour la suite.
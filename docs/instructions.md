# Développer l'application Touiteur

> *Touiteur, c'est la toute nouvelle application web qui va révolutionner les réseaux sociaux. Le principe est simple : n'importe quel visiteur du site peut laisser un message (sous forme de texte) et consulter les messages des autres visiteurs.*

L'objectif de ce projet est de vous donner un aperçu de la programmation web avec Ruby on Rails. Vous allez devoir écrire du code Ruby pour réaliser des fonctionnalités simples, comme la création et la consultation de messages à partir d'une page web. Vous pouvez voir ça comme un blog, mais ouvert à tout le monde.

N'oubliez pas que les mentors sont là pour vous accompagner. Ils vous expliqueront les fondamentaux de la programmation web, de Ruby on Rails et de l'architecture MVC. Vous pouvez compter sur leur aide pour réaliser tout ce que vous entreprendrez sur ce projet.

## Avant-propos

Avant de commencer, voici quelques rappels et indications.

### Éditer un fichier source

Lorsque l'on vous demandera d'écrire du code dans un fichier source, vous verrez l'icône 📄 avec le nom complet du fichier à créer ou à modifier. Vous devrez alors ouvrir ce fichier dans votre éditeur de code (Sublime Text) et appliquer les modifications demandées.

Par exemple, si on vous demande de modifier le contenu de la méthode `index` dans le contrôleur `MessagesController`, on indiquera ceci :

📄 `app/controllers/messages_controller.rb`

```ruby
def index
  # Du code à écrire ici
end
```

### Entrer une ligne de commande

Parfois, on vous demandera aussi de saisir des lignes de commandes dans le terminal ou la console. Dans ce cas, vous verrez l'icône 💻 comme ceci :


```sh
💻 rails db:migrate
```

Cela signifie que vous devez entrer la commande `rails db:migrate` puis appuyer sur la touche **Entrée** pour la valider.

---

## Exercice 1 : lister les messages

Nous avons déjà inséré pour vous des messages en base de données. L'objectif de ce premier exercice est de les afficher dans une simple page HTML. Pour cela, nous allons procéder en 4 étapes.

### 3. Créer le modèle `Message`

Notre application sera centrée sur la notion de message. C'est donc tout naturellement que nous allons créer un modèle `Message`. Pour commencer, nous allons considérer qu'un message est constitué :
- d'un contenu (texte)
- d'une auteur (chaîne de caractères)

Pour nous aider, Ruby on Rails met à notre disposition des générateurs de code source. Ici, nous allons utiliser la commande de génération de modèle :

```sh
💻 rails generate model Message author:string content:text
```

Après avoir entré cette commande, plusieurs fichiers sont créés automatiquement :
- `app/models/message.rb` : contient la description du modèle `Message`. Pour le moment, nous n'avons pas besoin de modifier ce fichier.
- `db/migrate/2021..._create_messages.rb` : script qui permet de créer la table `messages` en base de données.

Pour exécuter le script de migration de la base de données, qui va créer la table `messages` qui servira à stocker les messages, il suffit d'entrer la commande suivante :

```sh
💻 rails db:migrate
```

### 2. Configurer le routeur

On souhaite que les visiteurs puissent accéder à l'URL `http://localhost:3000/messages` pour afficher la liste des message. Il faut donc configurer l'application pour qu'elle reconnaisse la route `/messages`.

Pour cela, on édite le fichier `config/router.rb` comme suit :

📄 `config/router.rb`

```ruby
Rails.application.routes.draw do
  # ... 
  resources :messages # <-- Ligne de code à ajouter
end
```

Avec cette configuration, notre application accepte, entre autres, les requêtes HTTP de type `GET /messages`.

### 3. Créer un contrôleur

Pour respecter les conventions de nommage de Ruby on Rails, les requêtes effectuées sur la route `/messages` sont gérées par le contrôleur qui porte le même nom. En l'occurence, il s'agit du contrôleur `MessagesController`.

Ici, l'objectif est de récupérer en base de données la liste de tous les messages. Lorsqu'il s'agit de restituer une collection, c'est la méthode `index` qui est appelée sur un contrôleur. 

Vous devez donc créer un nouveau fichier de contrôleur `messages_controller.rb`, et implémenter la méthode `index` pour stocker la liste des messages dans une variable `@messages` :

📄 `app/controllers/messages_controller.rb`

```ruby
class MessagesController < ApplicationController

  def index
    # Code à écrire ici
  end

end
```

Indications :
- Pour récupérer la liste des messages présents en base de données, vous pouvez utiliser `Message.all`.
- Pour stocker un résultat dans une variable Ruby, on utilise tout simplement l'opérateur `=`. Par exemple, pour stocker la valeur `42` dans une variable `@response` : 
```ruby
@response = 42
```

### 4. Créer une vue dynamique HTML

Nous arrivons à la dernière étape de cette première phase de développement. Il ne manque plus que la vue HTML à créer.

Toujours pour respecter les conventions de nommage de Ruby on Rails, nous devons créer un nouveau fichier à cet emplacement : `app/views/messages/index.html.erb`. Vous devrez donc préalablement créer un répertoire `app/views/messages`.

Une fois ce nouveau fichier créé, vous pouvez initialiser son contenu comme suit :

📄 `app/views/messages/index.html.erb`
```erb
<% @messages.each do |message| %>
  <div>
    <p>
      <em>
        <!-- Afficher ici le contenu du message ('content') -->
      </em>
      <strong>
        <!-- Afficher ici l'auteur du message ('author') -->
      </strong>
    </p>
  </div>
<% end %>
```

Il ne vous reste plus qu'à afficher le contenu et l'auteur de chaque message en éditant les parties en commentaire (entre `<!--` et `-->`).

Indications :
- La vue a accès à la variable `@messages` qui a été alimentée par le contrôleur `MessagesController`.
- `@messages.each` permet de boucler sur l'ensemble des messages, et d'afficher le contenu du bloc (entre les mots-clés `do` et `end`) pour chaque message.
- À chaque itération de la boucle, la variable `message` correspondra au message courant à afficher. La notion de boucle est primordiale à comprendre. N'hésitez pas à solliciter les mentors si vous ne comprenez pas cette partie.

---

## Pour aller plus loin...

- Possibilité d'ajouter une image d'illustration à un message.
- Pouvoir supprimer un message.
- (Difficile) Mettre en place un système d'authentification des utilisateurs.
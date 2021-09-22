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
  # TODO: Du code à écrire ici
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

### 1. Créer le modèle `Message`

Notre application sera centrée sur la notion de message. C'est donc tout naturellement que nous allons créer un modèle `Message`. Pour commencer, nous allons considérer qu'un message est constitué :
- d'un contenu (texte)
- d'une autrice ou d'un auteur (chaîne de caractères)

Pour nous aider, Ruby on Rails met à notre disposition des générateurs de code source. Ici, nous allons utiliser la commande de génération de modèle :

```sh
💻 rails generate model message author:string content:text
```

Après avoir entré cette commande, plusieurs fichiers sont créés automatiquement :
- `app/models/message.rb` : contient la description du modèle `Message`. Pour le moment, nous n'avons pas besoin de modifier ce fichier.
- `db/migrate/2021..._create_messages.rb` : script qui permet de créer la table `messages` en base de données.

Pour exécuter le script de migration de la base de données, qui va créer la table `messages` qui servira à stocker les messages, il suffit d'entrer la commande suivante :

```sh
💻 rails db:migrate
```

> :information_source: Pour pouvoir entrer des lignes de commandes, n'oubliez pas d'**ouvrir une nouvelle fenêtre de terminal**, et de vous placer dans le répertoire de l'application.

### 2. Configurer le routeur

On souhaite que les visiteurs puissent accéder à l'URL `http://localhost:3000/messages` pour afficher la liste des message. Il faut donc configurer l'application pour qu'elle reconnaisse la route `/messages`.

Pour cela, on édite le fichier `config/routes.rb` comme suit :

📄 `config/routes.rb`

```ruby
Rails.application.routes.draw do
  # ... 
  resources :messages # <-- # TODO: Insérer cette ligne de code dans le routeur.
end
```

Avec cette configuration, notre application accepte, entre autres, les requêtes HTTP `GET /messages`, `GET /messages/new` ou encore `POST /messages`.

### 3. Créer un contrôleur

Pour respecter les conventions de nommage de Ruby on Rails, les requêtes effectuées sur la route `/messages` sont gérées par le contrôleur qui porte le même nom. En l'occurence, il s'agit du contrôleur `MessagesController`.

Ici, l'objectif est de récupérer en base de données la liste de tous les messages. Lorsqu'il s'agit de restituer une collection, c'est la méthode `index` qui est appelée sur un contrôleur. 

Vous devez donc créer un nouveau fichier de contrôleur `messages_controller.rb`, et implémenter la méthode `index` pour stocker la liste des messages dans une variable `@messages` :

📄 `app/controllers/messages_controller.rb`

```ruby
class MessagesController < ApplicationController

  # GET /messages
  def index
    # TODO: Récupérer la liste des messages présents en base de données.
  end

end
```

Indications :
- Pour récupérer la liste des messages présents en base de données, vous pouvez utiliser `Message.all`.
- Pour stocker un résultat dans une variable Ruby, on utilise tout simplement l'opérateur `=`. Par exemple, pour stocker la valeur `42` dans une variable `@response` on fera : `@response = 42`.

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
        <!-- TODO: Afficher ici le contenu du message ('content') -->
      </em>
      <strong>
        <!-- TODO: Afficher ici l'autrice ou l'auteur du message ('author') -->
      </strong>
    </p>
  </div>
<% end %>
```

Il ne vous reste plus qu'à afficher le contenu et l'auteur de chaque message en éditant les parties en commentaire (entre `<!--` et `-->`).

Indications :
- La vue a accès à la variable `@messages` qui a été alimentée par le contrôleur `MessagesController`.
- `@messages.each` permet de boucler sur l'ensemble des messages, et d'afficher le contenu du bloc (entre les mots-clés `do` et `end`) pour chaque message.
- À chaque itération de la boucle, la variable `message` correspondra au message courant à afficher. La notion de boucle est primordiale. N'hésitez pas à solliciter les mentors si vous ne comprenez pas cette partie.

---

## Exercice 2 : formulaire de création de messages

Nous savons désormais afficher une liste de messages dans une page web. On veut désormais que l'utilisateur puisse publier ses messages à l'aide d'un formulaire de saisie.

### Créer des messages en console

Avant de créer notre premier formulaire web, on peut d'abord essayer de comprendre comment fonctionne l'insertion de nouveaux messages en base de données. Pour cela, on peut utiliser la console Rails, qui nous donne un accès à l'application, sans passer par les vues HTML et les requêtes HTTP.

Pour lancer une console Rails, il faut entrer cette commande dans le terminal :

```sh
💻 rails console
```

Vous devriez alors avoir le résultat suivant :

```irb
Loading development environment (Rails 6.1.4.1)
irb(main):001:0>
```

À partir de là, vous pouvez entrer du code Ruby. Par exemple, pour créer un nouveau message :

```irb
irb(main):001:0> message = Message.new(author: "Alice", content: "Coucou !")
irb(main):002:0> message.save
```

> :information_source: Astuce : on peut combiner les deux lignes de code en faisant directement : 
> 
> ```irb
> Message.create(author: "Alice", content: "Coucou !")
> ```

Si tout se passe bien, vous devriez voir la requête SQL d'insertion d'un enregistrement dans la table `messages`. Est-ce bien le cas ?

Et si vous rafraîchissez la page http://localhost:3000/messages, vous devriez également voir apparaître votre nouveau message.

Pour quitter la console Rails, il suffit d'entrer la commande `exit` qui vous permet de revenir sur le terminal :

```irb
irb(main):002:0> exit
```

Maintenant que nous savons comment créer de nouveaux messages à partir de la console Rails, voyons comment faire la même chose, mais à l'aide d'un formulaire web.

### 1. Édition du contrôleur

Éditez le contrôleur `MessagesController` pour ajouter ces nouvelles méthodes :

📄 `app/controllers/messages_controller.rb`

```ruby
class MessagesController < ApplicationController

  # GET /messages
  def index
    # ...
  end

  # GET /messages/new
  def new
    # TODO: Initialisation d'un nouveau message vide.
  end

  # POST /messages
  def create
    # TODO: Insertion d'un message en base de données.
  end

private

  def message_params
    params.required(:message).permit(
      # TODO: Ajouter les paramètres autorisés ici.
    )
  end

end
```

Détaillons un peu ces méthodes pour vous aider à les implémenter.

- `new` : Le rôle de cette méthode est d'initialiser la variable `@message` avec un nouveau message vide (sans auteur et sans contenu). Pour obtenir un message vide, on utilise `Message.new` (sans aucun paramètre). Cela permettra d'afficher un formulaire vierge.
  
- `create` : C'est la méthode qui sera appelée lors de la soumission du formulaire (requête HTTP POST). Son rôle est d'initialiser la variable `@message` avec les paramètres saisis par l'utilisateur (`message_params`), puis de délencher son insertion en base de données à l'aide de la méthode `save`. À la fin, n'oubliez pas de rediriger l'utilisateur vers la page de liste des messages, à l'aide de `redirect_to messages_path`.

- `message_params` : Cette méthode permet de récupérer uniquement les paramètres autorisés pour la création d'un nouveau message. Pour le moment, nous n'autorisons que les paramètres `author` et `content`.

> :information_source: Souvenez-vous que le nom des paramètres doit être préfixé par `:`, par exemple `:author`.

Une fois le contrôleur correctement implémenté, nous allons pouvoir passer à la vue HTML du formulaire.

### 2. Création d'un formulaire HTML

Le formulaire de création de message sera accessible *via* la route `/messages/new`. Nous devons donc créer une nouvelle vue HTML pour afficher ce formulaire. Pour respecter les conventions de nommage, cette vue devra être décrite dans un nouveau fichier :

📄 `app/views/messages/new.html.erb`

```erb
<h1>Nouveau message</h1>
<%= form_for @message do |form| %>
  <div>
    <%= form.label :content, 'Contenu' %>
    <%= form.text_area :content %>
  </div>
  <div>
    <%= form.label :author, 'Auteur' %>
    <%= form.text_field :author %>
  </div>
  <%= form.submit 'Valider' %>
<% end %>
```

Vous remarquerez que cette vue fait référence à la variable `@message` qui est initialisée dans la méthode `new` du contrôleur `MessagesController`.

Vous pouvez désormais accéder à ce formulaire en vous rendant à l'adresse http://localhost:3000/messages/new.

Que se passe-t-il lorsque vous soumettez le formulaire ? Est-ce possible d'enregistrer un message sans saisir d'auteur ou de contenu ? N'hésitez pas à consulter les logs du serveur pour voir les requêtes passer et voir comment elles sont traitées par votre application.

---

## Exercice 3 : Lien vers le formulaire de création

Actuellement, les visiteurs sont obligés de connaître l'adresse http://localhost:3000/messages/new pour pouvoir afficher le formulaire de création de message. Ce n'est pas très ergonomique... On se propose donc d'ajouter un lien vers ce formulaire depuis la page de liste des messages.

📄 `app/views/messages/index.html.erb`
```erb
<% @messages.each do |message| %>
  <!-- ... -->
<% end %>
<!-- TODO: Ajouter ici un lien vers l'URL '/messages/new' -->
```

Si on voulait ajouter un lien de façon statique, on pourrait faire quelque chose comme :

```html
<a href="/messages/new">Nouveau message</a>
```

Mais ce n'est pas la meilleure façon de faire un site web dynamique. On préférèra utiliser les méthodes `link_to` et `new_message_path` qui est fournie par le routeur de Ruby on Rails.

Par exemple, si on voulait insérer un lien vers une liste d'utilisateurs :

```erb
<%= link_to "Liste des utilisateurs", users_path %>
```

---

## Exercice 4 : Validation des données saisies

### 1. Ajout de validateurs au niveau du modèle

Avez-vous essayé de créer un message complètement vide, c'est-à-dire sans auteur et sans contenu ? Actuellement, rien ne l'empêche, et ça peut être assez embêtant de permettre l'enregistrement de messages vides. Nous allons donc ajouter des méthodes de validation dans le modèle `Message`.

📄 `app/models/message.rb`
```ruby
class Message < ApplicationRecord

  # TODO: Ajouter une validation de présence de l'autrice / auteur.
  # TODO: Ajouter une validation de présence du contenu.

end
```

Avec Ruby on Rails, on peut simplement valider la présence d'un attribut à l'aide de la méthode `validates`. Par exemple, imaginons un modèle `User`, pour lequel on doit valider la présence de l'email :

```ruby
class User < ApplicationRecord

  validates :email, presence: true

end
```

Essayez d'appliquer le même principe avec notre modèle `Message` et les attributs `author` et `content`.

### 2. Ajustements dans le contrôleur

Après avoir ajouté ces validateurs, que se passe-t-il lorsque vous tentez de soumettre un message vide ? Apparemment, le message ne s'enregistre plus en base de données, mais l'utilisateur n'est pas au courrant qu'il y a un problème de validation des données qu'il a saisies.

La première chose que nous devons faire pour gérer les erreurs de validation, c'est de réafficher le formulaire de création plutôt que de rediriger l'utilisateur vers la page de liste des messages. Nous devons donc modifier la méthode `create`. Pour ce faire, voici quelques indications :

- Si le message est valide, c'est que l'appel à la méthode `save` a retourné `true`. Dans ce cas, et uniquement dans ce cas, vous pouvez rediriger l'utilisateur vers la page de liste des messages (comme c'est le cas actuellement).

- Sinon, il faut réafficher le formulaire de création. Pour cela, vous pouvez utiliser la méthode `render :new`. Cela signifie que le contrôleur commande le rendu de la vue `app/views/messages/new`. 

- La méthode `create` va devoir utiliser les branchements conditionnels, et devrait donc contenir ce type de structure :

```ruby
def create
  # ... Code d'initialisation de la variable '@message'.
  if @message.save
    # Cas où le message s'enregistre bien : on redirige vers la page de liste des messages.
  else
    # TODO: Cas où le message n'est pas valide. On réaffiche la vue 'new' sans rediriger l'utilisateur.
    render :new
  end
end
```

### 3. Affichage des erreurs dans le formulaire

Il ne reste plus qu'à prévenir l'utilisateur que son message ne peut pas être enregistré car il n'est pas valide. On va donc gérer l'affichage des messages d'erreur dans la vue.

📄 `app/views/messages/new.html.erb`
```erb
<h1>Nouveau message</h1>
<!-- TODO: Afficher ici les éventuels messages d'erreur. -->
<%= form_for @message do |form| %>
  <div>
    <%= form.label :content, 'Contenu' %>
    <%= form.text_area :content %>
  </div>
  <div>
    <%= form.label :author, 'Auteur' %>
    <%= form.text_field :author %>
  </div>
  <%= form.submit 'Valider' %>
<% end %>
```

Ruby on Rails propose un moyen simple pour récupérer la liste des messages d'erreurs sur un modèle. Par exemple :

```ruby
@message.errors.full_messages
```

Essayez d'intégrer ce code dans la vue, comme suggéré ci-dessus. 

> :information_source: Si le message est valide, alors il n'y a pas de message d'erreur, et donc la méthode `full_messages` renverra un tableau vide.

---

## Exercice 5 : Page de détail d'un message

Si un utilisateur de votre site souhaite pouvoir référencer un message en particulier, le mieux est de permettre l'affichage d'une page qui contient uniquement le message en question, avec sa propre URL. Pour cela, nous pouvons utiliser la route `GET /messages/:id` (où `:id` sera remplacé par l'identifiant unique du message).

### 1. Édition du contrôleur

Selon les conventions de nommage de Ruby on Rails, lorsqu'on accède au détail d'une ressource, c'est la méthode `show` qui est appelée dans le contrôleur. Nous allons donc ajouter cette méthode comme suit :

📄 `app/controllers/messages_controller.rb`

```ruby
class MessagesController < ApplicationController

  # GET /messages/:id
  def show
    # TODO: Récupérer le message en base de données à partir de son identifiant, et le stocker dans la variable @message.
  end

  # ...

end
```

Indications :
- Pour récupérer un modèle présent en base de données, étant donné son identifiant, on utilise généralement la méthode `find`. Par exemple, pour récupérer un utilisateur qui a pour identifiant `12`, on écrira le code suivant :

```ruby
@user = User.find(12)
```

- Lorsqu'un accède à une URL de type `http://localhost:3000/messages/56`, le routeur de Ruby on Rails va automatiquement positionner l'identifiant `56` dans le paramètre `params[:id]`. Pour reprendre l'exemple précédent, cela donnerait :

```ruby
@user = User.find(params[:id]) # Dans cet exemple, params[:id] vaut 12.
```

### 2. Créer une nouvelle vue de détail

Toujours selon les conventions de nommage de Ruby on Rail, le nom du fichier de vue est le même que la méthode correspondante dans le contrôleur.

Quel nouveau fichier de vue allez-vous créer pour la page de détail d'un message ? Y a-t-il moyen de s'inspirer du balisage HTML d'une autre vue pour afficher le détail d'un message ?

### 3. Lien vers la page de détail

Dans la vue de liste des messages, on souhaite ajouter un lien pour chaque message afin d'accéder à sa page de détail.

📄 `app/views/messages/index.html.erb`
```erb
<% @messages.each do |message| %>
  <div>
    <p>
      <em>
        <!-- Contenu du message -->
      </em>
      <strong>
        <!-- Autrice ou auteur du message -->
      </strong>
      <!-- TODO: Ajouter ici un lien vers la page de détail du message -->
    </p>
  </div>
<% end %>
```

Pour insérer un lien vers un message, Ruby on Rails vous donne plusieurs possibilités :

```ruby
# Méthode 1
link_to "Accéder au détail", @message

# Méthode 2, plus concise
link_to "Accéder au détail", message_path(@message)
```

En bonus, essayez d'ajouter un lien qui permet de revenir sur la page de liste des messages à partir de la page de détail.

---

## Exercice 6 : Rendre l'interface plus sympa

À ce stade, vous avez normalement eu un cours sur les feuilles de styles CSS et sur le *framework* [**Bootstrap**](https://getbootstrap.com/docs/5.1/getting-started/introduction).

Essayez de voir comment améliorer l'apparence de votre nouvelle application en utilisant des composants ou des fragments de HTML. Par exemple, vous pourriez vous inspirer du [composant **Card**](https://getbootstrap.com/docs/5.1/components/card/) pour l'affichage d'un message.

---

## Exercice 7 : Joindre une photo à un message

À un moment, vous voudrez sûrement pouvoir ajouter une photo à un message. Heureusement, Ruby on Rails nous permet de réaliser cela facilement !

### 1. Éditer le modèle

Pour qu'un message puisse contenir une image, il faut le spécifier de cette façon dans le modèle :

📄 `app/models/message.rb`

```ruby
class Message < ApplicationRecord

  # ...

  has_one_attached :image # TODO: Ligne de code à ajouter.

end
```

### 2. Éditer le contrôleur

Rappelez-vous que le contrôleur `MessagesController` n'accepte que les paramètres autorisés. Nous devons donc modifier la méthode `message_params` pour autoriser l'envoi d'image, en ajoutant le paramètre `:image`.

### 3. Éditer le formulaire

Il nous faut désormais ajouter un nouveau champ de sélection de fichier dans le formulaire de création de message. Pour cela, Ruby on Rails met à disposition la méthode `file_field`, que vous pouvez ajouter comme suit :

📄 `app/views/messages/new.html.erb`

```erb
<%= form_for @message do |form| %>
  <!-- ... -->
  <div>
    <%= form.label :image, 'Image' %>
    <%= form.file_field :image %>
  </div>
  <!-- ... -->
<% end %>
```

### 4. Afficher les images

Dernière étape : afficher l'image associé à un message. Dans la vue de liste des messages, on pourra utiliser la méthode `image_tag` comme ceci :

```erb
<% @messages.each do |message| %>
  <div>
    <!-- ... -->
    <%= image_tag message.image %>
  </div>
<% end %>
```

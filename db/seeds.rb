if defined?(Message) && Message.none?
  Message.create!(
    author: "Alexandre Vialatte",
    content: "Sauf erreur, je ne me trompe jamais."
  )
  Message.create!(
    author: "Jean Aillaud",
    content: "Si vous mettez le pied sur une vipère, vous risquez une mort sûre."
  )
  Message.create!(
    author: "Raymond Devos",
    content: "On a toujours tort d'essayer d'avoir raison devant les gens qui ont toutes les bonnes raisons de croire qu'ils n'ont pas tort !"
  )
  Message.create!(
    author: "Jean-Claude Van Damme",
    content: "Un bon truc pour paraître dix ans plus jeune, c'est de vieillir de dix ans quand tu dis ton âge."
  )
  Message.create!(
    author: "Johnny Halliday",
    content: "Tu te rends compte, si on avait pas perdu une heure et quart, on serait déjà là depuis une heure et quart !"
  )
  Message.create!(
    author: "Coluche",
    content: "Si vous avez besoin de quelque chose, appelez-moi. Je vous dirai comment vous en passer."
  )
  Message.create!(
    author: "Franck Ribéry",
    content: "Demain est un autre jour. Faut avancer de l'avant."
  )
  Message.create!(
    author: "Jean Yanne",
    content: "Il faut commencer à se méfier le jour où l'on a plus de souvenirs que de projets."
  )
end

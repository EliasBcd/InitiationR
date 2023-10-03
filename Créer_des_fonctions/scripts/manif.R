# Expliquons un petit peu comment récupérer les arguments dans les ... quand ils
# sont utilisés comme arguments d'une fonction. La fonction suivante est un exemple
# où la fonction est censée additionner deux arguments nommés explicitement, 
# alpha et beta.
# 
# ajouter_alpha_et_beta <- function(...){
#   # Il faut d'abord capturer les ... dans une liste et ensuite assigner la
#   # liste à un objet. Nommons cette liste args.
#
#   args <- list(...)
#
#   # Nous allons maintenant faire l'hypothèse que cette liste contient deux 
#   # arguments explicitement nommés, 'alpha' et 'beta'. Nous pouvons etraire
#   # les arguments de cette liste en utilisant les noms des arguments entre 
#   # double crochets. L'argument args est une simple liste après tout.
#   
#   alpha <- args[["alpha"]]
#   beta  <- args[["beta"]]
#
#   # On peut ensuite addionner alpha et beta.
#
#   alpha + beta 
# }
#
# Avez-vous déjà manifesté ou bien fait la grève à Paris 8 ? La fonction suivante
# va construire une phrase à partir des arguments que vous allez donner. 
# Nous allons écrire une grande partie de la fonction, mais vous devez récupérer
# les bons arguments des ...

manif <- function(...){
  # Récupérez vos arguments ici.
  
  # Ne modifiez pas le code suivante ces commentaires.
  # Regardez bien les arguments que vous devez récupérer dans la liste pour 
  # construire la phrase.
  # Pour l'instant, peu vous importe comment fonction la fonction paste().
  paste("Nouvelles de", place, "aujourd'hui, des étudiant.e.s", adjective, "ont fait grève contre les nouveaux", noun, "installés dans l'université.")
}

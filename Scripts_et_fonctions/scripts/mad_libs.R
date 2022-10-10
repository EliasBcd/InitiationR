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
# Avez-vous déjà manifest
# Have you ever played Mad Libs before? The function below will construct a
# sentence from parts of speech that you provide as arguments. We'll write most
# of the function, but you'll need to unpack the appropriate arguments from the
# ellipses.

mad_libs <- function(...){
  # Do your argument unpacking here!
  
  # Don't modify any code below this comment.
  # Notice the variables you'll need to create in order for the code below to
  # be functional!
  paste("News from", place, "today where", adjective, "students took to the streets in protest of the new", noun, "being installed on campus.")
}

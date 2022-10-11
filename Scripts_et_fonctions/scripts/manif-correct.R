manif <- function(...){
  # Récupérer vos arguments ici.
  args <- list(...)
  place <- args[["place"]]
  adjective <- args[["adjective"]]
  noun <- args[["noun"]]
  
  # Ne modifiez pas le code suivante ces commentaires.
  # Regardez bien les arguments que vous devez récupérer dans la liste pour 
  # construire la phrase.
  paste("Nouvelles de", place, "aujourd'hui, des étudiant.e.s", adjective, "ont fait grève contre les nouveaux", noun, "installés dans l'université.")
}
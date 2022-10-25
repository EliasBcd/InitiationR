# Nous vous donnons la fonction action() qui donne
# l'évolution du prix d'une action au fil du temps.
# Le prix d'origine de l'action est de 50€. 
# Nous souhaitons la vendre dès que son prix dépasse 60€ pour empocher les gains
# ou descend sous les 40€ pour limiter les pertes. 
# Ecrivez une fonction qui retourne le nombre de jours où l'on garde l'action.


action <- function(x){
  x + sample(c(-2, 2), 1)
}

nombre_jours <- function(){
  jour <- 1
  prix <- 50
  
  while ((prix >= 40) && (prix <=60)){
    prix <- action(prix)
    jour <- jour + 1
  }
  jour
}




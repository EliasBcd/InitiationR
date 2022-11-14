# Nous vous donnons la fonction variation() qui donne
# l'augmentation ou la diminution du prix d'une action au fil du temps.
# Le prix d'origine de l'action est de 50€. 
# Nous souhaitons la vendre dès que son prix dépasse 60€ pour empocher les gains
# ou descend sous les 40€ pour limiter les pertes. 
# Ecrivez une fonction qui retourne le nombre de jours où l'on garde l'action.

# Conseil #1 : N'oubliez pas que pour passer une fonction en argument on peut juste
# donner son nom sans parenthèses, mais que pour l'utiliser il faut mettre des 
# parenthèses à la fin.

nombre_jours <- function(variation){
  jour <- 1
  prix <- 50
  
  while ((prix <= 60) && (prix >=40)){
    jour <- jour + 1
    prix <- prix + variation()
  }
  jour
}




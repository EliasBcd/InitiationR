# Dans ce script, vous devez assigner c(156, 164, 197, 147, 173) à tailles.
# Ce sont des tailles en centimètres.
#  c(45, 59, 110, 44, 88) à poids.
# Et calculer l'IMC et assigner le résultat à imc.
# Rappelez vous que l'imc vaut poids / tailles^2, avec la taille en mètres.

# Saisie des tailles et poids des enquêtés
tailles <- c(156, 164, 197, 147, 173)
poids <- c(45, 59, 110, 44, 88)

# Calcul des tailles et poids moyens
mean(tailles)
mean(poids)

# Calcul de l'IMC (poids en kilo divisé par les tailles en mètre au carré)
imc <- poids / (tailles / 100) ^ 2

# Valeurs extrêmes de l'IMC
min(imc)
max(imc)
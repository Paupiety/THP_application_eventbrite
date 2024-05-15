# Application : The Gossip Project

## Overview

The Gossip Project est une application qui permet de raconter les gossips de THP.

### Features
- S'inscrire à la plateforme
- Se connecter
- Créer des gossips (et les gérer)
- Commenter les gossips (et gérer ses commentaires)
- Aimer les gossips

## Get started

````sh
bundler install # installer les dépendances
rails db:create #créer la bdd
rails s # Tester l'application
````

## arborescence de ce qui nous intéresse

````sh
/app
    /models #tous les models de l'application
    /controllers #tous les controllers de l'application
    /views #toutes les views de l'application
    /helpers
      /sessions_helper.rb #création d'helper pour une utilisation sur différents controllers
    /assets
      /stylesheets
        /application.css #fichier contenant le CSS de toute l'application
/db # Dossier contenant les migrations
    /migrate #toutes les migrations des différents models
    /seeds.rb #Pour tester l'application
````
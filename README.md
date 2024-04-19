# GitHub : Consultation des droits sur repositories (répertoire)


<br>
<hr>

## Procédure de vérification des droits sur un repository hebergé par GitHub.

<br>

### - Recherche d'un utilisateur.
Recherche d'utilisateurs existant sur GitHub à partir d'un nom de profil ou ```USERNAME```.

>[!NOTE]
>**L'adresse email est public sur GitHub**

<br>

### - Consultation des repositories public d'un utilisateur
Consulter la liste des repositories public appartenant à un utilisateur. 

<br>

### - Recherche d'un repository et de son propriétaire.
Recherche de repositories public hébergé par GitHub à partir d'un nom de projet ou ```REPONAME```. 

<br>

### - S'auhtentifier en tant qu'utilisateur.
S'authentifier sur la plateforme GitHub pour générer un token d'authentification. 

Utiliser le token pour exécuter des requêtes à l'API GitHub en tant qu'utilisateur authentifier. 

<br>

### - Consulter la liste des repositories public et privé de l'utilisateur authentifier.
Consulter la liste des repositories public et privée appartenant à l'utilisateur auhtentifier avec le token. 


<hr>
<br>
<br>

## Création d'un Access Token pour authentifier l'utilisateur 

<br>

### 1. Connexion à GitHub
Se connecter à la plateforme [GitHub](https://github.com/login) et s'authentifier avec l'identifiant et mot de passe de l'utilisateur.  

<br>

### 2. Menu Profile
Cliquer sur l'icône du profile pour déclencher le menu déroulant. 

![1-Profile](https://github.com/garysounigo/VerificationRepo/assets/67335474/26aa1b5c-f2f5-4564-b9ef-4b807060bff8)

<br>

### 3. Menu Settings 
Sélectionner le menu ```Settings``` pour arriver sur la page de paramètre du profile utilisateur.

![2-Settings](https://github.com/garysounigo/VerificationRepo/assets/67335474/fa3c8993-efbd-4c43-859a-a2fad56bf0d4)

<br>

### 4. Developper Settings
Dans la liste de menu (côté gauche de l'écran), sélectionner le menu ```Develloper Settings``` (dernier de la liste).

![3-DevelopperSettings](https://github.com/garysounigo/VerificationRepo/assets/67335474/7cf81ba4-3b08-4b7a-880c-478f3c637b31)

<br>

### 5. Personal Access Token
Dans la liste de menu (côté gauche de l'écran), cliquer sur ```Personal access token``` pour dérouler le menu puis sélectionner ```Token (classic)```

![4-PersonalAccessToken](https://github.com/garysounigo/VerificationRepo/assets/67335474/e6e97fae-3720-4145-8bc2-f2d8a7723de1)

<br>

### 6. Generate Personal Access Token 
Cliquer sur ```Generate personal access token```

![5-GenerateToken](https://github.com/garysounigo/VerificationRepo/assets/67335474/4ec56a29-421d-409e-b1fe-521eed2153b9)

<br>

### 7. Token Settings 
Remplir le champ **Note** pour donner un nom au token: ```VerificationRepo```

Sélectionner un délai d'expiration de ```7 days```.

Puis cocher ```repo``` dans la partie **Select scopes**.

>[!NOTE]
>**Limite le token pour accéder uniquement aux repositories dans un délai de 7 jours.**
 
![6-GenerateTokenSettings](https://github.com/garysounigo/VerificationRepo/assets/67335474/6b16e79a-6df3-4632-81ea-67bd9a9a9dee)

<br>

### 8. Validate Token
Faire défiler en bas de la page puis cliquer sur **Generate Token**.

![7-ValidateGenerateToken](https://github.com/garysounigo/VerificationRepo/assets/67335474/fe8f682a-ce9e-4988-ba5b-35ca776e3832)

<br>

### 9. Obtention du Token 
Récupérer le token généré.

![8-Token](https://github.com/garysounigo/VerificationRepo/assets/67335474/de57d988-205c-48e8-88e6-40aa2c6164ec)


<br>
<br>
<br>
<hr>

## [GitHub API](https://docs.github.com/en/rest?apiVersion=2022-11-28)

### User

#### Authenticated User [^1]

```
curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer <YOUR-TOKEN>" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/user
```


#### Get A User [^2]

```
curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer <YOUR-TOKEN>" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/users/USERNAME
```

#### Get contextual information for a user [^3]

```
curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer <YOUR-TOKEN>" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/users/USERNAME/hovercard
  ```


### Repos

#### List Public Repositories for a User [^4]

```
curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer <YOUR-TOKEN>" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/users/USERNAME/repos
```

#### List Repositories for the Authenticated User [^5]


```
curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer <YOUR-TOKEN>" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/user/repos
```


### Search 

#### Search Repos [^6]

```
curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer <YOUR-TOKEN>" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  "https://api.github.com/search/repositories?q=REPONAME"
```

#### Search User [^7]

```
curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer <YOUR-TOKEN>" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  "https://api.github.com/search/users?q=USERNAME"
```



[^1]: [GitHub API: Authenticated User](https://docs.github.com/en/rest/users/users?apiVersion=2022-11-28#get-the-authenticated-user)
[^2]: [GitHub API: Get A User](https://docs.github.com/en/rest/users/users?apiVersion=2022-11-28#get-a-user)
[^3]: [GitHub API: Get Contextual Information for a User](https://docs.github.com/en/rest/users/users?apiVersion=2022-11-28#get-contextual-information-for-a-user)
[^4]: [GitHub API: List Public Repositories for a User](https://docs.github.com/en/rest/repos/repos?apiVersion=2022-11-28#list-repositories-for-a-user)
[^5]: [GitHub API: List Repositories for the Authenticated User](https://docs.github.com/en/rest/repos/repos?apiVersion=2022-11-28#list-repositories-for-the-authenticated-user)
[^6]: [GitHub API: Search Repos](https://docs.github.com/en/rest/search/search?apiVersion=2022-11-28#search-repositories)
[^7]: [GitHub API: Search User](https://docs.github.com/en/rest/search/search?apiVersion=2022-11-28#search-users)

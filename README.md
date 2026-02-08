# Mise en œuvre d'une infrastructure cloud de supervision centralisée sous AWS

## Déploiement de Zabbix conteneurisé pour le monitoring d'un parc hybride (Linux & Windows)
![alt text](image-1.png) ![alt text](image-2.png)
---

## 🎯 Objectif du Projet
Déployer une infrastructure de monitoring centralisée sur AWS en utilisant **Zabbix (Docker)** pour surveiller un parc hybride composé de serveurs **Linux** et **Windows**.

## 📋 Cahier des Charges Technique

### Architecture Proposée
- **VPC** : 1 VPC avec un sous-réseau public (accès simplifié sans VPN)
- **Sécurité** : Groupes de sécurité autorisant :
  - Ports 80/443 (interface web Zabbix)
  - Ports 10050/10051 (agents Zabbix)
  - Port 3389 (RDP - Windows)
  - Port 22 (SSH - Linux)
- **Instances EC2** :
  1. Serveur Zabbix : t3.large (Ubuntu)
  2. Client Linux : t3.medium (Ubuntu)
  3. Client Windows : t3.large (Windows Server)


## 🏗️ Architecture Technique

### Diagramme d'Architecture Simplifié
flowchart TB
    subgraph AWS["AWS Cloud (us-east-1)"]
        subgraph VPC["VPC"]
            subgraph PublicSubnet["Public Subnet"]
                
                ZBX["Zabbix Server\nUbuntu\nEC2 t3.large"]
                
                LNX["Linux Server\nUbuntu\nZabbix Agent\nEC2 t3.medium"]
                
                WIN["Windows Server\nWindows Server\nZabbix Agent\nEC2 t3.large"]
                
            end
        end
    end

    ZBX <-- "Zabbix (10050/10051)" --> LNX
    ZBX <-- "Zabbix (10050/10051)" --> WIN

    ZBX ---|"SSH 22"| LNX
    ZBX ---|"RDP 3389"| WIN

    Internet["Internet"]
    Internet -->|"HTTP/HTTPS\n80 / 443"| ZBX

## 🚀 Étapes de Déploiement

### 1. Configuration Infrastructure AWS
- Création du VPC et sous-réseau
- Configuration des groupes de sécurité
- Lancement des instances EC2

### 2. Déploiement du Serveur Zabbix
```bash
# Installation Docker et Docker Compose
sudo apt update
sudo apt install docker.io docker-compose -y

# Déploiement Zabbix
git clone [URL_DU_DEPOT]
cd zabbix-aws-monitoring
docker-compose up -d
3. Configuration des Agents
Agent Linux : Installation via apt et configuration

Agent Windows : Installation manuelle et configuration réseau

4. Intégration dans Zabbix
Ajout des hôtes via l'interface web

Configuration des templates de monitoring

Vérification de la connectivité
infra-supervision-aws/
├── README.md                    # Documentation principale
├── docker-compose.yml           # Configuration Docker Zabbix
├── scripts/
│   ├── deploy-zabbix.sh         # Script déploiement serveur
│   ├── install-agent-linux.sh   # Script agent Linux
│   └── install-agent-windows.ps1 # Script agent Windows
├── configs/
│   ├── zabbix_server.conf       # Configuration serveur
│   ├── zabbix_agentd_linux.conf # Configuration agent Linux
│   └── zabbix_agentd_windows.conf # Configuration agent Windows
├── docs/
│   └── guide-installation.md    # Guide détaillé
└── screenshots/                 # Captures d'écran démonstration
📊 Résultats Attendus
Monitoring Fonctionnel
✅ Interface Zabbix accessible sur HTTPS

✅ Agents Linux et Windows connectés

✅ Métriques système collectées (CPU, RAM, disque)

✅ Alertes configurées et fonctionnelles

Tableaux de Bord
Vue centralisée des performances

Graphiques temps-réel

Historique des métriques

⚠️ Limitations AWS Learner Lab
Région : Uniquement us-east-1 (N. Virginia)

Instances : Types t3.medium/t3.large maximum

Budget : Limite de 50$ - arrêter les instances quand inactives

Durée : Lab avec expiration automatique

📝 Livrables
Rapport PDF
Page de garde avec informations institutionnelles

Architecture détaillée

Captures d'écran numérotées et légendées

Analyse des résultats

Dépôt GitHub
Code source et configurations

Documentation technique

Scripts d'automatisation

👥 Équipe Projet
Étudiant : [NOM Prénom]

Encadrant : Prof. Azeddine KHIAT

Année Universitaire : 2025/2026

Filière : [Nom de la filière]

🔗 Ressources
Dépôt GitHub : https://github.com/Ramadiaw12/Project_Zabbix_AWS

Documentation Zabbix : https://www.zabbix.com/documentation

AWS Documentation : https://docs.aws.amazon.com

Technologies Utilisées : AWS • Docker • Zabbix • Ubuntu • Windows Server • Bash • PowerShell
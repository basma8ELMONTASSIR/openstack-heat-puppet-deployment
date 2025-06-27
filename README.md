# openstack-heat-puppet-deployment

# Déploiement OpenStack avec Heat et Puppet

Ce projet montre comment déployer automatiquement une machine virtuelle (VM) sur un cloud privé OpenStack à l’aide de Heat (Infrastructure as Code) et configurer cette VM à l’aide de Puppet.

## 📁 Structure du Projet

openstack-project/
├── heat-templates/
│ └── infrastructure.yaml # Template Heat décrivant l'infrastructure
├── my_key.pem # Clé privée SSH
├── my_key.pub # Clé publique à ajouter dans OpenStack
├── puppet/
│ └── site.pp # Fichier manifeste Puppet pour la configuration
└── scripts/
└── deploy.sh # Script de déploiement automatisé

## ⚙️ Prérequis

- Une machine virtuelle Ubuntu avec DevStack installé
- Accès OpenStack (Horizon ou CLI)
- Git, OpenStack CLI et SSH installés

## 🚀 Étapes de Déploiement

1. **Générer une paire de clés SSH :**
	```bash 
	ssh-keygen -t rsa -b 2048 -f my_key
2. **Ajouter la clé publique dans OpenStack :**
	```bash
	openstack keypair create --public-key my_key.pub my_key
3. **Charger les identifiants OpenStack :**
	```bash
	source openrc


4. **Déployer l’infrastructure avec Heat :**
	```bash
	./scripts/deploy.sh


5. **Lister les ressources déployées (optionnel) :**
	```bash
	openstack stack list
	openstack server list

6. **Se connecter à la VM via SSH :**
	```bash
	ssh -i my_key.pem fedora@<ADRESSE_IP_FLOTTANTE>


7. **Configurer la VM avec Puppet (depuis la VM) :**
	```bash
	sudo dnf install -y puppet
	sudo cp site.pp /etc/puppet/manifests/
	sudo puppet apply /etc/puppet/manifests/site.pp

## ✅ Résultat Attendu

- Une machine virtuelle Fedora créée automatiquement avec IP flottante
- Le serveur web Apache (ou autre service) installé automatiquement via Puppet
- Accès possible via l’adresse IP flottante dans un navigateur

## 📌 Remarques

- Vérifiez que le sous-réseau est bien connecté au réseau externe pour éviter les erreurs d’IP flottante.
- Le fichier `infrastructure.yaml` peut être adapté à d'autres configurations (nombre de VM, images, etc).

---

© 2025 — Projet académique de déploiement cloud avec IaC & OpenStack


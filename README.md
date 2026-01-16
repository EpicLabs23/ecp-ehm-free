# EHM and ECP

<img src="assets/images/ecp-logo.png" alt="Epic Contol Panel" width="150"/><img src="assets/images/ehm-logo.png" alt="Epic Hosting Manager" width="150"/>

## Free and powerful shared hosting solution

### Highlights

- Run any programming language on your shared server
  -- Exmaple: NodeJS, Go,PHP, Python, Rust, Ruby, Java, C, C++ and many more.
  -- Application wise language version selection.
  -- Multiple PHP FPM versions. and application wise PHP version selection.
- Run any database on your shared server
  -- Exmaple: MySQL, PostgreSQL, MongoDB, Redis and many more.
- Per user resources allocation.
- Can deploy application with zero server knowledge.
- Visual application build and deploy.
- Deploy directly from Git or upload manually.
- One click deployment.
- Webhooks and CI/CD.
- Painless application management.
- Powerfull file manager.
- Web terminal with full power.
- Free SSL certificates.
- DNS Zone editor.
- Cloudflare integration.
- Bind9 Integration.
- Application port mapping.
- Rich code editor.
- Application logs.
- Process manager.
- Powerfullremote backup system.
  -- Backup to any storage provider.
- Cron Jobs.
- Account specific PHP INI configurations.
- Account specific Nginx configurations.
- System logs.

### Requirements

- OS: Ubuntu 24.04
- Minimum RAM: 2GB
- Minimum CPU: 2 cores
- Minimum Disk: 10GB

### Minimal Installation

**Install Dependencies**

- Docker: https://docs.ecpanel.io/ehm/docker-installation
- NodeJS: https://docs.ecpanel.io/ehm/system-setup#install-nodejs-using-node-version-manager-nvm
- Nginx: https://docs.ecpanel.io/ehm/nginx-installation
- Eh manager: https://docs.ecpanel.io/eh-services/intro#download-source-codes
- Database: https://docs.ecpanel.io/eh-services/install-mariadb
- PhpMyAdmin: https://docs.ecpanel.io/eh-services/install-phpmyadmin

**Install EHM**

```bash
sudo su
eh-manager install-ehm
```

**Create first Admin user**

Replace `<version>` with your EHM version

```bash
node /epiclabs23/eh/ehm/<version>/ehm-api/prisma/create-admin.mjs
```

Example:

```bash
node /epiclabs23/eh/ehm/1.0.4/ehm-api/prisma/create-admin.mjs
```

**Access EHM UI**
`http://<domain>:2325`

**Reff**
https://docs.ecpanel.io/ehm/ehm-install

### Detail documentation

https://docs.ecpanel.io/intro

### Bug reports

https://github.com/EpicLabs23/ecp-ehm-free/issues

### Discussion, Support, Ideas

https://github.com/EpicLabs23/ecp-ehm-free/discussions

### Installation and Customization

Whatsapp: +8801670603332

Email: nahidacm[at]gmail[dot]com

# EHM and ECP

<img src="assets/images/ecp-logo.png" alt="Epic Contol Panel" width="150"/><img src="assets/images/ehm-logo.png" alt="Epic Hosting Manager" width="150"/>

## Free and powerful shared hosting solution

EHM (Epic Hosting Manager) and ECP (Epic Control Panel) are free to install and use on as many of your own servers as you like, with unlimited accounts. They are free software but not open source: this repository publishes the compiled releases, not the source code. See `LICENSE.txt`.

### Highlights

- Run any programming language on your shared server
  -- Example: NodeJS, Go, PHP, Python, .NET, Rust, Ruby, Java and many more.
  -- Application wise language version selection.
  -- Multiple PHP versions (8.1, 8.3, 8.4 on OpenLiteSpeed) with per-application selection.
- Run any database on your shared server
  -- MariaDB/MySQL, PostgreSQL, MSSQL and MongoDB built in, each account isolated to its own databases.
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
- Encrypted off-site backups with storage.bd.
- Managed WordPress hosting.
- Import sites from cPanel.
- Billing integration API (WHMCS-style).
- Cron Jobs.
- Account specific PHP INI configurations.
- System logs.

### Requirements

- OS: Ubuntu 22.04 or 24.04
- Minimum RAM: 4GB
- Minimum CPU: 2 cores
- Minimum Disk: 10GB
- Node.js 24 or newer

### Installation

Complete step-by-step guide: https://docs.ecpanel.io/install-in-a-fresh-server

**Install Dependencies**

- Docker: https://docs.ecpanel.io/ehm/docker-installation
- NodeJS: https://docs.ecpanel.io/ehm/system-setup#install-nodejs-using-node-version-manager-nvm
- Nginx: https://docs.ecpanel.io/ehm/nginx-installation
- EH services: https://docs.ecpanel.io/eh-services/intro
- EH manager: https://docs.ecpanel.io/eh-manager/eh-manager-instalation
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
node /epiclabs23/eh/ehm/2.0.5/ehm-api/prisma/create-admin.mjs
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

### Paid support and services

Installation, upgrades, support and customisation, plus hosting infrastructure, business email (coming soon), domains, security, SMS and storage.bd backups:

Whatsapp: +8801670603332

Email: nahidacm[at]gmail[dot]com

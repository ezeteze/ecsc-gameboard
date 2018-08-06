#!/bin/bash

DEPLOYMENT_HTML="html"
DEPLOYMENT_SCHEMA="schema/main.sql"
DEMO_SCHEMA="schema/demo.sql"

grep Debian /etc/issue.net > /dev/null

if [ $? -ne 0 ]; then
    echo "[!] Debian distribution required"
    exit 1
fi

result=`apt-cache search --names-only '^php5$'`
if [ -z "$result" ] ; then
    echo "[!] Incompatible version of Debian detected (Note: package 'php5' is missing)"
    exit 1
fi

if [ ! -d ".git" ]; then
    echo "[!] Git cloned repository is missing (.git)"
    exit 1
fi

if [[ "$PWD" != "/var/www" ]]; then
    echo "[!] This should be run inside the '/var/www'"
    exit 1
fi

if [ ! -f "$DEPLOYMENT_SCHEMA" ]; then
    echo "[!] Deployment file '$DEPLOYMENT_SCHEMA' is missing"
    exit 1
fi

DEBIAN_FRONTEND=noninteractive apt-get -qq -y install apache2 php5 libapache2-mod-php5 libapache2-mod-evasive mysql-server mysql-client php5-mysql unattended-upgrades
sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf
sed -i 's/Options Indexes.*/Options FollowSymLinks/g' /etc/apache2/apache2.conf

# Reference: https://www.brightbox.com/docs/guides/unattended-upgrades/
#            http://www.ubuntufree.com/easily-turn-on-automatic-security-updates-for-ubuntu-servers/
#            https://blog.mattbrock.co.uk/hardening-the-security-on-ubuntu-server-14-04/

cat > /etc/apt/apt.conf.d/20auto-upgrades << EOF
APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Unattended-Upgrade "1";
EOF

sed -i 's/PermitRootLogin.*/PermitRootLogin without-password/g' /etc/ssh/sshd_config
dpkg-statoverride --update --add root sudo 4750 /bin/su &>/dev/null

touch /var/log/wtmp

sed -i 's/^expose_php.*/expose_php = Off/g' /etc/php5/apache2/php.ini
sed -i 's/^html_errors.*/html_errors = Off/g' /etc/php5/apache2/php.ini
sed -i 's/^allow_url_fopen.*/allow_url_fopen = Off/g' /etc/php5/apache2/php.ini
sed -i 's/^allow_url_include.*/allow_url_include = Off/g' /etc/php5/apache2/php.ini
sed -i 's/^disable_functions.*/disable_functions = exec,passthru,system,proc_open,popen,curl_exec,curl_multi_exec,parse_ini_file,show_source,shell_exec/g' /etc/php5/apache2/php.ini

if [ ! -d "/var/log/mod_evasive" ]; then
    mkdir /var/log/mod_evasive
    chown -R www-data:www-data /var/log/mod_evasive
fi

cat > /etc/apache2/mods-available/evasive.conf << EOF
<IfModule mod_evasive20.c>
    DOSHashTableSize    3097
    DOSPageCount        5
    DOSSiteCount        50
    DOSPageInterval     1
    DOSSiteInterval     1
    DOSBlockingPeriod   10
    #DOSLogDir           "/var/log/mod_evasive"
</IfModule>
EOF

cat > /etc/apache2/conf-enabled/security.conf << EOF
ServerTokens Prod
ServerSignature Off
TraceEnable Off
Header unset ETag
FileETag None
EOF

mysql < $DEPLOYMENT_SCHEMA
mysql < $DEMO_SCHEMA

chown -R www-data:www-data /var/www
chown -R root:root /var/www/setup.sh
chmod 700 /var/www/setup.sh

a2enmod -q headers
a2enmod -q evasive
a2enmod -q reqtimeout
a2enmod -q rewrite
service apache2 restart

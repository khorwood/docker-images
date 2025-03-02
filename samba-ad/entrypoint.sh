#!/bin/sh
SAMBA_DOMAIN=${SAMBA_DOMAIN:-SAMDOM}
SAMBA_REALM=${SAMBA_REALM:-samdom.example.com}
SAMBA_ADMIN_PASSWORD=${SAMBA_ADMIN_PASSWORD}

SETUP_LOCK_FILE="/var/lib/samba/private/setup.lock"

setup () {
    rm -f /etc/samba/smb.conf
    rm -rf /var/lib/samba/*
    mkdir -p /var/lib/samba/private

    echo "[global]
    server role = domain controller
    workgroup = $SAMBA_DOMAIN
    realm = $SAMBA_REALM
    netbios name = dc1
    passdb backend = samba4
    idmap_ldb:use rfc2307 = yes

[netlogon]
    path = /var/lib/samba/sysvol/scripts
    read only = No

[sysvol]
    path = /var/lib/samba/$SAMBA_REALM/sysvol
    read only = No" > /etc/samba/smb.conf

    samba-tool domain provision \
        --use-rfc2307 \
        --domain=$SAMBA_DOMAIN \
        --realm=$SAMBA_REALM \
        --server-role=dc \
        --dns-backend=SAMBA_INTERNAL \
        --adminpass=$SAMBA_ADMIN_PASSWORD

    cp /var/lib/samba/private/krb5.conf /etc/krb5.conf

    touch "$SETUP_LOCK_FILE"
}

if [ ! -f "$SETUP_LOCK_FILE" ]; then
    setup
fi

mkdir -p /var/run/samba
/usr/sbin/samba -i

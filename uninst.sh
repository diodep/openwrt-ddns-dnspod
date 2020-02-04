#!/bin/sh
# if NOT run buildroot then stop service
[ -z "${IPKG_INSTROOT}" ] && /etc/init.d/ddns stop >/dev/null 2>&1
# remove services file entries
/bin/sed -i '/dnspod\.cn/d' ${IPKG_INSTROOT}/etc/ddns/services >/dev/null 2>&1
/bin/sed -i '/dnspod\.cn/d' ${IPKG_INSTROOT}/etc/ddns/services_ipv6 >/dev/null 2>&1
rm -f /usr/lib/ddns/update_dnspod_cn.sh 
exit 0 # suppress errors
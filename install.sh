#!/bin/sh
# remove old services file entries
cp update_dnspod_cn.sh /usr/lib/ddns/
/bin/sed -i '/dnspod\.cn/d' ${IPKG_INSTROOT}/etc/ddns/services >/dev/null 2>&1
/bin/sed -i '/dnspod\.cn/d' ${IPKG_INSTROOT}/etc/ddns/services_ipv6 >/dev/null 2>&1
# and create new
printf "%s\\t\\t%s\\n" '"dnspod.cn"' '"update_dnspod_cn.sh"' >> ${IPKG_INSTROOT}/etc/ddns/services
printf "%s\\t\\t%s\\n" '"dnspod.cn"' '"update_dnspod_cn.sh"' >> ${IPKG_INSTROOT}/etc/ddns/services_ipv6
# on real system restart service if enabled
[ -z "${IPKG_INSTROOT}" ] && {
/etc/init.d/ddns enabled && /etc/init.d/ddns start >/dev/null 2>&1
}
exit 0 # suppress errors
#!/bin/bash
#
#  FOG is a computer imaging solution.
#  Copyright (C) 2007  Chuck Syperski & Jian Zhang
#
#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#    any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
[[ ! -f /run/rpcbind.lock ]] && touch /run/rpcbind.lock
[[ -z $packageQuery ]] && packageQuery="rpm -q \$x"
[[ -z $etcconf ]] && etcconf="/etc/apache2/conf.d/fog.conf"
[[ -z $php_ver ]] && php_ver="7"
phpfpm="php-fpm"
[[ -z $packages ]] && packages="apache2 apache2-mod_fcgid apache2-mod_php7 curl dhcp-server gcc gcc-c++ gzip htmldoc lftp m4 make mariadb net-tools nfs-client nfs-kernel-server perl-Crypt-PasswdMD5 php7 php7-fpm php7-gd php7-ldap php7-mbstring php7-mcrypt php7-mysql tar tftp yast2-tftp-server vsftpd wget xinetd"
[[ -z $packageinstaller ]] && packageinstaller="zypper -n install -y "
[[ -z $packagelist ]] && packagelist="zypper -n search -x"
[[ -z $packageupdater ]] && packageupdater="zypper -n update"
[[ -z $packageUpdate ]] && packmanUpdate="zypper -n refresh"
[[ -z $tftpdirdst ]] && tftpdirdst="/srv/tftpboot"
[[ -z $dhcpname ]] && dhcpname="dhcp"
[[ -z $langPackages ]] && langPackages="iso-codes"
if [[ -z $webdirdest ]]; then
    if [[ -z $docroot ]]; then
        docroot="/srv/www/htdocs/"
        webdirdest="${docroot}fog/"
    elif [[ $docroot != *'fog'* ]]; then
        webdirdest="${docroot}fog/"
    else
        webdirdest="${docroot}/"
    fi
fi
[[ -z $webredirect ]] && webredirect="${webdirdest}/index.php"
[[ -z $apacheuser ]] && apacheuser="wwwrun"
[[ -z $apachegroup ]] && apachegroup="www"
[[ -z $apachelogdir ]] && apachelogdir="/var/log/apache2"
[[ -z $apacheerrlog ]] && apacheerrlog="$apachelogdir/error_log"
[[ -z $apacheacclog ]] && apacheacclog="$apachelogdir/access_log"
[[ -z $phpini ]] && phpini="/etc/php7/apache2/php.ini"
[[ -z $storageLocation ]] && storageLocation="/images"
[[ -z $storageLocationCapture ]] && storageLocationCapture="${storageLocation}/dev"
[[ -z $dhcpconfig ]] && dhcpconfig="/etc/dhcpd.conf"
[[ -z $dhcpconfigother ]] && dhcpconfigother="/etc/dhcp/dhcpd.conf"
[[ -z $tftpdirdst ]] && tftpdirdst="/tftpboot"
[[ -z $tftpconfig ]] && tftpconfig="/etc/xinetd.d/tftp"
[[ -z $ftpconfig ]] && ftpconfig="/etc/vsftpd.conf"
[[ -z $dhcp ]] && dhcpd="dhcpd"
[[ -z $snapindir ]] && snapindir="/opt/fog/snapins"

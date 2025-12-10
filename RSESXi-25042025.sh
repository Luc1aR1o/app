#ESXi for IR
output=ESXi_Logs_$(hostname -i | awk '{print $1}')_$(hostname)_$(date +%F_%H-%M-%S)
workdir=$(pwd)
mkdir -p "$output"
cd "$output"

echo -e "[+] System identification"
echo -e uname -a >> ESXi-systeminfo-results.txt 2>> err
uname -a >> ESXi-systeminfo-results.txt 2>> err
echo -e "-------------------------------------" >> ESXi-systeminfo-results.txt 2>> err
echo -e "Done!"

echo -e "[+] Network configuration"
echo -e "hostname" >> ESXi-systeminfo-results.txt 2>> err
hostname >> ESXi-systeminfo-results.txt 2>> err
echo -e "-------------------------------------" >> ESXi-systeminfo-results.txt 2>> err
echo -e "    [+] resolv"
echo -e "cat /etc/resolv.conf" >> ESXi-systeminfo-results.txt 2>> err
cat /etc/resolv.conf | more >> ESXi-systeminfo-results.txt 2>> err
echo -e "-------------------------------------" >> ESXi-systeminfo-results.txt 2>> err
echo -e "    [+] ipconfig"
echo -e "esxcfg-vmknic -l" >> ESXi-systeminfo-results.txt 2>> err
esxcfg-vmknic -l >> ESXi-systeminfo-results.txt 2>> err
echo -e "-------------------------------------" >> ESXi-systeminfo-results.txt 2>> err
echo -e "Done!"

echo -e "[+] Process summary list"
echo -e "ps -Tcjstv" >> ESXi-process-results.txt 2>> err
ps -Tcjstv >> ESXi-process-results.txt 2>> err
echo -e "-------------------------------------" >> ESXi-process-results.txt 2>> err
echo -e "Done!"

echo -e "[+] Process detail list"
echo -e "Process detail list" >> ESXi-process-results.txt 2>> err
ps -Tcjstv | grep "/" | grep -v "/bin/vmx" | grep -v "rhttpproxy" | grep -v "hostd-worker" | grep -v "/etc/vmware/vpxa" | grep -v "/usr/lib/vmware" | grep -v "/opt/vmware/fdm" | more >> ESXi-systeminfo-results.txt 2>> err
echo -e "-------------------------------------" >> ESXi-process-results.txt 2>> err
echo -e "Done!"

echo -e "[+] Opening port list"
echo -e "Opening port list" >> ESXi-systeminfo-results.txt 2>> err
esxcli network ip connection list | grep -i "listen\|udp" | awk '{print $4"/"$1"/"$9}' | awk -F ':' '{print $NF}' | sort | uniq >> ESXi-systeminfo-results.txt 2>> err
echo -e "-------------------------------------" >> ESXi-systeminfo-results.txt 2>> err
echo -e "Done!"

echo -e "[+] All listening"
echo -e "All listening" >> ESXi-systeminfo-results.txt 2>> err
esxcli network ip connection list | grep -i listen >> ESXi-systeminfo-results.txt 2>> err
echo -e "-------------------------------------" >> ESXi-systeminfo-results.txt 2>> err
echo -e "Done!"

echo -e "[+] All connection"
echo -e "All connection" >> ESXi-systeminfo-results.txt 2>> err
esxcli network ip connection list | more >> ESXi-systeminfo-results.txt 2>> err
echo -e "-------------------------------------" >> ESXi-systeminfo-results.txt 2>> err
echo -e "Done!"

echo -e "[+] Current login sessions"
echo -e "Current login sessions" >> ESXi-systeminfo-results.txt 2>> err
who >> ESXi-systeminfo-results.txt 2>> err
echo -e "-------------------------------------" >> ESXi-systeminfo-results.txt 2>> err
echo -e "Done!"

echo -e "[+] All users"
echo -e "cat /etc/passwd" >> ESXi-systeminfo-results.txt 2>> err
cat /etc/passwd | more >> ESXi-systeminfo-results.txt 2>> err
echo -e "-------------------------------------" >> ESXi-systeminfo-results.txt 2>> err
echo -e "Done!"

echo -e "[+] All sudoers"
echo -e "cat /etc/sudoers" >> ESXi-systeminfo-results.txt 2>> err
cat /etc/sudoers | more >> ESXi-systeminfo-results.txt 2>> err
echo -e "-------------------------------------" >> ESXi-systeminfo-results.txt 2>> err
echo -e "Done!"

echo -e "[+] All crontabs"
echo -e "ls -lah /var/spool/cron/crontabs" >> ESXi-systeminfo-results.txt 2>> err
ls -lah /var/spool/cron/crontabs >> ESXi-systeminfo-results.txt 2>> err
echo -e "-------------------------------------" >> ESXi-systeminfo-results.txt 2>> err
echo -e "Done!"

echo -e "[+] Root crontabs"
echo -e "cat /var/spool/cron/crontabs/root" >> ESXi-systeminfo-results.txt 2>> err
cat /var/spool/cron/crontabs/root | more >> ESXi-systeminfo-results.txt 2>> err
echo -e "-------------------------------------" >> ESXi-systeminfo-results.txt 2>> err
echo -e "Done!"

echo -e "[+] init.d summart list"
echo -e "ls -lahtr /etc/init.d/" >> ESXi-systeminfo-results.txt 2>> err
ls -lahtr /etc/init.d/ >> ESXi-systeminfo-results.txt 2>> err
echo -e "-------------------------------------" >> ESXi-systeminfo-results.txt 2>> err
echo -e "Done!"

echo -e "[+] Startup scripts"
echo -e "    [+] ls -latr /etc/profile"
echo -e "ls -latr /etc/profile" >> ESXi-systeminfo-results.txt 2>> err
ls -latr /etc/profile >> ESXi-systeminfo-results.txt 2>> err
echo -e "-------------------------------------" >> ESXi-systeminfo-results.txt 2>> err
echo -e "Done!"
echo -e "cat /etc/profile" >> ESXi-systeminfo-results.txt 2>> err
cat /etc/profile | more >> ESXi-systeminfo-results.txt 2>> err
echo -e "-------------------------------------" >> ESXi-systeminfo-results.txt 2>> err
echo -e "Done!"

echo -e "    [+] ls -latr /etc/environment"
echo -e "ls -latr /etc/environment" >> ESXi-systeminfo-results.txt 2>> err
ls -latr /etc/environment >> ESXi-systeminfo-results.txt 2>> err
echo -e "-------------------------------------" >> ESXi-systeminfo-results.txt 2>> err
echo -e "Done!"
echo -e "cat /etc/environment" >> ESXi-systeminfo-results.txt 2>> err
cat /etc/environment | more >> ESXi-systeminfo-results.txt 2>> err
echo -e "-------------------------------------" >> ESXi-systeminfo-results.txt 2>> err
echo -e "Done!"

echo -e "    [+] ls -latr /etc/bashrc"
echo -e "ls -latr /etc/bashrc" >> ESXi-systeminfo-results.txt 2>> err
ls -latr /etc/bashrc >> ESXi-systeminfo-results.txt 2>> err
echo -e "-------------------------------------" >> ESXi-systeminfo-results.txt 2>> err
echo -e "Done!"
echo -e "cat /etc/bashrc" >> ESXi-systeminfo-results.txt 2>> err
cat /etc/bashrc | more >> ESXi-systeminfo-results.txt 2>> err
echo -e "-------------------------------------" >> ESXi-systeminfo-results.txt 2>> err
echo -e "Done!"

echo -e "    [+] ls -latr /etc/init.d/"
echo -e "ls -latr /etc/init.d/" >> ESXi-systeminfo-results.txt 2>> err
ls -latr /etc/init.d/ | more >> ESXi-systeminfo-results.txt 2>> err
echo -e "-------------------------------------" >> ESXi-systeminfo-results.txt 2>> err
echo -e "Done!"

echo -e "    [+] ls -latr /etc/rc*.d/"
echo -e "ls -latr /etc/rc*.d/" >> ESXi-systeminfo-results.txt 2>> err
ls -latr /etc/rc*.d/ | more >> ESXi-systeminfo-results.txt 2>> err
echo -e "-------------------------------------" >> ESXi-systeminfo-results.txt 2>> err
echo -e "Done!"

echo -e "[+] All libs"
echo -e "    [+] winnti check"
echo -e "ls -lah /lib/libxselinux" >> ESXi-systeminfo-results.txt 2>> err
ls -lah /lib/libxselinux >> ESXi-systeminfo-results.txt 2>> err
echo -e "-------------------------------------" >> ESXi-systeminfo-results.txt 2>> err
echo -e "ls -lah /lib/libxselinux.so" >> ESXi-systeminfo-results.txt 2>> err
ls -lah /lib/libxselinux.so >> ESXi-systeminfo-results.txt 2>> err
echo -e "-------------------------------------" >> ESXi-systeminfo-results.txt 2>> err
echo -e "ls -lah /lib64/libxselinux.so" >> ESXi-systeminfo-results.txt 2>> err
ls -lah /lib64/libxselinux.so >> ESXi-systeminfo-results.txt 2>> err
echo -e "-------------------------------------" >> ESXi-systeminfo-results.txt 2>> err
echo -e "    [+] ls -lahtr /var/lib"
echo -e "ls -lahtr /var/lib" >> ESXi-systeminfo-results.txt 2>> err
ls -lahtr /var/lib >> ESXi-systeminfo-results.txt 2>> err
echo -e "-------------------------------------" >> ESXi-systeminfo-results.txt 2>> err
echo -e "Done!"

echo -e "[+] Temp dirs"
echo -e "    [+] ls -lahtr /tmp"
echo -e "ls -lahtr /tmp" >> ESXi-systeminfo-results.txt 2>> err
ls -lahtr /tmp >> ESXi-systeminfo-results.txt 2>> err
echo -e "-------------------------------------" >> ESXi-systeminfo-results.txt 2>> err
echo -e "    [+] ls -lahtr /var/tmp"
echo -e "ls -lahtr /var/tmp" >> ESXi-systeminfo-results.txt 2>> err
ls -lahtr /var/tmp >> ESXi-systeminfo-results.txt 2>> err
echo -e "-------------------------------------" >> ESXi-systeminfo-results.txt 2>> err
echo -e "    [+] ls -lahtr /scratch/var/tmp"
echo -e "ls -lahtr /scratch/var/tmp" >> ESXi-systeminfo-results.txt 2>> err
ls -lahtr /scratch/var/tmp >> ESXi-systeminfo-results.txt 2>> err
echo -e "-------------------------------------" >> ESXi-systeminfo-results.txt 2>> err
echo -e "Done!"

echo -e "[+] Firewall rules"
echo -e "    [+] esxcli network firewall get"
echo -e "esxcli network firewall get" >> ESXi-systeminfo-results.txt 2>> err
esxcli network firewall get >> ESXi-systeminfo-results.txt 2>> err
echo -e "-------------------------------------" >> ESXi-systeminfo-results.txt 2>> err
echo -e "    [+] esxcli network firewall ruleset rule list"
echo -e "esxcli network firewall ruleset rule list" >> ESXi-systeminfo-results.txt 2>> err
esxcli network firewall ruleset rule list >> ESXi-systeminfo-results.txt 2>> err
echo -e "-------------------------------------" >> ESXi-systeminfo-results.txt 2>> err
echo -e "Done!"

echo -e "[+] SSH Login history"
echo -e "    [+] Succeeded SSH login"
echo -e "cat /var/log/auth.log | grep -i "accept"" >> ESXi-login-results.txt 2>> err
cat /var/log/auth.log | grep -i "accept" | awk '{print "Login succeeded: "$1" -- "$6" -- "$8":"$10" -- "$11}' | more >> ESXi-login-results.txt 2>> err
echo -e "-------------------------------------" >> ESXi-login-results.txt 2>> err
echo -e "Done!"
echo -e "    [+] Failed SSH login"
echo -e "cat /var/log/auth.log | grep -i "fail"" >> ESXi-login-results.txt 2>> err
cat /var/log/auth.log | grep -i "fail" | grep -i "error" | awk '{print "Login failed: "$1" -- "$8" -- "$10}' | more >> ESXi-login-results.txt 2>> err
echo -e "-------------------------------------" >> ESXi-login-results.txt 2>> err
echo -e "Done!"

echo -e "    [+] SSH login"
echo -e "cat /var/log/auth.log | more" >> ESXi-login-results.txt 2>> err
cat /var/log/auth.log | more >> ESXi-login-results.txt 2>> err
echo -e "-------------------------------------" >> ESXi-login-results.txt 2>> err
echo -e "Done!"

echo -e "    [+] SSH Shell log"
echo -e "cat /var/log/shell.log" >> ESXi-shell-results.txt 2>> err
cat /var/log/shell.log | more >> ESXi-shell-results.txt 2>> err
echo -e "-------------------------------------" >> ESXi-shell-results.txt 2>> err
echo -e "Done!"

echo -e "+---------------------------------------------------------------------------+"
echo -e "|      2025 - ____ _____ ________ |  Threat Hunting and Incident Response   |"
echo -e "+---------------------------------------------------------------------------+"

# ==================== VAR ==================== #

cp -r /var/log ./var_log
cp -r /scratch/log ./scratch_log
cd "$workdir"
echo -e " Creating $output.tar.gz "
tar -czf "$output.tar.gz" $output
rm -rf "$output"
if [ ! -d "$output" ]; then
    echo " Clean-up Successful!"
fi
if [ -d "$output" ]; then
    echo " "
    echo " WARNING Clean-up ERROR! "
fi
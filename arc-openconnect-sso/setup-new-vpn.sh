#!/bin/bash
function get_inputs() {
    read -p "Client ID: " CUSTOMER
    read -p "Client domain: " DOMAIN 
    read -p "VPN gateway: " GATEWAY
    read -p "Username: " USER
    read -sp "Password: " PASSWORD
    read -p "Client DNS 1: " DNS1
    read -p "Client DNS 2: " DNS2
}
function verify_inputs() {
    clear
    echo "Your machine hostname is" $LOCALHOSTNAME
    echo "Your username for the client" $USER
    echo "Your clients domain name is" $DOMAIN
    echo "Your clients vpn gateway is" $GATEWAY
    echo " "
    read -p "Is this correct? (y/n) :  " CONFIRMATION
    if ! [[ $CONFIRMATION =~ ^[Yy]$ ]]; then
        exit 1
    fi
}

function setup_client_dir() {
    mkdir -p "${LOCATION}/${CUSTOMER}"
    echo "$PASSWORD" > "${LOCATION}/${CUSTOMER}/PASSWORD"  
}

function create_configs() {
    create_dnsmasq_config
    create_openconnect_profile
    create_ssh_config
    create_launch_script
}

function create_dnsmasq_config() {
    DNSMASQ_CONFIG="${LOCATION}/${CUSTOMER}/dnsmasq.conf"
    echo "port=53" > $DNSMASQ_CONFIG
    echo "domain-needed" >> $DNSMASQ_CONFIG
    echo "bogus-priv" >> $DNSMASQ_CONFIG
    echo "no-resolv" >> $DNSMASQ_CONFIG
    echo "no-poll" >> $DNSMASQ_CONFIG
    echo "no-hosts" >> $DNSMASQ_CONFIG
    echo "log-queries" >> $DNSMASQ_CONFIG
    echo "" >> $DNSMASQ_CONFIG
    # Only need to edit the following part?
    echo "server=/$CLIENTFQDN/127.0.0.#$DNSPORT" >> $DNSMASQ_CONFIG
    echo "" >> $DNSMASQ_CONFIG
    echo "server=$CLIENTVPNSERVER1" >> $DNSMASQ_CONFIG
    echo "server=$CLIENTVPNSERVER2" >> $DNSMASQ_CONFIG
    echo "server=/$CLIENFQDN/127.0.0.1#$DNSPORT" >> $DNSMASQ_CONFIG
}

function create_openconnect_profile() {
    OCVPN_CONFIG="${LOCATION}/${CUSTOMER}/openconnect.conf"
    echo "user=$USER" > $OCVPN_CONFIG
    echo passwd-on-stdin >> $OCVPN_CONFIG
    echo servercert=pin-sha256:YOUR-SERVERCERT-HERE >> $OCVPN_CONFIG
    echo protocol=gp >> $OCVPN_CONFIG
    echo server=$CLIENTVPNGATEWAY >> $OCVPN_CONFIG
}

function create_ssh_config() {
    SSH_CONFIG="${LOCATION}/${CUSTOMER}/SSH.conf"
    echo "Host localhost" > $SSH_CONFIG
    echo "	StrictHostKeyChecking no" >> $SSH_CONFIG
	echo "	Port $SSHPORT"  >> $SSH_CONFIG
	echo "	ForwardAgent yes" >> $SSH_CONFIG
    echo "	UserKnownHostsFile /dev/null" >> $SSH_CONFIG
} 

function create_launch_script() {
    SCRIPT="${LOCATION}/${CUSTOMER}/star-vpn.sh"
    echo "#!/bin/bash" > $SCRIPT
    echo "docker run -it --rm --cap-add NET_ADMIN -v ~/vpn-docker/$CLEANCUSTOMER/root:/root -v ~/vpn-docker/$CLEANCUSTOMER/sudoers.d:/etc/sudoers.d -v ~/vpn-docker/$CLEANCUSTOMER/dnsmasq.d:/etc/dnsmasq.d -p $SSHPORT:22 -p $DNSPORT:53 --name=$CLEANCUSTOMER_vpn ubuntu >/dev/null 2>&1" >> $SCRIPT
}

function confirm_settings() {
    echo "Config:"
    echo "DNS Port: $DNSP"  
    # display all settings
    read -p "Continue? [y/N] " CONFIRM
}

function main() {
    LOCATION=$(pwd)
    get_inputs
    verify_inputs
    setup_client_dir
    # create_configs 
    #confirm_settings
}

main
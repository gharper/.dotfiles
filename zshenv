export LANG=en_US.UTF-8
export PATH="$PATH:/usr/local/bin"
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export LDBASE='dc=skytap,dc=com'
export LDHOST='ldaps://tuk8ldap-a.qa.skytap.com'
if [[ -f /etc/ssl/certs/ca-certificates.crt ]]; then
  export CURL_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt
  export REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt
fi

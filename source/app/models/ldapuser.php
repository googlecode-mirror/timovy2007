<?php
// http://bakery.cakephp.org/articles/view/using-ldap-as-a-datasource-basic-find-example
// http://bakery.cakephp.org/articles/view/ldap-models-in-cakephp 
class LdapUser extends AppModel {
    
    var $name = 'LdapUser';
    
    var $useTable   = false;
    var $host       = 'ldap.stuba.sk';
    var $port       = 389;
    var $baseDn     = 'dc=stuba,dc=sk';
    var $user       = 'uid='; 
    var $pass       = null;
    var $ds; 
/*
    var $hasOne = array (
        'User' => array (
            'className' => 'User',
            'foreignKey' => 'ldapname'
        )
    );*/
    
    function __construct()
    {
echo "ldap construct";    
        parent::__construct();
        $this->ds = ldap_connect($this->host, $this->port);
        ldap_set_option($this->ds, LDAP_OPT_PROTOCOL_VERSION, 3);
        ldap_bind($this->ds, $this->user, $this->pass);
    }
    
    function __destruct()
    {
        ldap_close($this->ds);
    }  
    
    function findAll($attribute = 'uid', $value = '*', $baseDn = 'ou=People,dc=example,dc=com')
    {
        $r = ldap_search($this->ds, $baseDn, $attribute . '=' . $value);
    
        if ($r)
        {
            //if the result contains entries with surnames,
            //sort by surname:
            ldap_sort($this->ds, $r, "sn");
    
            return ldap_get_entries($this->ds, $r);
        }
    }       
}
?> 
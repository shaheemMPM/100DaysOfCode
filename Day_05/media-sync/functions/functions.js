const os      = require('os'),
      ifaces  = os.networkInterfaces()

module.exports = {
    getIpAdress : () => { 
        let ipaddr
        Object.keys(ifaces).forEach(function (ifname) {
            var alias = 0
            ifaces[ifname].forEach(function (iface) {
            if ('IPv4' !== iface.family || iface.internal !== false) {
                return false
            }
            ipaddr = iface.address
            ++alias
            })
        })
        return ipaddr
    }
}
# chef-iscsiadm-cookbook

 Chef cookbook - iscsiadm as a service

## Supported Platforms

 Debian/Ubuntu and other Linux...

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['chef-iscsiadm']['portal']</tt></td>
    <td>Array of hashs</td>
    <td>targets definition</td>
    <td><tt>[]</tt></td>
  </tr>
</table>

## Usage

 data bag "iscsiadm":
```json
 {
   "id": "owncloud_my_domain",
   "chef-iscsiadm": {
     "portal": [
       {
         "ip": "192.168.0.3",
         "targets": [
           "iqn.2014-12.com.synology:rackstation2.disk1"
         ]
       }
     ]
   }
 }
```

### chef-iscsiadm::default

Include `chef-iscsiadm` in your node's `run_list`:

```json
{
  "name": "iscsiadm",
  "description": "",
  "json_class": "Chef::Role",
  "default_attributes": {
  },
  "override_attributes": {
    "chef-nodeAttributes": {
      "databag_name": [
        "iscsiadm"
      ]
    }
  },
  "chef_type": "role",
  "run_list": [
    "recipe[chef-nodeAttributs::default]",
    "recipe[chef-iscsiadm::default]"
  ]
}
```

## License and Authors

Author:: PE, pf. (<peychart@mail.pf>)

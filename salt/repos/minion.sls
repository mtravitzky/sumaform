{% if 'minion' in grains.get('roles') and grains.get('testsuite') | default(false, true) and grains['osfullname'] == 'SLES' %}

{% if '12' in grains['osrelease'] %}
containers_pool_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de/ibs", true) }}/SUSE/Products/SLE-Module-Containers/12/x86_64/product/

containers_updates_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de/ibs", true) }}/SUSE/Updates/SLE-Module-Containers/12/x86_64/update/

{% endif %}

{% if '15' in grains['osrelease'] %}
containers_pool_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de/ibs", true) }}/SUSE/Products/SLE-Module-Containers/15/x86_64/product/

containers_updates_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de/ibs", true) }}/SUSE/Updates/SLE-Module-Containers/15/x86_64/update/

devel_pool_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de/ibs", true) }}/SUSE/Products/SLE-Module-Development-Tools/15-SP1/x86_64/product/

devel_updates_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de/ibs", true) }}/SUSE/Updates/SLE-Module-Development-Tools/15-SP1/x86_64/update/

{% endif %}


{% endif %}

# HACK: work around #10852
default_nop:
  test.nop: []

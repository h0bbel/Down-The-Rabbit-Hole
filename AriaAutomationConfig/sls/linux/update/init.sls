# Name: linux/update/init.sls
# Version 0.1
#
# Description: Package updates Linux


pkg.refresh_db:
  module.run

pkg.upgrade:
  module.run
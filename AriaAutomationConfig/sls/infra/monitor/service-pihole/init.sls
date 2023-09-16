# Name: infra/monitor/service-pihole/init.sls
# Check if pihole-ftl service is running

check_pihole_service:
  service.running:
    - name: pihole-FTL
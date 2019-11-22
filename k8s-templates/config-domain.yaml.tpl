apiVersion: v1
kind: ConfigMap
metadata:
  name: config-domain
  namespace: knative-serving
data:
  # These are example settings of domain.
  # example.org will be used for routes having app=prod.
  #  {{CUSTOM_DOMAIN}}: |
  #      selector:
  #      app: prod
  # Default value for domain, for routes that does not have app=prod labels.
  # Although it will match all routes, it is the least-specific rule so it
  # will only be used if no other domain matches.
  {{CUSTOM_DOMAIN}}: ""

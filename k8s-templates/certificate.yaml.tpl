apiVersion: certmanager.k8s.io/v1alpha1
kind: Certificate
metadata:
  name: my-certificate
  # Istio certs secret lives in the istio-system namespace, and
  # a cert-manager Certificate is namespace-scoped.
  namespace: istio-system
spec:
  # Reference to the Istio default cert secret.
  secretName: istio-ingressgateway-certs
  acme:
    config:
    # Each certificate could rely on different ACME challenge
    # solver.  In this example we are using one provider for all
    # the domains.
    - dns01:
        provider: cloud-dns-provider
      domains:
      # Since certificate wildcards only allow one level, we will
      # need to one for every namespace that Knative is used in.
      # We don't need to use wildcard here, fully-qualified domains
      # will work fine too.
      - "*.{{SERVICE_SUBDOMAIN}}.{{CUSTOM_DOMAIN}}"
  # The certificate common name, use one from your domains.
  commonName: "*.{{SERVICE_SUBDOMAIN}}.{{CUSTOM_DOMAIN}}"
  dnsNames:
  # Provide same list as `domains` section.
  - "*.{{SERVICE_SUBDOMAIN}}.{{CUSTOM_DOMAIN}}"
  # Reference to the ClusterIssuer we created in the previous step.
  issuerRef:
    kind: ClusterIssuer
    name: letsencrypt-issuer

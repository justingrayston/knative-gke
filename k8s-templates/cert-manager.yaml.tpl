apiVersion: certmanager.k8s.io/v1alpha1
kind: ClusterIssuer
metadata:
  name: letsencrypt-issuer
  namespace: cert-manager
spec:
  acme:
    server: https://acme-v02.api.letsencrypt.org/directory
    # This will register an issuer with LetsEncrypt.  Replace
    # with your admin email address.
    email: {{LETS_ENCRYPT_EMAIL}}
    privateKeySecretRef:
      # Set privateKeySecretRef to any unused secret name.
      name: letsencrypt-issuer
    dns01:
      providers:
      - name: cloud-dns-provider
        clouddns:
          # Set this to your GCP project-id
          project: {{PROJECT_ID}}
          # Set this to the secret that we publish our service account key
          # in the previous step.
          serviceAccountSecretRef:
            name: cloud-dns-key
            key: key.json

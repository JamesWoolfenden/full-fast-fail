# fails
# CKV_K8S_5: "Containers should not run with allowPrivilegeEscalation"
resource "kubernetes_pod_security_policy" "fail_admitted" {
  metadata {
    name = "terraform-example"
  }
  spec {
    privileged                 = true
    allow_privilege_escalation = true

    volumes = [
      "configMap",
      "emptyDir",
      "projected",
      "secret",
      "downwardAPI",
      "persistentVolumeClaim",
    ]

    run_as_user {
      rule = "RunAsAny"
    }

    se_linux {
      rule = "RunAsAny"
    }

    supplemental_groups {
      rule = "RunAsAny"
      range {
        min = 1
        max = 65535
      }
    }

    fs_group {
      rule = "MustRunAs"
      range {
        min = 0
        max = 65535
      }
    }
  }
}

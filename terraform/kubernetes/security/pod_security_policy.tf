# fails
# Do not admit containers wishing to share the host IPC namespaceCheckov CKV_K8S_3
# Do not admit containers wishing to share the host process ID namespaceCheckov CKV_K8S_1
# Do not admit containers wishing to share the host network namespaceCheckov CKV_K8S_4
# Containers should not run with allowPrivilegeEscalationCheckov CKV_K8S_5
resource "kubernetes_pod_security_policy" "fail" {
  metadata {
    name = "terraform-example"
  }
  spec {
    privileged                 = true
    allow_privilege_escalation = true
    host_ipc                   = true
    host_pid                   = true
    host_network               = true

    volumes = [
      "configMap",
      "emptyDir",
      "projected",
      "secret",
      "downwardAPI",
      "persistentVolumeClaim",
    ]
    # required_drop_capabilities = [
    #   "NET_RAW",
    #   "KILL",
    #   "SYS_TIME",
    # ]
    run_as_user {
      rule = "RunAsAny"
    }

    se_linux {
      rule = "RunAsAny"
    }

    supplemental_groups {
      rule = "MustRunAs"
      range {
        min = 1
        max = 65535
      }
    }

    fs_group {
      rule = "MustRunAs"
      range {
        min = 1
        max = 65535
      }
    }

    read_only_root_filesystem = true
  }
}

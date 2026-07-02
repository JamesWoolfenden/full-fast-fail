# fail
# Binary Authorization policy must be in enforcing mode (HLD_GCP_184)
resource "google_binary_authorization_policy" "fail" {
  project = "gcp-bridgecrew-deployment"

  default_admission_rule {
    evaluation_mode  = "REQUIRE_ATTESTATION"
    enforcement_mode = "DRYRUN_AUDIT_LOG_ONLY"

    require_attestations_by = [
      google_binary_authorization_attestor.fail.name,
    ]
  }
}

resource "google_binary_authorization_attestor" "fail" {
  name    = "attestor-fail"
  project = "gcp-bridgecrew-deployment"

  attestation_authority_note {
    note_reference = google_container_analysis_note.fail.name
  }
}

resource "google_container_analysis_note" "fail" {
  name    = "attestor-note-fail"
  project = "gcp-bridgecrew-deployment"

  attestation_authority {
    hint {
      human_readable_name = "Attestor Note Fail"
    }
  }
}

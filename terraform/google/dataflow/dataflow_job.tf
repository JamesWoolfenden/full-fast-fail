# fails
# CKV_GCP_90: "Ensure data flow jobs are encrypted with Customer Supplied Encryption Keys (CSEK)"
# CKV_GCP_94: "Ensure Dataflow jobs are private"

resource "google_dataflow_job" "fail" {
  name              = "dataflow-job"
  template_gcs_path = "gs://my-bucket/templates/template_file"
  temp_gcs_location = "gs://my-bucket/tmp_dir"
  parameters = {
    foo = "bar"
    baz = "qux"
  }
  #   kms_key_name =
}

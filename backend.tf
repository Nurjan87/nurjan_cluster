terraform {
  backend "s3" {
  bucket = "nurjancluster.com"
  key = "state/nurjan_cluster"
  region = "us-west-1"

}
}

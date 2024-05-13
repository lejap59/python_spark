provider "mongodbatlas" {
  # Configuration options
}

# Create a Project
resource "mongodbatlas_project" "atlas-project" {
  org_id = var.atlas_org_id
  name = var.atlas_project_name
}

# Example AWS cluster
resource "mongodbatlas_cluster" "cluster1" {
  project_id = mongodbatlas_project.atlas-project.id
  name = "studiclusterVince"
#  project_id   = var.atlas-project.id
#  name         = var.atlas_project_name
#  cluster_type = "REPLICASET"
#  replication_specs {
#    num_shards = 1
#    regions_config {
#      region_name     = var.atlas_region
#      electable_nodes = 3
#      priority        = 7
#      read_only_nodes = 0
#    }
#  }
#  auto_scaling_disk_gb_enabled = true
  mongo_db_major_version       = var.mongodb_version 

  # Provider Settings
  provider_name               = var.cloud_provider
  backing_provider_name = "AWS"  
  provider_region_name = var.atlas_region
  provider_instance_size_name = var.cluster_instance_size_name
}

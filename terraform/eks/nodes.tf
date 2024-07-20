 resource "aws_eks_node_group" "worker-node-group" {
  cluster_name  = aws_eks_cluster.studiEKS.name
  node_group_name = "studi-workernodes"
  node_role_arn  = aws_iam_role.workernodes.arn
  subnet_ids   = [element(aws_subnet.public_subnets, 1).id, element(aws_subnet.public_subnets, 2).id]
  instance_types = ["t3.xlarge"]
 
  scaling_config {
   desired_size = 1
   max_size   = 1
   min_size   = 1
  }
 
  depends_on = [
   aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
   aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
   #aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
  ]
 }

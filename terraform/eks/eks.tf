resource "aws_eks_cluster" "studiEKS" {
 name = "myStudiEKS-cluster"
 role_arn = aws_iam_role.eks-iam-role.arn

 vpc_config {
  subnet_ids = [element(aws_subnet.public_subnets, 1).id, element(aws_subnet.public_subnets, 2).id ]
 }

 depends_on = [
  aws_iam_role.eks-iam-role,
 ]
}

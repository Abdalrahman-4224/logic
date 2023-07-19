class BranchesModel {
  final String? branchtittle;
  final String? branchid;
  BranchesModel({
    required this.branchid,
    required this.branchtittle,
  });
  factory BranchesModel.fromjson(Map<String, dynamic> json) {
    return BranchesModel(
        branchid: json['_id'], branchtittle: json['branchName']);
  }
}

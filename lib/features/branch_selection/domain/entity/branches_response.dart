class BranchesResponse {
  final int? businessId;
  final int? count;
  final int? branchesCount;
  final List<Branch?>? branches;

  BranchesResponse({
    this.businessId,
    this.count,
    this.branchesCount,
    this.branches,
  });
}

class Branch {
  final int? id;
  final String? storeName;
  final String? address;
  final String? phone;
  final String? ownerName;
  final bool? isActive;
  final String? createdAt;
  final int? businessId;
  final BranchBusiness? business;

  Branch({
    this.id,
    this.storeName,
    this.address,
    this.phone,
    this.ownerName,
    this.isActive,
    this.createdAt,
    this.businessId,
    this.business,
  });
}

class BranchBusiness {
  final int? id;
  final String? name;
  final String? ownerName;

  BranchBusiness({this.id, this.name, this.ownerName});
}

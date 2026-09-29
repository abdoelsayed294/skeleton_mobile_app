import 'package:skeleton/features/branch_selection/data/model/branches_response_dto.dart';
import 'package:skeleton/features/branch_selection/domain/entity/branches_response.dart';

extension BranchesResponseDtoMapper on BranchesResponseDto {
  BranchesResponse toEntity() => BranchesResponse(
    businessId: businessId,
    count: count,
    branchesCount: branchesCount,
    branches: branches
        ?.map((branch) => branch?.toEntity())
        .whereType<Branch>()
        .toList(),
  );
}

extension BranchDtoMapper on BranchDto {
  Branch toEntity() => Branch(
    id: id,
    storeName: storeName,
    address: address,
    phone: phone,
    ownerName: ownerName,
    isActive: isActive,
    createdAt: createdAt,
    businessId: businessId,
    business: business?.toEntity(),
  );
}

extension BranchBusinessDtoMapper on BranchBusinessDto {
  BranchBusiness toEntity() =>
      BranchBusiness(id: id, name: name, ownerName: ownerName);
}

import 'package:admin/core/services/domain_service.dart';
import 'package:admin/core/services/entity_service.dart';
import 'package:admin/core/services/privilege_service.dart';
import 'package:admin/core/services/resource_service.dart';
import 'package:admin/core/services/role_group_service.dart';
import 'package:admin/core/services/role_service.dart';
import 'package:admin/core/services/tag_service.dart';
import 'package:admin/core/services/user_service.dart';

class Services
    with
        UserService,
        PrivilegeService,
        ResourceService,
        RoleGroupService,
        RoleService,
        DomainService,
        EntityService,
        TagService {}

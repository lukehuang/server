-- CREATE DATABASE IF NOT EXISTS `domeos`;
-- grant all privileges on domeos.* to 'domeos'@'%' with grant option;

-- use domeos;

CREATE TABLE IF NOT EXISTS `auto_build` (
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `projectId` INT(11) NOT NULL DEFAULT '0',
  `branch` VARCHAR(255) NULL DEFAULT '0',
  `tag` INT(11) NULL DEFAULT '0'
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `base_images` (
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `imageName` VARCHAR(255) NOT NULL DEFAULT '0',
  `imageTag` VARCHAR(255) NULL DEFAULT '0',
  `registry` VARCHAR(255) NULL DEFAULT '0',
  `description` TEXT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `base_image_custom` (
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `imageName`  VARCHAR(255) NOT NULL DEFAULT '0',
  `imageTag` VARCHAR(255) DEFAULT NULL,
  `description` TEXT,
  `autoCustom` TINYINT(1) NOT NULL,
  `createTime` BIGINT(20) NOT NULL DEFAULT '0',
  `status` VARCHAR(255) DEFAULT NULL,
  `sourceImageJson` VARCHAR(255) DEFAULT NULL,
  `dockerfile` VARCHAR(255) DEFAULT NULL,
  `fileJson` TEXT,
  `secret` VARCHAR(255) DEFAULT NULL,
  `logMD5` VARCHAR(255) DEFAULT NULL,
  `finishTime` BIGINT(20) DEFAULT NULL,
  `imageSize` DOUBLE DEFAULT NULL,
  `publish` TINYINT(1) DEFAULT NULL,
  `username` VARCHAR (50) DEFAULT NULL,
  `message` TEXT
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `build_info` (
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `projectId` INT(11) NOT NULL DEFAULT '0',
  `codeBranch` VARCHAR(255) NULL DEFAULT '0',
  `codeTag` VARCHAR(255) NULL DEFAULT '0',
  `imageName` VARCHAR(255) NULL DEFAULT '0',
  `imageTag` VARCHAR(255) NULL DEFAULT '0',
  `imageSize` DOUBLE NOT NULL DEFAULT '0',
  `registry` VARCHAR(255) NOT NULL DEFAULT '0',
  `cmtName` VARCHAR(255) NULL DEFAULT NULL,
  `cmtId` VARCHAR(255) NULL DEFAULT '0',
  `cmtMessage` TEXT NULL,
  `cmtAuthoredDate` VARCHAR(255) NULL DEFAULT NULL,
  `cmtAuthorName` VARCHAR(255) NULL DEFAULT NULL,
  `cmtAuthorEmail` VARCHAR(255) NULL DEFAULT NULL,
  `cmtCommittedDate` VARCHAR(255) NULL DEFAULT NULL,
  `cmtCommitterName` VARCHAR(255) NULL DEFAULT NULL,
  `cmtCommitterEmail` VARCHAR(255) NULL DEFAULT NULL,
  `createTime` BIGINT(20) NOT NULL,
  `finishTime` BIGINT(20) NOT NULL,
  `status` VARCHAR(255) NOT NULL,
  `message` TEXT NULL,
  `userId` INT(11) NOT NULL,
  `userName` VARCHAR(255) NULL DEFAULT '"auto"',
  `autoBuild` INT(11) NOT NULL,
  `isGC` INT(11) NOT NULL DEFAULT '0'
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `build_log_info` (
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `projectId` INT(11) NOT NULL DEFAULT '0',
  `buildId` INT(11) NOT NULL DEFAULT '0',
  `md5` VARCHAR(255) NOT NULL DEFAULT '0'
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `build_secret` (
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `buildId` INT(11) NOT NULL DEFAULT '0',
  `secret` VARCHAR(255) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `cluster_basic` (
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255) NOT NULL DEFAULT '0' UNIQUE,
  `api` VARCHAR(255) NOT NULL DEFAULT '0' UNIQUE,
  `tag` VARCHAR(255) NULL DEFAULT '0',
  `ownerName` VARCHAR(255) NOT NULL DEFAULT '0',
  `ownerType` VARCHAR(255) NOT NULL DEFAULT '0',
  `domain` VARCHAR(255) NULL DEFAULT NULL,
  `logConfig` INT(11) NOT NULL DEFAULT '0',
  `dns` VARCHAR(255) NULL DEFAULT NULL,
  `etcd` VARCHAR(255) NOT NULL,
  `createTime` BIGINT(20) NOT NULL DEFAULT '0'
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `cluster_log` (
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `clusterId` INT(11) NOT NULL UNIQUE,
  `kafka` VARCHAR(255) NOT NULL,
  `zookeeper` VARCHAR(255) NOT NULL,
  `imageName` VARCHAR(255) NOT NULL,
  `imageTag` VARCHAR(255) NULL DEFAULT NULL,
  `registry` VARCHAR(255) NULL DEFAULT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `code_config` (
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `projectId` INT(11) NOT NULL DEFAULT '0',
  `codeManager` VARCHAR(255) NULL DEFAULT '0',
  `codeSource` VARCHAR(255) NULL DEFAULT '0',
  `codeSshUrl` VARCHAR(255) NULL DEFAULT '0',
  `codeHttpUrl` VARCHAR(255) NULL DEFAULT '0',
  `codeId` INT(11) NULL DEFAULT '0',
  `userInfo` INT(11) NOT NULL DEFAULT '0'
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `conf_file` (
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `projectId` INT(11) NOT NULL DEFAULT '0',
  `confFile` VARCHAR(255) NOT NULL DEFAULT '0',
  `targetFile` VARCHAR(255) NOT NULL DEFAULT '0'
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `deployEvent` (
  `eid` BIGINT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `deployId` BIGINT(20) NULL DEFAULT NULL,
  `operation` VARCHAR(255) NULL DEFAULT NULL,
  `eventStatus` VARCHAR(255) NULL DEFAULT NULL,
  `statusExpire` BIGINT(20) NULL DEFAULT NULL,
  `content` VARCHAR(10240) NULL DEFAULT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `deploymentStatus` (
  `id` INT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `deployId` INT(20) NULL DEFAULT NULL UNIQUE,
  `status` VARCHAR(255) NULL DEFAULT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `deploymentExtra` (
  `deployId` INT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `content` TEXT NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `dockerfile` (
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  `projectId` INT(11) NOT NULL DEFAULT '0',
  `baseImageName` VARCHAR(255) NULL DEFAULT NULL,
  `baseImageTag` VARCHAR(255) NULL DEFAULT NULL,
  `baseImageRegistry` VARCHAR(255) NULL DEFAULT NULL,
  `installCmd` TEXT NULL,
  `codePath` VARCHAR(255) NOT NULL,
  `workDir` VARCHAR(255) NULL DEFAULT NULL,
  `dockerEnv` TEXT NULL,
  `compileCmd` TEXT NULL,
  `dockerCmd` TEXT NOT NULL,
  `user` VARCHAR(255) NULL DEFAULT NULL,
  `createTime` BIGINT(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `dockerfile_content` (
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `projectId` INT(11) NOT NULL DEFAULT '0',
  `buildId` INT(11) NOT NULL DEFAULT '0',
  `content` TEXT NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `dockerfile_info` (
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `projectId` INT(11) NOT NULL DEFAULT '0',
  `buildPath` VARCHAR(255) NOT NULL DEFAULT '0',
  `branch` VARCHAR(255) NULL DEFAULT '0',
  `dockerfilePath` VARCHAR(255) NOT NULL DEFAULT '0'
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `env_conf` (
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `projectId` INT(11) NOT NULL DEFAULT '0',
  `envKey` VARCHAR(255) NOT NULL DEFAULT '0',
  `envValue` VARCHAR(255) NOT NULL DEFAULT '0',
  `description` TEXT NULL,
  `type` VARCHAR(255) DEFAULT 'PROJECT' NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `gitlab_info` (
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `userId` INT(11) NOT NULL DEFAULT '0',
  `name` VARCHAR(255) NOT NULL DEFAULT '0',
  `token` VARCHAR(255) NOT NULL DEFAULT '0',
  `createTime` BIGINT(20) NOT NULL DEFAULT '0'
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `global` (
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `type` VARCHAR(255) NOT NULL,
  `value` VARCHAR(4096) NOT NULL,
  `createTime` BIGINT(20) NOT NULL DEFAULT '0',
  `lastUpdate` BIGINT(20) NOT NULL DEFAULT '0'
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `healthChecker` (
  `id` INT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `deployId` INT(20) NOT NULL UNIQUE,
  `type` VARCHAR(255) NULL DEFAULT NULL,
  `port` INT(11) NOT NULL,
  `timeout` INT(11) NOT NULL,
  `url` VARCHAR(255) NULL DEFAULT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `kube_build` (
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `buildId` INT(11) NOT NULL DEFAULT '0',
  `jobName` VARCHAR(255) NOT NULL DEFAULT '0',
  `jobStatus` VARCHAR(255) NOT NULL DEFAULT '0',
  `jobType`VARCHAR(255) DEFAULT 'PROJECT' NOT NULL,
  UNIQUE INDEX (`buildId`, `jobType`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `load_balancer` (
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(1024) NULL DEFAULT NULL,
  `state` VARCHAR(128) NOT NULL,
  `createTime` BIGINT(20) NULL DEFAULT NULL,
  `removeTime` BIGINT(20) NULL DEFAULT NULL,
  `removed` TINYINT(4) NOT NULL DEFAULT '0',
  `data` MEDIUMTEXT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `uniq_port_index` (
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `lbid` INT(11) NOT NULL,
  `port` INT(11) NOT NULL,
  `clusterId` INT(11) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `project_basic` (
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `type` VARCHAR(255) NULL DEFAULT NULL,
  `description` TEXT NULL,
  `stateless` INT(11) NULL DEFAULT NULL,
  `dockerfile` INT(11) NULL DEFAULT NULL,
  `createTime` BIGINT(20) NULL DEFAULT NULL,
  `lastModify` BIGINT(20) NULL DEFAULT NULL,
  `authority` INT(11) NULL DEFAULT NULL,
  `status` INT(11) NULL DEFAULT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `resource_history` (
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `resourceType` VARCHAR(255) NOT NULL DEFAULT '0',
  `resourceId` INT(11) NOT NULL DEFAULT '0',
  `operation` VARCHAR(255) NOT NULL DEFAULT '0',
  `userId` INT(11) NOT NULL DEFAULT '0',
  `createTime` BIGINT(20) NOT NULL DEFAULT '0',
  `status` VARCHAR(255) NULL DEFAULT '0'
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `rsa_keypair` (
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `projectId` INT(11) NOT NULL UNIQUE,
  `keyId` INT(11) NOT NULL,
  `privateKey` TEXT NOT NULL,
  `publicKey` TEXT NOT NULL,
  `fingerPrint` VARCHAR(255) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `sys_admin_roles` (
  `userId` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `role` VARCHAR(255) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `sys_groups` (
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(255) NULL DEFAULT NULL,
  `createTime` DATETIME NULL DEFAULT NULL,
  `update_time` DATETIME NULL DEFAULT NULL,
  `status` INT(11) NULL DEFAULT '1'
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `sys_resources` (
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `resource_id` INT(11) NOT NULL,
  `resource_type` VARCHAR(50) NOT NULL,
  `owner_id` INT(11) NOT NULL,
  `owner_type` VARCHAR(50) NOT NULL,
  `role` VARCHAR(255) NOT NULL,
  `update_time` DATETIME NULL DEFAULT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `sys_users` (
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `username` VARCHAR(50) NOT NULL,
  `password` VARCHAR(50) NOT NULL,
  `salt` VARCHAR(50) NULL DEFAULT NULL,
  `email` VARCHAR(50) NULL DEFAULT NULL,
  `phone` VARCHAR(20) NULL DEFAULT NULL,
  `login_type` VARCHAR(50) NOT NULL,
  `createTime` DATETIME NULL DEFAULT NULL,
  `update_time` DATETIME NULL DEFAULT NULL,
  `status` VARCHAR(50) NULL DEFAULT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `sys_user_group` (
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `group_id` INT(11) NOT NULL,
  `user_id` INT(11) NOT NULL,
  `role` VARCHAR(255) NOT NULL,
  `update_time` DATETIME NULL DEFAULT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `upload_file` (
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `projectId` INT(11) NOT NULL,
  `path` VARCHAR(255) NOT NULL,
  `md5` VARCHAR(255) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `upload_file_content` (
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255) NOT NULL DEFAULT '0',
  `md5` VARCHAR(255) NOT NULL DEFAULT '0' UNIQUE,
  `content` LONGBLOB NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `inner_service` (
  `id` INT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `deployId` INT(20) NOT NULL,
  `name` VARCHAR(20) NULL DEFAULT NULL,
  `protocol` VARCHAR(20) NULL DEFAULT NULL,
  `port` INT(11) NOT NULL,
  `targetPort` INT(11) NULL DEFAULT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `monitor_targets` (
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `target` VARCHAR(10240) NULL DEFAULT NULL,
  `createTime` DATETIME NULL DEFAULT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS k8s_events (
  `id` INT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `version` VARCHAR(255) NOT NULL,
  `cluster_name` VARCHAR(255) NOT NULL,
  `namespace` VARCHAR(255) NOT NULL,
  `event_kind` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `host` VARCHAR(255),
  `content` TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE INDEX `index1` ON k8s_events(`cluster_name`, `namespace`, `event_kind`, `host`);
CREATE INDEX `index2` ON k8s_events(`cluster_name`, `name`);

CREATE TABLE IF NOT EXISTS `monitor_targets` (
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `target` VARCHAR(10240) NULL DEFAULT NULL,
  `createTime` DATETIME NULL DEFAULT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `project` (
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(1024) NULL DEFAULT NULL,
  `state` VARCHAR(128) NOT NULL,
  `createTime` BIGINT(20) NULL DEFAULT NULL,
  `removeTime` BIGINT(20) NULL DEFAULT NULL,
  `removed` TINYINT(4) NOT NULL DEFAULT '0',
  `data` MEDIUMTEXT NULL,
  `authority` TINYINT(4) NOT NULL DEFAULT '0'
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `admin_roles` (
  `userId` INT(11) NOT NULL PRIMARY KEY,
  `role` VARCHAR(255) NOT NULL DEFAULT '0'
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `build_history` (
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(1024) NULL DEFAULT NULL,
  `state` VARCHAR(128) NOT NULL,
  `createTime` BIGINT(20) NOT NULL DEFAULT '0',
  `removeTime` BIGINT(20) NULL DEFAULT NULL,
  `removed` TINYINT(4) NOT NULL DEFAULT '0',
  `data` MEDIUMTEXT NULL,
  `authority` INT(11) NOT NULL DEFAULT '0'
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `gitlab_user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `userId` INT(11) NOT NULL DEFAULT '0',
  `name` VARCHAR(255) NOT NULL COMMENT 'username in gitlab',
  `token` VARCHAR(255) NOT NULL,
  `createTime` BIGINT(20) NOT NULL DEFAULT '0'
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `operation_history` (
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `resourceId` INT(11) NOT NULL,
  `resourceType` VARCHAR(255) NOT NULL,
  `operation` VARCHAR(255) NOT NULL,
  `userId` INT(11) NOT NULL,
  `userName` VARCHAR(255) NOT NULL,
  `status` VARCHAR(255) NOT NULL,
  `message` MEDIUMTEXT NOT NULL,
  `operateTime` BIGINT(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `project_rsakey_map` (
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `projectId` INT(11) NOT NULL,
  `rsaKeypairId` INT(11) NOT NULL,
  `keyId` INT(11) NOT NULL,
  `state` VARCHAR(128) NOT NULL,
  `createTime` BIGINT(20) NOT NULL DEFAULT '0'
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `users` (
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `username` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `salt` VARCHAR(255) NULL DEFAULT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `phone` VARCHAR(255) NULL DEFAULT NULL,
  `loginType` VARCHAR(255) NOT NULL,
  `createTime` BIGINT(20) NOT NULL DEFAULT '0',
  `updateTime` BIGINT(20) NOT NULL DEFAULT '0',
  `state` VARCHAR(128) NULL DEFAULT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `user_group_map` (
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `groupId` INT(11) NOT NULL,
  `userId` INT(11) NOT NULL,
  `role` VARCHAR(255) NOT NULL COMMENT 'role name',
  `updateTime` BIGINT(20) NULL DEFAULT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `deployment` (
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(1024) NULL DEFAULT NULL,
  `state` VARCHAR(128) NOT NULL,
  `createTime` BIGINT(20) NOT NULL DEFAULT '0',
  `removeTime` BIGINT(20) NULL DEFAULT NULL,
  `removed` TINYINT(4) NOT NULL DEFAULT '0',
  `data` MEDIUMTEXT NULL,
  `updateTime` BIGINT(20) DEFAULT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `version` (
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(1024) DEFAULT NULL,
  `state` VARCHAR(128) NOT NULL,
  `createTime` BIGINT(20) DEFAULT NULL,
  `removeTime` BIGINT(20) DEFAULT NULL,
  `removed` TINYINT(4) NOT NULL DEFAULT '0',
  `data` MEDIUMTEXT NULL,
  `deployId` INT(11) DEFAULT NULL,
  `version` BIGINT(20) DEFAULT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `resources` (
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `resourceId` INT(11) NOT NULL COMMENT 'projectId or deployId',
  `resourceType` VARCHAR(255) NOT NULL COMMENT 'PROJECT or DEPLOY or CLUSTER',
  `ownerId` INT(11) NOT NULL COMMENT 'userId or groupId',
  `ownerType` VARCHAR(255) NOT NULL COMMENT 'USER or GROUP',
  `role` VARCHAR(255) NOT NULL COMMENT 'role name',
  `updateTime` BIGINT(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `cluster` (
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(1024) DEFAULT NULL,
  `state` VARCHAR(128) NOT NULL,
  `createTime` BIGINT(20) DEFAULT NULL,
  `removeTime` BIGINT(20) DEFAULT NULL,
  `removed` TINYINT(4) NOT NULL DEFAULT '0',
  `data` MEDIUMTEXT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `load_balancer` (
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(1024) DEFAULT NULL,
  `state` VARCHAR(128) NOT NULL,
  `createTime` BIGINT(20) DEFAULT NULL,
  `removeTime` BIGINT(20) DEFAULT NULL,
  `removed` TINYINT(4) NOT NULL DEFAULT '0',
  `data` MEDIUMTEXT
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `load_balancer_deploy_map` (
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(1024) DEFAULT NULL,
  `state` VARCHAR(128) NOT NULL,
  `createTime` BIGINT(20) DEFAULT NULL,
  `removeTime` BIGINT(20) DEFAULT NULL,
  `removed` TINYINT(4) NOT NULL DEFAULT '0',
  `data` MEDIUMTEXT,
  `deployId` INT(11) DEFAULT NULL,
  `loadBalancerId` INT(11) DEFAULT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- test, test
insert into sys_users(username, password, salt, login_type, status) VALUES ('admin','5fdf2372d4f23bdecfd2b8e8d7aacce1','0ea3abcf42700bb1bbcca6c27c92a821','USER','NORMAL');
insert into sys_users(username, password, salt, login_type, status) VALUES ('test','060b125a2e2de865ccc0f06367bc3491','831d1215e1bcbe99419a3e8f88edb869','USER','NORMAL');
insert into sys_users(username, password, salt, login_type, status) VALUES ('csf','a190c9f28a28a1d7667f50830d8bf6d5','db5474a6e19613a7081506e2910f5dc4','USER','NORMAL');
insert into users(username, password, salt, loginType, state) VALUES ('admin','5fdf2372d4f23bdecfd2b8e8d7aacce1','0ea3abcf42700bb1bbcca6c27c92a821','USER','NORMAL');
insert into users(username, password, salt, loginType, state) VALUES ('test','060b125a2e2de865ccc0f06367bc3491','831d1215e1bcbe99419a3e8f88edb869','USER','NORMAL');
insert into global(type, value) VALUES ('LDAP_SERVER','ldap://ldap.sohu-inc.com:389');
insert into global(type, value) VALUES ('LDAP_PREFIX','@sohu-inc.com');
insert into sys_admin_roles(role) VALUES ('admin');
INSERT INTO admin_roles(userId, role) VALUES ('1', 'admin');
INSERT INTO cluster(name, state, removed, data) VALUES ('mycluster', 'RUNNING', '0', '{"api":"10.16.42.200:8080", "ver":1, "fqcn": "org.domeos.framework.api.model.cluster.Cluster"}');

CREATE TABLE `testmodel1` (
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(1024) NULL DEFAULT NULL,
  `state` VARCHAR(128) NOT NULL,
  `createTime` BIGINT(20) NOT NULL DEFAULT '0',
  `removeTime` BIGINT(20) NULL DEFAULT NULL,
  `removed` TINYINT(4) NOT NULL DEFAULT '0',
  `data` MEDIUMTEXT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `testmodel2` (
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(1024) NULL DEFAULT NULL,
  `state` VARCHAR(128) NOT NULL,
  `createTime` BIGINT(20) NOT NULL DEFAULT '0',
  `removeTime` BIGINT(20) NULL DEFAULT NULL,
  `removed` TINYINT(4) NOT NULL DEFAULT '0',
  `data` MEDIUMTEXT NULL,
  `column1` INT(11)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

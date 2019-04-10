
"Ghost User":
    created to hold all issues authored by users that have since been deleted.
    this user cannot be removed

External User: 外部用户
Internal User: 内部用户

Impersonate 扮演  是什么意思

## users
Guest
Reporter
Developer
Maintainer
Owner

## Group
Group Path: 分组路径，相当于分组的名称空间
Group Name: 分组名称
Description: 分组头像
Visibility Level: 访问级别
    1. Privity 分组及分组下的项目只有该组下的成员才能访问
    1. Internal 只要登录的用户都可以访问该分组及其任何Internal项目
    1. Public 任何用户不需要认证就可以访问该分组及其任何Public项目

## Project
Project Path: 可以选择分组和用户。如果选择用户，则表示该项目归属于某个用户，反之则表示归属于某个分组
Project Name: 项目名称
Project Description: 项目描述
Visibility Level: 访问级别
    1. Private 只有授权的用户才能访问
    1. Internal 任何登录的用户都能访问
    1. Public 任何用户无需认证都能访问

注意：
    如果Project Path选择某一分组，则项目的Visibility Level受分组的Visibility Level限制，如：
    若分组的Visibility Level是Private, 则项目的Visibility Level只能是Private
    若分组的Visibility Level是Internal, 则项目的Visibility Level只能是 Internal 和 Private
    以此类推


Two-factory authentication  双因素身份验证













package main

import rego.v1

default allow := false

allow if {
	has_permission(input.roles, input.resource, data.permissions)
}

has_permission(user_roles, resource, permissions) if {
	some role in user_roles
	resource in permissions[role].resources
}

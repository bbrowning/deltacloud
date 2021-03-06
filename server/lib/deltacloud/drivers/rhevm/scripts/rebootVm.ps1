#
# Copyright (C) 2009  Red Hat, Inc.
#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.  The
# ASF licenses this file to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance with the
# License.  You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
# License for the specific language governing permissions and limitations
# under the License.

param([string]$scriptsDir,
        [string]$username,
        [string]$password,
        [string]$domain,
        [string]$id)
# Get the common functions
. "$scriptsDir\common.ps1"
verifyLogin $username $password $domain
# The AppliacationList causes the YAML pain, so Omit it
stop-vm $id | format-list -Property $VM_PROPERTY_LIST
beginOutput
start-vm $id | format-list -Property $VM_PROPERTY_LIST
endOutput
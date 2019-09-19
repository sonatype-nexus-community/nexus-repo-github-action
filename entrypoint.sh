#!/bin/sh -l

# Copyright (c) 2019-present Sonatype, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

export JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk
export PATH=$JAVA_HOME/bin:$PATH

groovy /opt/sonatype/bin/NexusPublisher.groovy --serverurl $1 --username $2 --password $3 --format $4 --repository $5 --filename $GITHUB_WORKSPACE/$8 $(echo -C$6 | sed 's/ / -C/g') $(echo -A$7 | sed 's/ / -A/g')
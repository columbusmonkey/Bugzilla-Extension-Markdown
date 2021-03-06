# -*- Mode: perl; indent-tabs-mode: nil -*-
#
# The contents of this file are subject to the Mozilla Public
# License Version 1.1 (the "License"); you may not use this file
# except in compliance with the License. You may obtain a copy of
# the License at http://www.mozilla.org/MPL/
#
# Software distributed under the License is distributed on an "AS
# IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
# implied. See the License for the specific language governing
# rights and limitations under the License.
#
# The Original Code is the Markdown Bugzilla Extension.
#
# The Initial Developer of the Original Code is Gavin Shelley
# Portions created by the Initial Developer are Copyright (C) 2012 the
# Initial Developer. All Rights Reserved.
#
# Contributor(s):
#   Gavin Shelley <columbusmonkey@me.com>

package Bugzilla::Extension::Markdown;
use strict;
use base qw(Bugzilla::Extension);

use Text::Markdown 'markdown';

our $VERSION = '0.02';

sub bug_finalize_comment {
    my ($self, $args) = @_;

    my $text_ref = $args->{text};

    return unless $text_ref;

    my $html = markdown($$text_ref);

    ${$args->{text}} = $html;

}

__PACKAGE__->NAME;


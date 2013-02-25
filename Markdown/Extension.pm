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

# This code for this is in ./extensions/Markdown/lib/Util.pm
use Bugzilla::Extension::Markdown::Util;

use Text::Markdown 'markdown';

our $VERSION = '0.01';

# See the documentation of Bugzilla::Hook ("perldoc Bugzilla::Hook" 
# in the bugzilla directory) for a list of all available hooks.

my $pre = 0;

sub bug_format_comment {
  my ($self, $args) = @_;

  return unless $pre;

  my $regexes = $args->{regexes};
  my $text_ref = $args->{text};

  return unless $regexes && $text_ref;
  warn "A" . markdown($$text_ref);
  push(@$regexes, { match => qr/^.*$/s,
		    replace => markdown($$text_ref) });

}

sub bug_finalize_comment {
    my ($self, $args) = @_;

    return if $pre;

    my $text_ref = $args->{text};

    return unless $text_ref;
 warn "AA: " . $$text_ref;
    my $html = markdown($$text_ref);
    warn "AB: " . $html;
    ${$args->{text}} = $html;

}

__PACKAGE__->NAME;


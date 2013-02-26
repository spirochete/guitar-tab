guitar-tab
==========

This is a Rails/MongoDB app for hosting guitar tabs.
It uses Sunspot (Solr) for full-text searching and Devise for user management.

Tabs are searchable by artist, song, and tuning, using Edge N-gram filtering.
The UI is simple and uncluttered, driven mostly by search. Users can manage
and keep track of their own tabs.


Required:
- Ruby >= 1.9.3
- MongoDB >= 2.0.4


Getting Started

1. bundle
2. bundle exec sunspot-installer
3. bundle exec sunspot-solr start -s solr
4. rake sunspot:mongo:reindex

You'll probably want to configure a mailer.
See <a href="https://github.com/plataformatec/devise">Devise</a> for instructions.

The minimum gram size for searching (i.e. number of characters in a string) is 2.
The maximum is 15. This might make your server weep. To change this, check out solr/conf/schema.xml:63-70

If you're feeling adventurous, check out <a href="https://wiki.apache.org/solr/AnalyzersTokenizersTokenFilters">Apache's Solr wiki</a>
to modify search filters according to your needs.

Beware of quirky interactions with Mongo Mapper, however; if you
get strange errors about filters not existing, look up Mongo Mapper + filter before you tear your hair out.
I hear Mongoid is a little more friendly, but it's also a little more complex.


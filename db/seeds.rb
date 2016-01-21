# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'loading tags....'

if Tag.table_exists?
  tags = [
    # Ruby系
    { id: 1, name: 'ruby', official_name: 'Ruby', is_active: true },
    { id: 2, name: 'rails', official_name: 'Ruby on Rails', is_active: true },
    { id: 3, name: 'sinatra', official_name: 'Sinatra', is_active: true },
    { id: 4, name: 'gem', official_name: 'Gem', is_active: true },
    { id: 5, name: 'rspec', official_name: 'RSpec', is_active: true },

    # Java系
    { id: 6, name: 'java', official_name: 'Java', is_active: true },
    { id: 7, name: 'junit', official_name: 'JUnit', is_active: true },
    { id: 8, name: 'groovy', official_name: 'Groovy', is_active: true },
    { id: 9, name: 'gradle', official_name: 'Gradle', is_active: true },

    # PHP系
    { id: 10, name: 'php', official_name: 'PHP', is_active: true },
    { id: 11, name: 'symfony', official_name: 'Symfony', is_active: true },
    { id: 12, name: 'cakephp', official_name: 'CakePHP', is_active: true },
    { id: 13, name: 'zend', official_name: 'ZendFramework', is_active: true },
    { id: 14, name: 'wordpress', official_name: 'WordPress', is_active: true },
    { id: 15, name: 'doctrine', official_name: 'Doctrine', is_active: true },
    { id: 16, name: 'phpunit', official_name: 'PHPUnit', is_active: true },
    { id: 17, name: 'laravel', official_name: 'Laravel', is_active: true },
    { id: 18, name: 'composer', official_name: 'Composer', is_active: true },
    { id: 19, name: 'phpmyadmin', official_name: 'phpMyAdmin', is_active: true },

    { id: 20, name: 'perl', official_name: 'Perl', is_active: true }
  ]

  tags.each do |t|
    tag = Tag.find_or_create_by(id: t[:id])
    if tag.new_record?
      tag.attributes = t
      tag.save!
    end
  end
end

puts 'done!'

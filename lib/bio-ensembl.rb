# #
# = bio-ensembl.rb
#
# Copyright::   Copyright (C) 2009 Jan Aerts <http://jandot.myopenid.com>
#               Francesco Strozzi <francesco.strozzi@gmail.com>
#                           
# License::     The Ruby License
#
# @author Jan Aerts
# @author Francesco Strozzi

module Ensembl
  ENSEMBL_RELEASE = 60
  
  class Session
    attr_accessor :coord_systems
    attr_accessor :seqlevel_id, :seqlevel_coord_system
    attr_accessor :toplevel_id, :toplevel_coord_system
    attr_accessor :coord_system_ids #map CS id to CS name
    attr_accessor :seq_regions
    attr_accessor :collection_species

    def initialize
      @coord_systems = Hash.new # key = id; value = CoordSystem object
      @coord_system_ids = Hash.new # key = id; value = name
      @seq_regions = Hash.new
    end
    
    def reset
      @coord_systems = Hash.new
      @coord_system_ids = Hash.new
      @seq_regions = Hash.new
      @seqlevel_id = nil
      @toplevel_id = nil
      @seqlevel_coord_system = nil
      @toplevel_coord_system = nil
      @collection_species = nil
    end
  end

  SESSION = Ensembl::Session.new

end

require 'rubygems'
begin
  require 'bio'
rescue LoadError
    raise LoadError, "You must have bioruby installed"
end

begin
  require 'mysql'
rescue LoadError
  raise LoadError, "You must have Mysql Gem installed"
end

begin
  require 'active_record'
rescue LoadError
  raise LoadError, "You must have ActiveRecord installed"
end



# Database connection
require File.join('bio-ensembl','db_connection.rb')

# Core modules
require File.join('bio-ensembl','core','activerecord.rb')
require File.join('bio-ensembl','core','transcript.rb')
require File.join('bio-ensembl','core','slice.rb')
require File.join('bio-ensembl','core','project.rb')
require File.join('bio-ensembl','core','transform.rb')
require File.join('bio-ensembl','core','collection.rb')

# Variation modules
require File.join('bio-ensembl','variation','activerecord.rb')
require File.join('bio-ensembl','variation','variation.rb')


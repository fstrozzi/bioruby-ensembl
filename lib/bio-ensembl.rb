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
    attr_accessor :release

    def initialize
      @coord_systems = Hash.new # key = id; value = CoordSystem object
      @coord_system_ids = Hash.new # key = id; value = name
      @seq_regions = Hash.new
      @release = ENSEMBL_RELEASE
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



# BioRuby
require 'bio'

# Database connection
require 'active_record'
require 'bio-ensembl/db_connection'

# Core modules
require 'bio-ensembl/core/activerecord'
require 'bio-ensembl/core/transcript'
require 'bio-ensembl/core/slice'
require 'bio-ensembl/core/project'
require 'bio-ensembl/core/transform'
require 'bio-ensembl/core/collection'

# Variation modules
require 'bio-ensembl/variation/activerecord'

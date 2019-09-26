#!/bin/env ruby

require 'thor'
require 'fileutils'
require 'pry'
require 'colorize'

EXPERIMENT_BIN_FILE = __FILE__

EXPERIMENT_ROOT=Pathname.new(File.dirname EXPERIMENT_BIN_FILE)

ENSTART_ROOT = EXPERIMENT_ROOT.parent

ENSTART_CONFIG_DIR = ENSTART_ROOT.join('config')

ENSTART_CONFIG_FILE = ENSTART_CONFIG_DIR.join('config.yml')
ENSTART_STATE_FILE = ENSTART_CONFIG_DIR.join('state.yml')

ENSTART_DEFAULT_CONFIG = {
  experiment: {

  }

}

ENSTART_DEFAULT_STATE = {
  experiment: {
    experiments: [
    ]
  }
}

class Config

  attr_accessor :config

  def initialize(file, default = {})
    @config_file = file
    @default = default
    @children = []
    reload!
  end

  def [](key)
    @config[key.to_s] || @config[key]
  end

  def []= (key, value)
    @config[key.to_s] = value
  end

  def save!
    File.open(@config_file, 'w') do |file|
      file.write YAML.dump(@config)
    end
  end

  def reload!
    @config = YAML.load(IO.read @config_file) rescue @default
    @children.each do |child, path|
      child.update(@config.dig(path))
    end
  end

  def node(*path)
    node = @config.dig(*path)
    node = ConfigNode.new(node, self)
    @children << [node, path]
    node
  end
end

class ConfigNode
  def initialize(node, root, default = {})
    @root = root
    @node = node
    @default = default
  end

  def update(new_node)
    @node = new_node
  end

  def [](key)
    @node[key.to_s] || @node[key]
  end

  def []= (key, value)
    @node[key.to_s] = value
  end

  def save!
    @root.save!
  end

  def reload!
    @root.reload!
  end

end


WD = Pathname.new(Dir.getwd)

ENSTART_CONFIG = Config.new(ENSTART_CONFIG_FILE, ENSTART_DEFAULT_CONFIG)
ENSTART_STATE = Config.new(ENSTART_STATE_FILE, ENSTART_DEFAULT_STATE)

EXPERIMENT_CONFIG = ENSTART_CONFIG.node(:experiment)
EXPERIMENT_STATE = ENSTART_STATE.node(:experiment)

class Experiment < Thor
  @@state = EXPERIMENT_STATE

  desc "create NAME", "create experiment"
  def create(name)
    dir = WD.join(name)

    if Dir.exist?(dir)
      puts "Directory #{name} already exists!"
      return
    end

    puts "Creating #{name}"
    Dir.mkdir(dir)
    experiment = {name: name, directory: dir.to_s}
    @@state[:experiments] << experiment
    @@state.save!
  end

  desc "paths", "get experiment paths"
  def paths()
    puts bin_paths.join(':')
  end

  private

    def bin_paths
      @@state[:experiments].map{|experiment| experiment_bin_path(Pathname.new experiment[:directory])}
    end

    def experiment_bin_path(experiment_path)
      experiment_path.join('bin')
    end
end

Experiment.start

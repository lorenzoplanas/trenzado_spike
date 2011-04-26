# encoding: utf-8
require "bundler/setup"
Bundler.require :production
require "./config.rb"

ActiveRecord::Base.establish_connection Qindio::Config::DB
ActiveRecord::Base.include_root_in_json = false
require "./person.rb"
require "./user.rb"

module Qindio
  module App
    class Producer < Sinatra::Base
      include Qindio::Persister

      get "/users.json" do
        User.all.to_json
      end

      post "/users.json" do
        user = User.new(params[:user])
        user.save
        user.to_json
      end

      get "/users/:id.json" do
        User.find(params[:id]).to_json
      end

      put "/users/:id.json" do
        user = User.find(params[:id])
        user.update_attributes(params[:user])
        user.to_json["user"]
      end

      get "/people.json" do
        Person.all.to_json
      end

      post "/people.json" do
        person = Person.new(params[:person])
        person.save
        person.to_json
      end

      get "/people/:id.json" do
        Person.find(params[:id]).to_json
      end

      put "/people/:id.json" do
        person = Person.find(params[:id])
        person.update_attributes(params[:person])
        person.to_json
      end
    end # Producer
  end # App
end # Qindio

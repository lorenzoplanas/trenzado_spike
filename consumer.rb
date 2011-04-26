# encoding: utf-8
require "bundler/setup"
Bundler.require :production
require "./config.rb"

ActiveRecord::Base.establish_connection Qindio::Config::DB
require "./fake_person.rb"
require "./fake_user.rb"

module Qindio
  module App
    class Consumer < Sinatra::Base
      include Qindio::Persister

      get "/users" do
        User.all.to_xml
      end

      post "/users" do
        user = User.new(params[:user])
        user.save
        user.to_xml
      end

      get "/users/:id" do
        User.get(params[:id]).to_xml
      end

      get "/users/:id/person" do
        Person.get(User.find(params[:id]).person_id).to_json
      end

      put "/users/:id" do
        user = User.get(params[:id])
        user.update_attributes(params[:person])
        user.to_xml
      end

      get "/people" do
        Person.get(:all).to_xml
      end

      post "/people" do
        person = Person.new(params[:person])
        Person.post(person)
        person.to_xml
      end

      get "/people/:id" do
        Person.get(params[:id]).to_xml
      end

      put "/people/:id" do
        person = Person.get(params[:id])
        person.put(params[:person])
        person.to_xml
      end
    end # Producer
  end # App
end # Qindio

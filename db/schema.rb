# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140410192355) do

  create_table "consultas", force: true do |t|
    t.integer  "medico_id"
    t.integer  "usuario_id"
    t.time     "hora_marcacao"
    t.time     "hora_atendimento"
    t.boolean  "anonimo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "data_consulta"
  end

  create_table "estados", force: true do |t|
    t.string   "nome",       limit: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medicos", force: true do |t|
    t.string   "CRM"
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nome_pesquisavel"
    t.integer  "estado_id"
  end

  create_table "usuarios", force: true do |t|
    t.string   "nome"
    t.string   "email"
    t.string   "senha"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

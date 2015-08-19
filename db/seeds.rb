# coding: utf-8

user = User.new(email: 'gokingyo@sil.com', password: 'gokingyo', password_confirmation: 'gokingyo', name: "ご金魚")
user.save
user.confirm!
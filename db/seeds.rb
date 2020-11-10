# coding: utf-8

User.create!( name: "Sample User",
              email: "sample@email.com",
              password: "password",
              password_confirmation: "password")
              
Task.create!( name: "タスク１",
              description: "タスク１のお仕事",
              user_id: 1)
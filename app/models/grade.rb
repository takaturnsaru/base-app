class Grade < ActiveHash::Base

  self.data = [
                {id:0, name: "---"},{id: 1, name: "Grade-A"},
                {id:2, name: "Grade-B"},{id:3, name: "Grade-C"},
                {id:4, name: "Grade-D"}
                ]
              end
class Artist < ApplicationRecord
    has_many :plays
    has_many :instruments, through: :plays

    validates :name, presence: {message: "error: An artist must have a name"}
    validates :title, uniqueness: {message: "error: An artist must have a unique title"}
end

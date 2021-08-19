class Company < ActiveRecord::Base
    has_many :freebies
    has_many :devs, through: :freebies

    def give_freebie(dev, item_name, value)
        self.freebies.create(company_id: self, dev_id: dev.id, item_name: item_name, value: value)
    end

    def self.oldest_company
        self.all.where(founding_year: 1995)
    end

    # def self.oldest_company
    #     Company.all.order(:founding_year).first
    #   end
end

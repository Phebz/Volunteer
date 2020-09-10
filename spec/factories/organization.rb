FactoryBot.define do
  factory :mission do
    name { 'Helping people' }
    description { '3 days outside delivering food for homeless people' }
    capacity { 2 }
    location { 'Thouars' }
    address { '16 rue Diderot' }
    start_date { Date.today + 1.day }
    end_date { Date.today + 1.day }
    organization_id { 1 }
    user_id { 3 }
  end
end

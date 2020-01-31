# frozen_string_literal: true

def notice

  return if Notice.any?

  100.times do
    publish_start_datetime = Faker::Time.between(from: 1.year.ago, to: 1.month.after)

    if Faker::Boolean.boolean(true_ratio: 0.1)
      publish_end_datetime = Faker::Time.between(
        from: publish_start_datetime, to: publish_start_datetime.next_month
      )
    else
      publish_end_datetime = nil
    end

    Notice.create(
      title: Faker::Lorem.sentence,
      body: Faker::Lorem.paragraph,
      publish_start_datetime: publish_start_datetime,
      publish_end_datetime: publish_end_datetime,
    )
  end

end

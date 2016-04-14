Given /the following hotspots exist/ do |hotspots_table|
  hotspots_table.hashes.each do |hotspot|
    new_hotspot = Hotspot.create!(hotspot)
  end
end

Then /I should only see unique hotspots/ do
    num_markers = Hotspot.uniq.pluck(:location, :issue_type).count
    expect(page).to have_selector('#markers img', count: num_markers)
end

Then /I should see overlapping hotspots as one hotspot/ do
  pending # Write code here that determines hotspots within one block radius of each other
end

When /^(?:|I )select occurred time ([0-9 ]+[A|P]M), ([0-9]{2})$/ do |hour, minutes|
  select(hour, :from => "hotspot_time_4i")
  select(minutes, :from => "hotspot_time_5i")
end

When /^(?:|I )select occurred date ([0-9]{4}), ([a-zA-Z]+), ([0-9]{1})$/ do |year, month, day|
   select(year, :from => "hotspot_occurred_time_1i")
   select(month, :from => "hotspot_occurred_time_2i")
   select(day, :from => "hotspot_occurred_time_3i")
end

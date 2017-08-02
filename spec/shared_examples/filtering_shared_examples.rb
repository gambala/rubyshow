# frozen_string_literal: true

RSpec.shared_context 'normally working filter' do
  it 'shows courses that match filtering constraint' do
    expect(page).to have_content('Course_A')
  end

  it 'does not show courses that have been filtered' do
    expect(page).not_to have_content('Course_B')
  end

  it 'resets filter after reset button pressed' do
    find(:css, '#reset_filter').click
    expect(page).to have_content('Course_A')
    expect(page).to have_content('Course_B')
  end
end

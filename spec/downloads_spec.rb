require 'spec_helper'

describe Caplinked::Client, :vcr => true do
  let!(:client) { Caplinked::Client.new api_key: ENV["API_KEY"], api_scheme: 'https' }

  it 'create a zip file' do
    VCR.use_cassette("downloads/folder_downloads") do

      create_zip_file = client.create_zip_file workspace_id: 5886, download: { folder_ids: [32277,32339] }

      #need update
      expect(create_zip_file).to eq({:id=>create_zip_file[:id], :user_id=>2,
          :file_ids=>[], :folder_ids=>[32277,32339], :status=>"building_directory",
          :created_at=>create_zip_file[:created_at]})
    end
  end

end

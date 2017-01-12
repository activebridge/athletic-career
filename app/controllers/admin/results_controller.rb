class Admin::ResultsController < AdminsController
  def import_csv
    parse_csv(params['csv']['file'].tempfile)
    redirect_to admin_results_path
  end

  private

  def parse_csv(file)
    results = CSV.foreach(file, headers: false)
    results.each do |result|
      r = Result.find_or_initialize_by(name: result[0], bib_number: result[1], age: result[2], category: result[3], gun_time: result[4], chip_time: result[5], position: result[6], category_position: result[7], gender: result[8])
      r.save(validate: false)
    end
  rescue
    flash[:error] = 'Oy'
  end
end

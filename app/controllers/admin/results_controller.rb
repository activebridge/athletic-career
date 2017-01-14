class Admin::ResultsController < AdminsController
  def import_csv
    parse_csv(params['csv']['file'].tempfile, params[:distance].to_i)
    redirect_to admin_results_path
  end

  private

  def parse_csv(file, distance)
    results = CSV.foreach(file, headers: false)
    results.each do |result|
      r = Result.find_or_initialize_by(distance_id: distance, position: result[0], bib_number: result[1], name: result[2], category: result[3], category_position: result[4], gun_time: result[5], chip_time: result[6], gender: result[7], age: result[8])
      r.save(validate: false)
    end
  rescue
    flash[:error] = 'Oy'
  end
end

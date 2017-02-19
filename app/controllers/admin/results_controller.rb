class Admin::ResultsController < AdminsController
  expose :distance, -> { Distance.find(params[:distance].to_i) }
  expose :results, -> { distance.results }
  expose :protocols, -> { Protocol.all }

  def import_csv
    parse_csv(params['csv']['file'].tempfile, params[:distance].to_i)

    redirect_to admin_results_path
    protocols.each { |protocol| ResultJob.perform_later(protocol, results) }
  end

  private

  def parse_csv(file, distance)
    results = CSV.foreach(file, headers: false)
    results.each do |result|
      r = result_into(result, distance)
      r.save(validate: false)
    end
  rescue
    flash[:error] = 'Oy'
  end

  def result_into(result, distance)
    Result.find_or_initialize_by(distance_id: distance, position: result[0], bib_number: result[1], name: result[2].downcase, category: result[3], category_position: result[4], gun_time: result[5], chip_time: result[6], gender: result[7], age: result[8])
  end
end

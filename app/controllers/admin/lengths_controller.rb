class Admin::LengthsController < AdminsController
  expose :lengths, -> { Length.all }
  expose :length

  def create
    return redirect_to admin_lengths_path if length.update(length_params)
    render :new
  end

  def update
    create
  end

  def destroy
    length.destroy
    redirect_to admin_lengths_url, notice: 'Length was successfully destroyed.'
  end

  private

  def length_params
    params.require(:length).permit!
  end
end

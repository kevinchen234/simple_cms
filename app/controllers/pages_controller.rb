class PagesController < ApplicationController
  def index
    @pages = Page.order("position ASC")
  end

  def show
    @page = Page.find(params[:id])
    @subject = @page.subject
  end

  def new
    @page = Page.new({ subject_id: params[:subject_id] })
    @subjects = Subject.order("position ASC")
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] = "Page created successfully."
      redirect_to(pages_path)
    else
      @subjects = Subject.order("position ASC")
      render("new")
    end
  end

  def edit
    @page = Page.find(params[:id])
    @subjects = Subject.order("position ASC")
  end

  def update
    @page = Page.find(params[:id])
    if @page.update(page_params)
      flash[:notice] = "Page updated successfully."
      redirect_to(pages_path)
    else
      @subjects = Subject.order("position ASC")
      render("edit")
    end
  end

  def delete
    @page = Page.find(params[:id])
    @subject = @page.subject
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    flash[:notice] = "Page '#{@page.name}' destroyed successfully."
    redirect_to(pages_path)
  end

  private

  def page_params
    params.require(:page).permit(
      :name,
      :visible,
      :position,
      :permalink,
      :content,
      :subject_id
    )
  end
end

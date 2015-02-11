class SectionNotesController < ApplicationController
  before_action :set_section_note, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def notes
    @section = Section.find(params[:id])
    @section_note = SectionNote.new
  end

  def create
    @section_note = SectionNote.new(section_note_params)
    @section_note.save
    @section = @section_note.section
    redirect_to section_notes_path
  end

  def index
    @section_notes = SectionNote.all
    respond_with(@section_notes)
  end

  def show
    respond_with(@section_note)
  end

  def new
    @section_note = SectionNote.new
    respond_with(@section_note)
  end

  def edit
  end

  def update
    @section_note.update(section_note_params)
    respond_with(@section_note)
  end

  def destroy
    @section_note.destroy
    respond_with(@section_note)
  end

  private
    def set_section_note
      @section_note = SectionNote.find(params[:id])
    end

    def section_note_params
      params.require(:section_note).permit(:section_id, :content)
    end
end
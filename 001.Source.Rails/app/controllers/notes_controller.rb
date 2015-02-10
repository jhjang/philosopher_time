class NotesController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:create]

  def index
    begin
      result = 0

      uuid = params[:uuid]

      if uuid.nil?
        notes = Note.all.limit(50)
      else
        notes = Device.find_by_uuid(uuid).notes.order(worked_at: :desc)
      end
    rescue Exception => e
      logger.debug e.message
      logger.debug e.backtrace.join("\n")
      result = 202
    ensure
      render json: {"result" => result, "notes" => notes_to_json(notes)}
    end
  end

  def create
    begin
      result = 0

      note = Note.new(note_params)
      note.save!
    rescue Exception => e
      logger.debug e.message
      logger.debug e.backtrace.join("\n")
      result = 202
    ensure
      render json: {"result" => result}
    end
  end

  private
  def note_params
    device = Device.find_by_uuid(params[:uuid])
    params.permit(:worked_at, :av_number, :av_label, :rate, :comment).merge(device: device)
  end

  def notes_to_json(notes)
    results = []
    notes.each do |note|
      hash = {
        "av_label" => note.av_label.nil? ? "" : note.av_label,
        "av_number" => note.av_number.nil? ? "" : note.av_number,
        "rate" => note.rate.nil? ? 0 : note.rate,
        "comment" => note.comment.nil? ? "" : note.comment,
        "worked_at" => note.worked_at.nil? ? "" : note.worked_at.strftime("%F %T")
      }

      results << hash
    end

    results
  end
end

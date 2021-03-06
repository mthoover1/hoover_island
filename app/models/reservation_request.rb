class ReservationRequest < ActiveRecord::Base
  belongs_to :person
  belongs_to :reservation_status

  validates_presence_of :person_id, :start_date, :end_date
  validate :end_date_after_start_date, :trip_duration

  before_create :set_as_pending

  def status
    reservation_status.status
  end

  private

  def end_date_after_start_date
    if dates_present? && start_date > end_date
      errors.add(:start_date, "must be before end date")
    elsif dates_present? && start_date == end_date
      errors.add(:start_date, "can't be the same as end date")
    end
  end

  def trip_duration
    if dates_present? && (end_date - start_date).to_i > 21
      errors.add(:end_date, "can't be more than three weeks after start date")
    end
  end

  def dates_present?
    start_date && end_date
  end

  def set_as_pending
    pending_status = ReservationStatus.find_by_status('Pending')
    self.reservation_status_id = pending_status.id
  end
end

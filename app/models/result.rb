# frozen_string_literal: true

class Result < ApplicationRecord
  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true
  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_next_question, on: :update
  before_create :set_finish_timer

  SUCCESS_RATIO = 85

  def finish!
    self.score = pass_percentage
    self.passed = true if success_pass?
    self.finish_at = Time.zone.now
    save!
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def test_passage_completed?
    current_question.nil?
  end

  def pass_percentage
    (correct_questions * 100.0 / test.questions.count).round(1)
  end

  def success_pass?
    pass_percentage >= SUCCESS_RATIO
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def before_validation_set_next_question
    self.current_question = next_question unless test_passage_completed?
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def set_finish_timer
    return if test.timer == false

    self.finish_until = (Time.zone.now + (test.time * 60))
  end
end

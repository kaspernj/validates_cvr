class CvrValidator < ActiveModel::EachValidator
  MOD_11_WEIGHTS = [2, 7, 6, 5, 4, 3, 2].freeze

  def validate_each(record, attribute, value)
    return record.errors.add(attribute, :blank) if value.blank?

    digits = convert_to_digits(value)

    record.errors.add(attribute, :too_short) if digits.length < 8
    record.errors.add(attribute, :too_long) if digits.length > 8
    record.errors.add(attribute, :bad_format) unless value.match?(/\A[\s\d-]+\z/)
    record.errors.add(attribute, :invalid_cvr_number) unless valid_check_digit?(digits)
  end

private

  def valid_check_digit?(digits)
    serial = digits[0, 7]
    expected_check_digit = digits[-1]

    weighted_serials = serial.zip(MOD_11_WEIGHTS).map { |digit, weight| digit * weight }
    mod = weighted_serials.sum % 11
    actual_check_digit = mod.zero? ? 0 : 11 - mod

    actual_check_digit == expected_check_digit
  end

  def convert_to_digits(value)
    value.to_s.gsub(/\D/, "").chars.map(&:to_i)
  end
end

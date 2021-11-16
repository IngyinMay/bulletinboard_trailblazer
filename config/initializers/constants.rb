module Constants
  USER_ROLES = {
    'Level1' => 1,
    'Level2' => 2
  }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  VALID_DATE_FORMAT = /\d{4}-\d{2}-\d{2}/
  POST_CSV_HEADER = ["id", "title", "description", "public_flag"]
  POST_CSV_FORMAT_HEADER = ["title", "description", "public_flag"]
  POST_FILTER = {
    'All' => 1,
    'Own Posts' => 2,
    'Other Posts' => 3,
}
end

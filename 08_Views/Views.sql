CREATE
OR REPLACE VIEW `users_loan_vw` AS
SELECT
  u.user_id,
  u.name,
  u.email,
  u.username,
  COUNT(u.user_id) AS amount_loans
FROM
  `users` AS u
  INNER JOIN `users_books` AS ub ON u.user_id = ub.user_id
GROUP BY
  u.user_id;
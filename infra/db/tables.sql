CREATE TABLE users (
  id uuid DEFAULT gen_random_uuid(),
  email VARCHAR(50) NOT NULL,
  username VARCHAR(50) NOT NULL
  PRIMARY KEY(id)
);

CREATE TABLE follow(
  follower uuid NOT NULL,
  followee uuid NOT NULL,
  CONSTRAINT fk_follower
    FOREIGN KEY(follower)
    REFERENCES users(id),
  CONSTRAINT fk_followee
    FOREIGN KEY(followee)
    REFERENCES users(id)
);

CREATE TABLE post(
  id uuid DEFAULT gen_random_uuid(),
  title VARCHAR(100) NOT NULL,
  content VARCHAR NOT NULL,
  created_by uuid NOT NULL,
  created_at TIMESTAMP DEFAULT now(),
  PRIMARY KEY(id),
  CONSTRAINT fk_created_by
    FOREIGN KEY users(id)
);

CREATE TABLE attachment (
  id uuid DEFAULT gen_random_uuid(),
  post_id uuid NOT NULL,
  url VARCHAR NOT NULL,
  PRIMARY KEY(id),
  CONSTRAINT fk_post
    FOREIGN KEY post(id)
);

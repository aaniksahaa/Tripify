const express = require('express');
const { validationResult } = require('express-validator');
const { getSingleComment, getComments, createComment, updateComment, deleteComment } = require('../controllers/comment');
const router = express.Router();

router.get('/:comment_id', async (req, res, next) => {
  try {
    const comment = await getSingleComment(req.params);
    console.log(comment);
    res.json(comment);
  } catch (err) {
    console.log(err);
    next(err);
  }
});

router.get('/', async (req, res, next) => {
  try {
    const comments = await getComments(req.query);
    console.log(comments);
    res.json(comments);
  } catch (err) {
    console.log(err);
    next(err);
  }
});

router.post('/', async (req, res, next) => {
  const result = validationResult(req);
  console.log(req.body);
  if (result.isEmpty() === false) {
    return res.send({ errors: result.array() });
  }

  req.body.user_id = req.user ? req.user.user_id : 1;

  try {
    const comment = await createComment(req.body);
    res.json(comment);
  } catch (error) {
    next(error);
  }
});

router.put('/', async (req, res, next) => {
  const result = validationResult(req);
  if (result.isEmpty() === false) {
    return res.send({ errors: result.array() });
  }

  user_id = req.user ? req.user.user_id : 1;

  const comment = await getSingleComment({ comment_id: req.body.comment_id });

  if (user_id != comment.user_id) {
    next({ message: 'Oops, hacker moment, nice try!' });
    return;
  }

  try {
    const comment = await updateComment(req.body);
    res.json(comment);
  } catch (error) {
    next(error);
  }
});

router.delete('/:comment_id', async (req, res, next) => {
  const result = validationResult(req);
  if (result.isEmpty() === false) {
    return res.send({ errors: result.array() });
  }

  user_id = req.user ? req.user.user_id : 1;

  const comment = await getSingleComment({ comment_id: req.params.comment_id });

  if (user_id != comment.user_id) {
    next({ message: 'Oops, hacker moment, nice try!' });
    return;
  }

  try {
    const comment = await deleteComment(req.params);
    res.json(comment);
  } catch (error) {
    next(error);
  }
});

module.exports = router;

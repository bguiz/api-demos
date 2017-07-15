'use strict';

const express = require('express');
const bodyParser = require('body-parser');

const server = express();

server.use(bodyParser.json());

server.get('/api/v1/hello-query', (req, res) => {
	const name = req.query.name;
	res.status(200).json({
		hello: name,
	});
});

server.post('/api/v1/hello-parse', (req, res) => {
	const name = req.body.name;
	res.status(200).json({
		hello: name,
	});
});

module.exports = server;

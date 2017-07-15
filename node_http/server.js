'use strict';

const http = require('http');
const querystring = require('querystring');

const server = http.createServer((req, res) => {
	const { method, url: fullUrl } = req;
	const { url, params } = extractQueryParams(fullUrl);

	switch (`${method} ${url}`) {
		case 'GET /api/v1/hello-query':
			handleGetHello(req, params, writeResponse);
			break;
		case 'POST /api/v1/hello-parse':
			handlePostHello(req, params, writeResponse);
			break;
		default:
			handleNotFound(writeResponse);
	}

	function writeResponse(err, output) {
		res.writeHead(output.status, {
			'Content-Type': 'application/json',
		});
		res.end(JSON.stringify(output.body));
	}

});

function handleGetHello(req, params, errback) {
	errback(undefined, {
		status: 200,
		body: {
			hello: params.name,
		},
	});
}

function handlePostHello(req, params, errback) {
	extractBody(req, (err, body) => {
		if (err) {
			errback(undefined, {
				status: 400,
				error: err,
			});
		} else {
			errback(undefined, {
				status: 200,
				body: {
					hello: body.name,
				},
			});
		}
	});
}

function handleNotFound(errback) {
	errback(undefined, {
		status: 404,
		body: {},
	});
}

function extractQueryParams(fullUrl) {
	const [url, maybeParams] = fullUrl.split('?');
	const params = (maybeParams) ? querystring.parse(maybeParams) : {};
	return {
		url,
		params,
	};
}

function extractBody(req, errback) {
	const chunks = [];
	let error;
	req.on('data', (chunk) => {
		chunks.push(chunk);
	}).on('error', (err) => {
		error = err;
		errback('unable to read post body');
	}).on('end', () => {
		if (error) {
			return;
		}
		const bodyText = Buffer.concat(chunks).toString();
		console.log('bodyText', bodyText);
		let body;
		try {
			body = JSON.parse(bodyText);
		} catch (ex) {
			errback('unable to parse post body');
		}
		errback(undefined, body);
	});
}

module.exports = server;

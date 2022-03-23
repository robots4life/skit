// import adapter from '@sveltejs/adapter-auto';

import adapter from '@sveltejs/adapter-node';

/** @type {import('@sveltejs/kit').Config} */
const config = {
	kit: {
		// adapter: adapter(),
		// https://github.com/sveltejs/kit/tree/master/packages/adapter-node
		adapter: adapter({ out: 'build' }),
		vite: {
			server: {
				host: '0.0.0.0',
				port: 3000
			},
			define: {
				// env-cmd https://blog.hdks.org/Environment-Variables-in-SvelteKit-and-Vercel/
				'process.env': process.env
			}
		}
	}
};

export default config;

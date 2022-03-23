// import adapter from '@sveltejs/adapter-auto';

import adapter from '@sveltejs/adapter-node';
import preprocess from 'svelte-preprocess';

/** @type {import('@sveltejs/kit').Config} */
const config = {
	// Consult https://github.com/sveltejs/svelte-preprocess
	// for more information about preprocessors
	preprocess: preprocess(),

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
				// env-cmd
				'process.env': process.env
			}
		}
	}
};

export default config;
